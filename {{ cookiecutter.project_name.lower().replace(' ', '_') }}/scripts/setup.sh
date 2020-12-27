#!/bin/bash
# Create a github_repo from the command line...so cool (more here: https://developer.github.com/v3/repos/#create)
# I should probably implement some check if the creation was successful
#curl -u '{{ cookiecutter.github_username }}' https://api.github.com/user/repos -d '{"name":"{{ cookiecutter.project_name.lower().replace(' ', '_') }}", "private":{{ cookiecutter.repo_private }}}'

cd ..
if [ "{{ cookiecutter.repo_private }}" = "true" ]
then
    gh repo create {{ cookiecutter.project_name.lower().replace(' ', '_') }} --private --confirm
else
    gh repo create {{ cookiecutter.project_name.lower().replace(' ', '_') }} --public  --confirm
fi

# Link local repository to git
#git init
cd {{ cookiecutter.project_name.lower().replace(' ', '_') }}
git add *
git add .gitignore .stickler.yml .travis.yml
git commit -m 'first commit'
git remote add origin git@github.com:{{ cookiecutter.github_username }}/{{ cookiecutter.project_name.lower().replace(' ', '_') }}.git
git push -u origin master
