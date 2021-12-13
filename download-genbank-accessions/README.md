## Download accessions from Genbank

This image installs the [EDirect utilities](https://dataguide.nlm.nih.gov/edirect/documentation.html) to download GenBank assembly files based on assembly accessions (these have 'GCA' prefixes).

### Requirements
- [Docker](https://docs.docker.com/get-docker/)
- A file of GenBank accessions saved as `accession_list.txt`. 

### Example run
Clone this repository and build the image.
```
# Clone the repo
git clone git@github.com:SarahNadeau/docker-playground.git
cd docker-playground/download-genbank-accessions
# Build image
docker build -t download-genbank-accessions .
```

Set up some input data.
```
mkdir -p genbank/
cd genbank
echo "GCA_000439415.1
GCA_000698515.1
GCA_000749005.1
GCA_000749045.1" > accession_list.txt
```
Run the container to download the accessions.  Output files are written to your current directory (`genbank` in the example). 
```
docker run -v $PWD:/data -it --rm download-genbank-accessions
```
