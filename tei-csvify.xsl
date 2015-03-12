<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
   <xsl:output method="text"/>
   <xsl:param name="docs" select=" 'data/openn-tei' "/>
   <xsl:template match="/">
      <xsl:value-of separator="&#xA;" select="(
         'Repository,Title,Call No.,Language(s),Origin,Date,Place,Subject,Genre,Front Cover,OPenn Navigation',
         for $doc in collection(concat($docs, '?select=*.xml')) return string-join(
            for $column in (
               concat($doc//institution, ' ', $doc//repository),
               string-join($doc//title, ' '),
               concat($doc//institution, ' ', $doc//msIdentifier/idno[@type='call-number']),
               ($doc//textLang, 'Not Noted')[1],
               ($doc//origin/p, 'Not Noted')[1],
               ($doc//origin/origDate, 'Not Noted')[1],
               ($doc//origin/origPlace, 'Not Noted')[1],
               string-join($doc//keywords[@n='subjects']/term, ', '),
               string-join($doc//keywords[@n='form/genre']/term, ', '),
               string($doc//surface[1]/graphic[contains(@url, 'web')]/@url),
               string($doc//altIdentifier[@type='resource']/idno)
            )
            return concat($quote, replace($column, $quote, concat($quote, $quote)), $quote),
            ','
         )
      )"/>
   </xsl:template>
   <xsl:variable name="quote" select="codepoints-to-string(34)"/>
</xsl:stylesheet>
