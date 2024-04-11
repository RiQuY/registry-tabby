all: README.md models.json

README.md: clean models.json
	./scripts/generate_readme.py

models.json: clean
	yq -o=json -I2 '.' meta/models.yaml > models.json

clean:
	rm README.md models.json &> /dev/null || true
