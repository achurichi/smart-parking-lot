SPLOT_MAKEFILE_PATH:=$(realpath $(dir $(lastword $(MAKEFILE_LIST))))

create-dirs:
	mkdir -p .db-data .db-images db-backup/backups .ui-images/logo .ui-images/banner

add-cronjob:
	rm -f db-backup/backup-cron
	echo '* * * * * sh $(SPLOT_MAKEFILE_PATH)/db-backup/backup.sh' >> db-backup/backup-cron
	# echo '0 3 1 * * sh $(SPLOT_MAKEFILE_PATH)/db-backup/backup.sh' >> db-backup/backup-cron
	crontab db-backup/backup-cron

build-imgs:
	docker build -t backend-db ./splot_backend-db/
	docker build -t vehicle-detection-api ./splot_vehicle-detection/	

up:
	docker-compose up -d

all: create-dirs add-cronjob build-imgs up

one img:
	docker build -t $(img) ./splot_$(img)/
	docker-compose up -d $(img)

clean:
	sudo rm -rf .db-data .db-images .ui-images