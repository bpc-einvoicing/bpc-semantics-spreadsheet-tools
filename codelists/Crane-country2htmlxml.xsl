<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                xmlns="http://www.w3.org/1999/xhtml"
                version="2.0">

<xs:doc info="$Id$"
        filename="Crane-country2htmlxml.xsl" vocabulary="DocBook">
  <xs:title>Convert country text to legacy HTML</xs:title>
  <para>
    Convert an instance of country code text from
    <ulink url="https://www.iso.org/obp/ui/#search/code/"
               >https://www.iso.org/obp/ui/#search/code/</ulink> to
    an HTML table that mimics the legacy ISO HTML table.
  </para>
  <para>
    This allows the legacy HTML to GC code to run without any changes.
  </para>
  <programlisting>
Copyright (C) - Crane Softwrights Ltd.
              - http://www.CraneSoftwrights.com/links/res-dev.htm

Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors 
may be used to endorse or promote products derived from this software without 
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.


Note: for your reference, the above is the "BSD-3-Clause license"; this text
      was obtained 2017-07-24 at https://opensource.org/licenses/BSD-3-Clause

THE COPYRIGHT HOLDERS MAKE NO REPRESENTATION ABOUT THE SUITABILITY OF THIS
CODE FOR ANY PURPOSE.
</programlisting>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic for columns and rows</xs:title>
  <para>
    The input is tab-separated text created as follows:
  </para>
  <programlisting>
    Set 300 results per page (only one page)
    Order by the English name (note this recently moved Côte d'Ivoire to end
      of "C" and others due to the sorting of accented letters now being wrong
    Using File/Save Page As..., select the type using Format: Text Files
    (be sure to use .txt as a file extension, overriding .html if prompted)
    The end result should start and end like:
&lt;#home>
Online Browsing Platform (OBP)
...
English short name
	French short name
	Alpha-2 code
	Alpha-3 code
	Numeric

Afghanistan	Afghanistan (l')	AF	AFG	004
Albania	Albanie (l')	AL	ALB	008
Algeria	Algérie (l')	DZ	DZA	012
...
Zimbabwe	Zimbabwe (le)	ZW	ZWE	716
Åland Islands	Åland(les Îles)	AX	ALA	248
  </programlisting>
</xs:doc>

<xs:param>
  <para>The name of the input text file</para>
</xs:param>
<xsl:param name="text-uri" as="xsd:string" required="yes"/>

<xs:template>
  <para>Get started</para>
</xs:template>
<xsl:template name="start">
  <html>
    <head>
      <title>Converted country table</title>
    </head>
    <body>
      <table>
        <tbody>
          <xsl:analyze-string select="unparsed-text($text-uri)"
            regex="([^\t\n]+)\t([^\t\n]+)\t([^\t\n]+)\t([^\t\n]+)\t([^\n]+)\n">
            <xsl:matching-substring>
              <tr>
                <td><xsl:value-of select="regex-group(1)"/></td>
                <td><xsl:value-of select="regex-group(2)"/></td>
                <td><xsl:value-of select="regex-group(3)"/></td>
                <td><xsl:value-of select="regex-group(4)"/></td>
                <td><xsl:value-of select="regex-group(5)"/></td>
              </tr>
            </xsl:matching-substring>
            <xsl:non-matching-substring/>
          </xsl:analyze-string>
        </tbody>
      </table>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>
