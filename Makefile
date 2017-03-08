GREEN='\033[0;32m'
NC='\033[0m' # No Color
TERRAFORM = docker run -i -t --rm -v `pwd`:/data --workdir=/data hashicorp/terraform:light

test: terraform-validate
	@echo -e "[$(GREEN)√$(NC)] test passed"

validate: terraform-fmt terraform-validate	## Validate syntax

plan: terraform-validate terraform-get terraform-plan ## Plan changes

apply: terraform-validate terraform-get terraform-apply ## Apply Changes

destroy: terraform-destroy	## Destroy infrastructure

output: terraform-output		## Display State Output

terraform-validate:
	$(TERRAFORM) validate

terraform-get:
	$(TERRAFORM) get

terraform-plan:
	$(TERRAFORM) plan

terraform-apply:
	$(TERRAFORM) apply

terraform-fmt:
	$(TERRAFORM) fmt -list

terraform-destroy:
	$(TERRAFORM) destroy

terraform-output:
	$(TERRAFORM) output