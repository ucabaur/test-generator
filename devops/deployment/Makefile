BASE_IMAGE_TAG="testwill/base:latest"
BACKEND_IMAGE_TAG="testwill/backend:latest"
STATIC_IMAGE_TAG="testwill/static:latest"
TMP_SRC=.src/

ARCHIVE_TARGET=./archive.zip
TMP_ARCHIVE_DIR=.archive/

define copy_source
	rsync -a ../../backend $1 --exclude "*.pyc" --exclude __pycache__
	rsync -a ../../frontend $1 --exclude node_modules --exclude "*.test.js"
endef

define docker_build
	docker build --tag $2 --file $1 $3 .
	@echo "🐳  Docker image \033[1;44m $2 \033[0m built"
endef

.PHONY: images base backend_image clean

images: clean backend_image static_image clean

base: $(TMP_SRC)
	$(call docker_build,base/Dockerfile,$(BASE_IMAGE_TAG))

backend_image: base
	$(call docker_build,backend/Dockerfile,$(BACKEND_IMAGE_TAG))

static_image: base
	$(call docker_build,static/Dockerfile,$(STATIC_IMAGE_TAG))

$(TMP_SRC):
	mkdir -p $(TMP_SRC)
	$(call copy_source,$(TMP_SRC))

$(ARCHIVE_TARGET): $(TMP_ARCHIVE_DIR)
	cd $(TMP_ARCHIVE_DIR) && zip "../$(ARCHIVE_TARGET)" -q -r *

$(TMP_ARCHIVE_DIR):
	mkdir -p $(TMP_ARCHIVE_DIR)
	sed 's:BACKEND_REPO_URL:$(BACKEND_REPO_URL):; s:STATIC_REPO_URL:$(STATIC_REPO_URL):; s:ENV:$(env):' Dockerrun.aws.json > $(TMP_ARCHIVE_DIR)/Dockerrun.aws.json

clean:
	rm -rf $(TMP_SRC) $(TMP_ARCHIVE_DIR)
