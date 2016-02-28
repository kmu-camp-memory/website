TARGET = kmucamp

all: 
	mkdocs build

$(TARGET).pdf:
	mkdocs2pandoc > $(TARGET).pd
	pandoc --toc -f markdown+grid_tables+table_captions -o $(TARGET).pdf $(TARGET).pd 

.PHONY: pdf
pdf:
	mkdocs2pandoc > $(TARGET).pd
	pandoc --toc -f markdown+grid_tables+table_captions -o $(TARGET).pdf $(TARGET).pd 
	cp $(TARGET).pdf docs/pdf/$(TARGET).pdf
	
.PHONY: view
view: $(TARGET).pdf
	evince $(TARGET).pdf &

.PHONY: serve
serve:	
	 mkdocs serve &
	
clean:
	rm -rf site
	sh utilities/cleanfiles.sh

distclean: clean
	rm -rf site
	sh utilities/cleanfiles.sh

.PHONY: site
site:
	exec google-chrome --app=http://localhost:8000/ &

.PHONY: update
update:
