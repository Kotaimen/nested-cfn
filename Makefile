source:
	zip -x '.git/*' -x '.idea*' -x '.env' -x '*.zip' -9 -FS package.zip -r  .
	aws s3 cp package.zip s3://${TEMPLATE_BUCKET}/input/

build:
	@$(MAKE) -C stacks/sample-service/data-tier build
	@$(MAKE) -C stacks/sample-service/simple-api build

package:
	@$(MAKE) -C stacks/sample-service/data-tier package
	@$(MAKE) -C stacks/sample-service/simple-api package

clean:
	@$(MAKE) -C stacks/sample-service/data-tier clean
	@$(MAKE) -C stacks/sample-service/simple-api clean
