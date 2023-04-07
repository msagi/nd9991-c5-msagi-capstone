app_version=v1.0.0
app_name=msagi-capstone
docker_path=msaginwm/${app_name}

setup:
	python3 -m venv ./.venv

install:
	mkdir -p ./bin
	wget -O ./bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
	chmod +x ./bin/hadolint
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	./bin/hadolint Dockerfile
	pylint **.py

dockerbuild:
	docker build -t ${docker_path}:${app_version} .

dockerpush: dockerbuild
	docker push ${docker_path}:${app_version}

all: install lint test
