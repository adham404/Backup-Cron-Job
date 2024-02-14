.PHONY: pre-build cronjob-build

all: pre-build cronjob-build

pre-build:
	@chmod u+x ./CronBackup.sh
	@if [ -z "$(backupdir)" ]; then \
		echo "Please enter argument (backupdir)"; \
		exit 1; \
	else \
		if [ ! -d "$(backupdir)" ]; then \
			echo "Backup folder directory doesn't exist... Backup folder directory created"; \
			mkdir $(backupdir); \
		fi \
	fi
	@if [ -z "$(dir)" ]; then \
		echo "Please enter argument (dir)"; \
		exit 2; \
	fi
	@if [ -z "$(max-backups)" ]; then \
		echo "Please enter argument (max-backups)"; \
		exit 4; \
	fi


cronjob-build:
	@touch input
	@echo "* * * * * '`pwd`/CronBackup.sh' '`pwd`/$(dir)' '`pwd`/$(backupdir)' $(max-backups)" >> input
	@crontab input
	@rm input
