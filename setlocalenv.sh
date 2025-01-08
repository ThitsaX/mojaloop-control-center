yq '.' environment.yaml > environment.json
for var in $(jq -r 'to_entries[] | "\(.key)=\(.value)"' ./environment.json); do export $var; done
export IAC_TERRAFORM_MODULES_TAG=$iac_terraform_modules_tag
export IAC_TEMPLATES_TAG=$IAC_TERRAFORM_MODULES_TAG
export CONTROL_CENTER_CLOUD_PROVIDER=$control_center_cloud_provider
export destroy_ansible_playbook="mojaloop.iac.control_center_post_destroy"
export d_ansible_collection_url="git+https://github.com/thitsax/iac-ansible-collection-roles.git#/mojaloop/iac"
export destroy_ansible_inventory="$ANSIBLE_BASE_OUTPUT_DIR/control-center-post-config/inventory"
export destroy_ansible_collection_complete_url=$d_ansible_collection_url,$ansible_collection_tag
export ANSIBLE_BASE_OUTPUT_DIR=$PWD/output
export TF_STATE_BASE_ADDRESS="https://${GITLAB_URL}/api/v4/projects/${PROJECT_ID}/terraform/state"
export GITLAB_URL=$(jq -r '.gitlab_hosts_var_maps.server_hostname' environment.json)
export GITLAB_SERVER_TOKEN=$(jq -r '.gitlab_hosts_var_maps.server_token' environment.json)
export DOMAIN=$(jq -r '.all_hosts_var_maps.base_domain' environment.json)
export PROJECT_ID=$(jq -r '.docker_hosts_var_maps.gitlab_bootstrap_project_id' environment.json)

export PRIVATE_REPO_USER=$private_repo_user
export PRIVATE_REPO_TOKEN=$private_repo_token
export PRIVATE_REPO=$
export TF_HTTP_USERNAME="root"
export TF_HTTP_LOCK_METHOD="POST"
export TF_HTTP_UNLOCK_METHOD="DELETE"
export TF_HTTP_RETRY_WAIT_MIN="5"
export TF_HTTP_PASSWORD=$GITLAB_SERVER_TOKEN