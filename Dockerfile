FROM buildpack-deps:buster

# install terraform
ENV TERRAFORM_VERSION=0.12.18

RUN set -ex \
  && TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
  && echo Terraform URL: $TERRAFORM_URL \
  && curl --silent --show-error --location --fail --retry 3 --output /tmp/terraform.zip "${TERRAFORM_URL}" \
  && unzip /tmp/terraform.zip -d /usr/bin \
  && rm /tmp/terraform.zip \
  && which terraform \
  && (terraform version || true)
