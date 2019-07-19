all: build

build: .aws-sam/build/template.yaml
	@echo building using sam-cli ...

.aws-sam/build/template.yaml: template.yaml
	sam build --debug

package: build
	cd .aws-sam/build && sam package --output-template-file packaged.yaml --s3-bucket ${TEMPLATE_BUCKET} --s3-prefix ${TEMPLATE_PREFIX}

clean:
	rm -rf .aws-sam

.PHONY: build package clean
