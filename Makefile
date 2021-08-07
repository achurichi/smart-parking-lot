build-imgs:
	docker build -t backend-db ./splot_backend-db/
	docker build -t vehicle-detection-api ./splot_vehicle-detection/

up:
	docker-compose up -d

all: build-imgs up