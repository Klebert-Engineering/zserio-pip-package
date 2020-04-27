#!/usr/bin/env bash
set -eu

echo "------------- Building Zserio Bundle -------------"
echo ""

cd zserio-official
ant install
ant -f compiler/extensions/java install
ant -f compiler/extensions/cpp install
ant -f compiler/extensions/python install
ant zserio_bundle.install
cd ..

echo ""
echo "------------------- GIT Remove -------------------"
echo ""

# Remove old zserio runtime sources, but keep gen.py
mv "src/zserio/gen.py" "src/zserio/gen.py.keep"
git rm "src/zserio/*.py"
mv "src/zserio/gen.py.keep" "src/zserio/gen.py"

echo ""
echo "---------- Packaging Zserio JAR/Runtime ----------"
echo ""

cp -rf zserio-official/distr/zserio.jar src/zserio
cp -rf zserio-official/compiler/extensions/python/runtime/src/zserio/* src/zserio
echo "from .gen import *" >> src/zserio/__init__.py

echo ""
echo "---------------- Updating Version ----------------"
echo ""

ZSERIO_VERSION=$(java -jar zserio-official/distr/zserio.jar -version | sed "s/version //g")
echo "$ZSERIO_VERSION" > zserio-version.txt
echo "Zserio version: $ZSERIO_VERSION"

echo ""
echo "--------------------- GIT Add --------------------"
echo ""

git add zserio-version.txt
git add "src/zserio/*.py"

echo ""
echo "----------------------- Done ---------------------"
