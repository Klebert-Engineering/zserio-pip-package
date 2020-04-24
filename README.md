# zserio-pip-package

PyPI package infrastructure around Zserio. For extensive
documentation on the zserio language, please have a look
at [zserio.org](http://zserio.org).

## Installation

Just run

```bash
pip3 install zserio
```

Alternatively, clone this repository, and run

```bash
pip3 install -e .
```

## Importing zserio package sources

```py
import zserio

# Automatically inserts a new python module called `mypackage`
#  into the current python environment
zswag.package("mypackage/all.zs", package_prefix="mypackage")

# You can now access structs from your zserio sources!
from mypackage.all import CoolStruct
```

## Running tests

Just execute

```bash
pytest test
```

## HOWTO: Deploy a new PIP package for a new Zserio version 

* __Step 1:__ Update the `zserio-official` submodule to the required version.
* __Step 2:__ Execute `./update.sh`
* __Step 3:__ Add/Commit/Push:
  * `git add "src/**"`
  * `git add "zserio-version.txt"`
  * `git commit ...`
  * `...`
* __Step 4:__ Execute `./deploy.sh`
