"""empty message

Revision ID: f4058a14811a
Revises: 060947e47983
Create Date: 2023-07-25 17:32:59.577074

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f4058a14811a'
down_revision = '060947e47983'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('answer_voter', schema=None) as batch_op:
        batch_op.add_column(sa.Column('answer_id', sa.Integer(), nullable=False))
        batch_op.drop_constraint('fk_answer_voter_question_id_question', type_='foreignkey')
        batch_op.create_foreign_key(batch_op.f('fk_answer_voter_answer_id_answer'), 'answer', ['answer_id'], ['id'], ondelete='CASCADE')
        batch_op.drop_column('question_id')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('answer_voter', schema=None) as batch_op:
        batch_op.add_column(sa.Column('question_id', sa.INTEGER(), nullable=False))
        batch_op.drop_constraint(batch_op.f('fk_answer_voter_answer_id_answer'), type_='foreignkey')
        batch_op.create_foreign_key('fk_answer_voter_question_id_question', 'question', ['question_id'], ['id'], ondelete='CASCADE')
        batch_op.drop_column('answer_id')

    # ### end Alembic commands ###