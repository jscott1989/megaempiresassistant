flutter build web
cp additional_web_files/* build/web
git add build/web/*
git commit -m "Web Deploy"
git subtree push --prefix build/web origin gh-pages

