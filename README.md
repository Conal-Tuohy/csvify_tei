# TEI CSV converter

This app extracts a set of metadata from a collection of TEI files, and formats them as a CSV.

To run, apply the stylesheet to itself and save the output as a CSV file.
e.g. if using SaxonB on Linux as the stylesheet processor:
```
saxonb-xslt tei-csvify.xsl tei-csvify.xsl > openn-tei.csv
```

You can also pass a `docs` parameter to the stylesheet to specify the location of your data 
files (relative to the stylesheet location). Otherwise the default value of `docs` is `data/openn-tei`.

The app is based on earlier versions by Dot Porter and Doug Emery, rewritten to make much 
more use of XPath and less use of XSLT elements. The entire CSV file is produced as a string by
a single XPath expression, making the code a lot more concise.





