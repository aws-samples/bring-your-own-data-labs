.PHONY: clean

clean:
	rm -rf site

site:
	mkdocs build --clean
	aws s3 sync site/ s3://demos.bastil.cloud/byod/ --delete

serve:
	mkdocs serve

