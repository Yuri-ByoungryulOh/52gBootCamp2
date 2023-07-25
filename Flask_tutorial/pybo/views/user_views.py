from flask import Blueprint, render_template, url_for, request, flash, session, g
from werkzeug.utils import redirect
from werkzeug.security import generate_password_hash, check_password_hash
from pybo import db
from pybo.models import User
from pybo.forms import UserForm, UserLoginForm
from datetime import datetime
import functools

bp = Blueprint('user', __name__, url_prefix='/user')

@bp.route('/create/', methods=('POST','GET'))
def user_create():
    form=UserForm()
    
    if request.method=='POST' and form.validate_on_submit():
        user=User.query.filter_by(user_name=form.user_name.data).first()
        if not user:
        
            user = User(user_name=form.user_name.data, password=generate_password_hash(form.password1.data), 
                        email=form.email.data, create_date=datetime.now())
            db.session.add(user)
            db.session.commit()
            return redirect(url_for('main.index'))
        else:
            flash('이미 존재하는 사용자입니다.')
    return render_template('user/user_create.html', form=form)

@bp.route('/login/', methods=('GET', 'POST'))
def login():
    form = UserLoginForm()
    if request.method == 'POST' and form.validate_on_submit():
        error=None
        user = User.query.filter_by(user_name=form.user_name.data).first()
        if not user:
            error = '존재하지 않는 아이디 입니다'
        elif not check_password_hash(user.password, form.password.data):
            error = '비밀번호가 틀렸습니다'
        if error is None:
            session.clear()
            session['user_id'] = user.id
            _next = request.args.get('next','')
            if _next:
                return redirect(_next)
            else:
                return redirect(url_for('main.index'))
        flash(error)
    return render_template('user/login.html', form=form)

@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')
    if user_id is None:
        g.user = None
    else:
        g.user = User.query.get(user_id)
        
@bp.route('/logout')        
def logout():
    session.clear()
    return redirect(url_for('main.index'))


def login_required(view):
    @functools.wraps(view)
    def wrapped_view(*args, **kwargs):
        if g.user is None:
            _next = request.url if request.method =='GET' else ''
            return redirect(url_for('user.login', next=_next))
        return view(*args, **kwargs)
    return wrapped_view