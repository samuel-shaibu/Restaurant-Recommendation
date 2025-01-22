#Install dependencies
install:
	pip install --upgrade pip &&  pip install -r requirements.txt

# Run tests
#test:
		# @if [ ! -f Dataset.csv ]; then \
			# echo "Error: Dataset.csv not found. Please add the file to the project directory and try again."; \
			# exit 1; \
		# fi
		# pytest --nbval book.ipynb

#Lint the code
lint:
		jupyter nbconvert --to script book.ipynb
		pylint --disable=R,C,E1123,W0104,W0621,W0613 book.py
		rm -f book.py

#Format Code
format:
	black book.ipynb

all: install lint format