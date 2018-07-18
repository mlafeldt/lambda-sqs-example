ENV     = staging
FUNCS   = worker
SERVICE = $(shell awk '/^service:/ {print $$2}' serverless.yml)

staging: ENV=staging
staging: deploy

production: ENV=production
production: deploy

deploy:
	serverless deploy --stage $(ENV) --verbose

deploy_funcs = $(FUNCS:%=deploy-%)

$(deploy_funcs):
	serverless deploy function --function $(@:deploy-%=%) --stage $(ENV) --verbose

destroy:
	serverless remove --stage $(ENV) --verbose

logs_funcs = $(FUNCS:%=logs-%)

$(logs_funcs):
	serverless logs --function $(@:logs-%=%) --stage $(ENV) --tail --no-color
