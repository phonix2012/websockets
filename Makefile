export PYTHONASYNCIODEBUG=1
export PYTHONPATH=src

style:
	isort --recursive src tests
	black --skip-string-normalization src tests

test:
	python -W default -m unittest

coverage:
	python -m coverage erase
	python -W default -m coverage run -m unittest
	python -m coverage html

clean:
	find . -name '*.pyc' -o -name '*.so' -delete
	find . -name __pycache__ -delete
	rm -rf .coverage build compliance/reports dist docs/_build htmlcov MANIFEST README websockets.egg-info
