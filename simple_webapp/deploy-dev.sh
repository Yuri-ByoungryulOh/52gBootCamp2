#!/bin/sh
flutter build web  --web-renderer html &&
aws s3 sync ./build/web s3://yuri.52g.academy/ &&
aws cloudfront create-invalidation --distribution-id E159KDB2AJVQ2J --paths '/*'