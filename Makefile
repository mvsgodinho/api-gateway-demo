test: test_deps reload
	pytest -sv ./tests/spec/
	
reload:
	docker-compose exec web nginx -s reload

test_deps:
	pip install -r requirements.txt
	
start:
	docker-compose up -d --build

stop:
	docker-compose down