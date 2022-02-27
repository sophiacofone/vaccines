# Create CSV with sampled CDC data
vaccines:
	python -B src/vaccines.py

# Create CSVs with JHU data
deaths:
	python -B src/deaths.py	

merged:
	python -B src/combinedata.py

# Download and compress the CDC data
cdc:
	mkdir -p data
	curl -o data/COVID-19_Vaccinations_in_the_United_States_County.csv https://data.cdc.gov/api/views/8xkx-amqh/rows.csv?accessType=DOWNLOAD
	gzip data/COVID-19_Vaccinations_in_the_United_States_County.csv

scatters:
	python -B src/scatters.py

test:
	python -B src/test.py