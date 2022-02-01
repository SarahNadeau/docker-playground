FROM python:3.5.10-slim-buster as app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget

RUN pip3 install numpy pandas scipy

# Copy in cloned repository
COPY ./MetaXcan /MetaXcan

FROM app as test

# Copy in test data
COPY ./sample_data.tar.gz /
RUN tar -xvf sample_data.tar.gz && rm sample_data.tar.gz

# Run tool on test data
RUN python3 /MetaXcan/software/SPrediXcan.py \
    --model_db_path data/DGN-WB_0.5.db \
    --covariance data/covariance.DGN-WB_0.5.txt.gz \
    --gwas_folder data/GWAS \
    --gwas_file_pattern ".*gz" \
    --snp_column SNP \
    --effect_allele_column A1 \
    --non_effect_allele_column A2 \
    --beta_column BETA \
    --pvalue_column P \
    --output_file results/test.csv

# Generate test results with:
# docker build --target=test -t s-predixcan-test .
# mkdir results
# id=$(docker create s-predixcan-test)
# docker cp $id:/results $PWD