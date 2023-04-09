app_version=v1.0.0
app_name=msagi-capstone
docker_path=msaginwm/${app_name}

setup:
	python3 -m venv .venv

install:
	mkdir -p ./bin
	wget -O ./bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64
	chmod +x ./bin/hadolint
	pip install --no-cache-dir --upgrade pip==23.0.1 &&\
		pip install --no-cache-dir bandit==1.7.5 pip-audit==2.5.4 &&\
		pip install --no-cache-dir -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	./bin/hadolint Dockerfile
	pylint **.py

sast:
	pip-audit -r requirements.txt
	bandit app.py

dockerimage:
	docker build -t ${docker_path}:${app_version} .
	docker push ${docker_path}:${app_version}

deploy:
	kubectl apply -f ./deployment/k8s-deployment.yml
	kubectl describe deployment msagi-capstone-app
	kubectl apply -f ./deployment/k8s-service.yml
	kubectl describe service msagi-capstone-app
	kubectl apply -f ./deployment/k8s-autoscaler.yml
	kubectl get pods -o wide
	# kubectl port-forward service/msagi-capstone-app 8000:8000

all: install lint test
