install:
	pip3 install -r ./src/packages/requirements.txt -t ./src/packages/python
	rm -r ./src/packages/python/*dist-info

