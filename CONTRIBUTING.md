gh auth login --scopes "delete_repo"

gh repo create testrepo --add-readme --description "Description of testrepo" --public

gh repo delete $(gh api user --jq '.login')/testrepo --yes