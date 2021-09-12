build-imgs:
	docker build -t backend-db ./splot_backend-db/
	docker build -t vehicle-detection-api ./splot_vehicle-detection/	
up:
	docker-compose up -d

all: build-imgs up

one img:
	docker build -t $(img) ./splot_$(img)/
	docker-compose up -d $(img)