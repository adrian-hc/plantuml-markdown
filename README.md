# plantuml-markdown parse plantuml tags in markdown (**NOT yet complete!**) 
tags: plantuml markdown

## Example

Markdown

    ### Title3
	#### Title4
	
	line1
	
	line2
	
	```uml
	@startuml
	Alice -> Bob: Authentication Request
	Bob --> Alice: Authentication Response

	Alice -> Bob: Another authentication Request
	Alice <-- Bob: another authentication Response
	@enduml
	```

Show as:

### Title3

#### Title4

line1

line2

![](http://www.plantuml.com:80/plantuml/png/Syp9J4vLqBLJSCfFib9mB2t9ICqhoKnEBCdCprC8IYqiJIqkuGBAAUW2rJY256DHLLoGdrUSoiNbY6fONZvGNP528dP38OfjT7KXgXDngOOO3W00)

## Install	
1. Download and Install [plantuml](http://www.plantuml.com/)
2. Config some parameters in "preprocess.py"

	* plantuml_jar_file -- Where is [plantuml.jar](http://sourceforge.net/projects/plantuml/files/plantuml.jar/download)
	* plantuml_jar_parameters 
	* pandoc_exe_file -- Where is the pandoc execute file
	* pandoc_html_parameters -- pandoc's parameters for html
	* pandoc_css_file -- CSS file for html, see "--css" in [pandoc](http://pandoc.org/README.html)
	* pandoc_reference_docx -- local docx template file, see "--reference-docx" in [pandoc](http://pandoc.org/README.html)

3. Finally, "python preprocess.py markdown_file"






