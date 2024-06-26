create-dirs:
	mkdir -p .db-data .db-images db-backup/backups .ui-images/logo .ui-images/banner

build-imgs:
	docker build -t backend-db ./splot_backend-db/
	docker build -t vehicle-detection-api ./splot_vehicle-detection/	
	docker build -t crontab-backup ./splot_crontab-backup/

w-imgs:
	docker build -t backend-db ./splot_backend-db/	
	docker build -t crontab-backup ./splot_crontab-backup/


up:
	docker-compose up -d

all: create-dirs up

backend: 
	docker build -t backend-db ./splot_backend-db/
	docker-compose up -d backend-db

one img:
	docker build -t $(img) ./splot_$(img)/
	docker-compose up -d $(img)

clean:
	rm -rf .db-data .db-images .ui-images
