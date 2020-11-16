# Python

## Venv

```sh
# create .venv
python3 -m venv --prompt <venv_name> .venv

# load venv
source .venv/bin/activate

# install deps
pip install <dep>

# dump installed packages
pip freeze > requirements.txt

# load packages from requirements.txt
pip install -r requirements.txt
```
