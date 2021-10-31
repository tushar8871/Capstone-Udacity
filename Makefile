setup:
	python3 -m venv capstone
	
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1202 app.py
	
all: install lint