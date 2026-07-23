#!/bin/bash

set -e

echo "====================================="
echo "Installing Quarto"
echo "====================================="

QUARTO_VERSION="1.10.15"

wget https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb

sudo dpkg -i quarto-${QUARTO_VERSION}-linux-amd64.deb

rm quarto-${QUARTO_VERSION}-linux-amd64.deb

echo "====================================="
echo "Installing Julia"
echo "====================================="

curl -fsSL https://install.julialang.org | sh -s -- --yes

export PATH="$HOME/.juliaup/bin:$PATH"

echo 'export PATH="$HOME/.juliaup/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

echo "====================================="
echo "Installing Python packages"
echo "====================================="

pip install --upgrade pip

pip install \
    jupyter \
    jupyterlab \
    notebook \
    numpy \
    scipy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    plotly \
    polars \
    pyarrow \
    duckdb

echo "====================================="
echo "Installing Julia packages"
echo "====================================="

~/.juliaup/bin/julia <<EOF
using Pkg

Pkg.add([
    "IJulia",
    "DataFrames",
    "CSV",
    "Plots",
    "Statistics",
    "Distributions",
    "GLM",
    "DataFramesMeta",
    "DuckDB"
])

EOF

echo "====================================="
echo "Checking installations"
echo "====================================="

quarto --version

python --version

~/.juliaup/bin/julia --version

quarto check

echo "Environment ready!"