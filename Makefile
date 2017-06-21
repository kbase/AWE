all: docker_image

docker_image:
	./build_awe_image.sh

docker_image_test:
	docker-compose up -d mongo
	sleep 30
	docker-compose up mongoinit
	docker-compose up -d kb_awe
