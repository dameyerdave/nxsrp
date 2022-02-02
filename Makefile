build:
	@docker build . -t dameyerdave/nxsrp

deploy: build
	@docker push dameyerdave/nxsrp