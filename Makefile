build-imgs:
	docker build -t vehicle-detection-api ./splot_vehicle-detection/

up:
	docker-compose up -d

all: build-imgs up