<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aml="http://schemas.microsoft.com/aml/2001/core" xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml" xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint" xmlns:wsp="http://schemas.microsoft.com/office/word/2003/wordml/sp2" xmlns:sl="http://schemas.microsoft.com/schemaLibrary/2003/core" xmlns:ns2="osdm_at">
  <xsl:output method="xml" encoding="UTF-8" standalone="yes" />
  <xsl:template match="/">
    <xsl:processing-instruction name="mso-application">
      <xsl:text>progid="Word.Document"</xsl:text>
    </xsl:processing-instruction>
    <w:wordDocument xmlns:aml="http://schemas.microsoft.com/aml/2001/core" xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml" xmlns:wx="http://schemas.microsoft.com/office/word/2003/auxHint" xmlns:wsp="http://schemas.microsoft.com/office/word/2003/wordml/sp2" xmlns:sl="http://schemas.microsoft.com/schemaLibrary/2003/core" xmlns:ns2="osdm_at" w:macrosPresent="no" w:embeddedObjPresent="no" w:ocxPresent="no" xml:space="preserve">
      <w:ignoreSubtree w:val="http://schemas.microsoft.com/office/word/2003/wordml/sp2" />
      <o:DocumentProperties>
        <o:Author>Oracle SQL Developer Data Modeler</o:Author>
        <o:LastAuthor>Oracle SQL Developer Data Modeler</o:LastAuthor>
        <o:Revision>58</o:Revision>
        <o:TotalTime>50</o:TotalTime>
        <o:Created>2010-08-04T08:18:00Z</o:Created>
        <o:LastSaved>2010-08-05T09:33:00Z</o:LastSaved>
        <o:Pages>3</o:Pages>
        <o:Words>170</o:Words>
        <o:Characters>975</o:Characters>
        <o:Company>Oracle Corporation</o:Company>
        <o:Lines>8</o:Lines>
        <o:Paragraphs>2</o:Paragraphs>
        <o:CharactersWithSpaces>1143</o:CharactersWithSpaces>
        <o:Version>12</o:Version>
      </o:DocumentProperties>
      <w:fonts>
        <w:defaultFonts w:ascii="Tahoma" w:fareast="Calibri" w:h-ansi="Tahoma" w:cs="Times New Roman" />
        <w:font w:name="Times New Roman">
          <w:panose-1 w:val="02020603050405020304" />
          <w:charset w:val="CC" />
          <w:family w:val="Roman" />
          <w:pitch w:val="variable" />
          <w:sig w:usb-0="20002A87" w:usb-1="80000000" w:usb-2="00000008" w:usb-3="00000000" w:csb-0="000001FF" w:csb-1="00000000" />
        </w:font>
        <w:font w:name="Cambria Math">
          <w:panose-1 w:val="02040503050406030204" />
          <w:charset w:val="01" />
          <w:family w:val="Roman" />
          <w:notTrueType />
          <w:pitch w:val="variable" />
          <w:sig w:usb-0="00000000" w:usb-1="00000000" w:usb-2="00000000" w:usb-3="00000000" w:csb-0="00000000" w:csb-1="00000000" />
        </w:font>
        <w:font w:name="Calibri">
          <w:panose-1 w:val="020F0502020204030204" />
          <w:charset w:val="CC" />
          <w:family w:val="Swiss" />
          <w:pitch w:val="variable" />
          <w:sig w:usb-0="A00002EF" w:usb-1="4000207B" w:usb-2="00000000" w:usb-3="00000000" w:csb-0="0000009F" w:csb-1="00000000" />
        </w:font>
        <w:font w:name="Tahoma">
          <w:panose-1 w:val="020B0604030504040204" />
          <w:charset w:val="CC" />
          <w:family w:val="Swiss" />
          <w:pitch w:val="variable" />
          <w:sig w:usb-0="61002A87" w:usb-1="80000000" w:usb-2="00000008" w:usb-3="00000000" w:csb-0="000101FF" w:csb-1="00000000" />
        </w:font>
      </w:fonts>
      <w:styles>
        <w:versionOfBuiltInStylenames w:val="7" />
        <w:latentStyles w:defLockedState="off" w:latentStyleCount="267">
          <w:lsdException w:name="Normal" />
          <w:lsdException w:name="heading 1" />
          <w:lsdException w:name="heading 2" />
          <w:lsdException w:name="heading 3" />
          <w:lsdException w:name="heading 4" />
          <w:lsdException w:name="heading 5" />
          <w:lsdException w:name="heading 6" />
          <w:lsdException w:name="heading 7" />
          <w:lsdException w:name="heading 8" />
          <w:lsdException w:name="heading 9" />
          <w:lsdException w:name="caption" />
          <w:lsdException w:name="Title" />
          <w:lsdException w:name="Subtitle" />
          <w:lsdException w:name="Strong" />
          <w:lsdException w:name="Emphasis" />
          <w:lsdException w:name="No Spacing" />
          <w:lsdException w:name="List Paragraph" />
          <w:lsdException w:name="Quote" />
          <w:lsdException w:name="Intense Quote" />
          <w:lsdException w:name="Subtle Emphasis" />
          <w:lsdException w:name="Intense Emphasis" />
          <w:lsdException w:name="Subtle Reference" />
          <w:lsdException w:name="Intense Reference" />
          <w:lsdException w:name="Book Title" />
          <w:lsdException w:name="TOC Heading" />
        </w:latentStyles>
        <w:style w:type="paragraph" w:default="on" w:styleId="Normal">
          <w:name w:val="Normal" />
          <w:rsid w:val="00B63C0C" />
          <w:pPr>
            <w:spacing w:after="200" w:line="276" w:line-rule="auto" />
          </w:pPr>
          <w:rPr>
            <wx:font wx:val="Tahoma" />
            <w:sz w:val="16" />
            <w:sz-cs w:val="16" />
            <w:lang w:val="BG" w:fareast="EN-US" w:bidi="AR-SA" />
          </w:rPr>
        </w:style>
        <w:style w:type="character" w:default="on" w:styleId="DefaultParagraphFont">
          <w:name w:val="Default Paragraph Font" />
        </w:style>
        <w:style w:type="table" w:default="on" w:styleId="TableNormal">
          <w:name w:val="Normal Table" />
          <wx:uiName wx:val="Table Normal" />
          <w:rPr>
            <wx:font wx:val="Tahoma" />
            <w:lang w:val="BG" w:fareast="BG" w:bidi="AR-SA" />
          </w:rPr>
          <w:tblPr>
            <w:tblInd w:w="0" w:type="dxa" />
            <w:tblCellMar>
              <w:top w:w="0" w:type="dxa" />
              <w:left w:w="108" w:type="dxa" />
              <w:bottom w:w="0" w:type="dxa" />
              <w:right w:w="108" w:type="dxa" />
            </w:tblCellMar>
          </w:tblPr>
        </w:style>
        <w:style w:type="list" w:default="on" w:styleId="NoList">
          <w:name w:val="No List" />
        </w:style>
        <w:style w:type="table" w:styleId="Mickystyle">
          <w:name w:val="Micky_style" />
          <w:basedOn w:val="TableNormal" />
          <w:rsid w:val="00A52B63" />
          <w:rPr>
            <wx:font wx:val="Tahoma" />
          </w:rPr>
          <w:tblPr>
            <w:tblInd w:w="0" w:type="dxa" />
            <w:tblBorders>
              <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            </w:tblBorders>
            <w:tblCellMar>
              <w:top w:w="28" w:type="dxa" />
              <w:left w:w="108" w:type="dxa" />
              <w:bottom w:w="28" w:type="dxa" />
              <w:right w:w="108" w:type="dxa" />
            </w:tblCellMar>
          </w:tblPr>
          <w:tcPr>
            <w:shd w:val="clear" w:color="auto" w:fill="auto" />
          </w:tcPr>
          <w:tblStylePr w:type="firstRow">
            <w:pPr>
              <w:jc w:val="center" />
            </w:pPr>
            <w:rPr>
              <w:rFonts w:ascii="Tahoma" w:h-ansi="Tahoma" />
              <wx:font wx:val="Tahoma" />
              <w:b />
              <w:sz w:val="16" />
            </w:rPr>
            <w:tblPr />
            <w:tcPr>
              <w:shd w:val="clear" w:color="auto" w:fill="C6D9F1" />
            </w:tcPr>
          </w:tblStylePr>
        </w:style>
        <w:style w:type="table" w:styleId="osdmstylev">
          <w:name w:val="osdm_style_v" />
          <w:basedOn w:val="TableNormal" />
          <w:rsid w:val="00CE47D5" />
          <w:rPr>
            <wx:font wx:val="Tahoma" />
          </w:rPr>
          <w:tblPr>
            <w:tblInd w:w="0" w:type="dxa" />
            <w:tblBorders>
              <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            </w:tblBorders>
            <w:tblCellMar>
              <w:top w:w="28" w:type="dxa" />
              <w:left w:w="108" w:type="dxa" />
              <w:bottom w:w="28" w:type="dxa" />
              <w:right w:w="108" w:type="dxa" />
            </w:tblCellMar>
          </w:tblPr>
          <w:tblStylePr w:type="firstCol">
            <w:rPr>
              <w:rFonts w:ascii="Tahoma" w:h-ansi="Tahoma" />
              <wx:font wx:val="Tahoma" />
              <w:b />
              <w:sz w:val="16" />
            </w:rPr>
            <w:tblPr />
            <w:tcPr>
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
          </w:tblStylePr>
        </w:style>
        <w:style w:type="table" w:styleId="osdmstyleh">
          <w:name w:val="osdm_style_h" />
          <w:basedOn w:val="TableNormal" />
          <w:rsid w:val="00CE47D5" />
          <w:rPr>
            <wx:font wx:val="Tahoma" />
          </w:rPr>
          <w:tblPr>
            <w:tblInd w:w="0" w:type="dxa" />
            <w:tblBorders>
              <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            </w:tblBorders>
            <w:tblCellMar>
              <w:top w:w="28" w:type="dxa" />
              <w:left w:w="108" w:type="dxa" />
              <w:bottom w:w="28" w:type="dxa" />
              <w:right w:w="108" w:type="dxa" />
            </w:tblCellMar>
          </w:tblPr>
          <w:tcPr>
            <w:shd w:val="clear" w:color="auto" w:fill="auto" />
          </w:tcPr>
          <w:tblStylePr w:type="firstRow">
            <w:pPr>
              <w:jc w:val="center" />
            </w:pPr>
            <w:rPr>
              <w:rFonts w:ascii="Tahoma" w:h-ansi="Tahoma" />
              <wx:font wx:val="Tahoma" />
              <w:b />
              <w:sz w:val="16" />
            </w:rPr>
            <w:tblPr />
            <w:tcPr>
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
          </w:tblStylePr>
        </w:style>
        <w:style w:type="paragraph" w:styleId="Header">
          <w:name w:val="header" />
          <wx:uiName wx:val="Header" />
          <w:basedOn w:val="Normal" />
          <w:link w:val="HeaderChar" />
          <w:rsid w:val="003D746A" />
          <w:pPr>
            <w:tabs>
              <w:tab w:val="center" w:pos="4703" />
              <w:tab w:val="right" w:pos="9406" />
            </w:tabs>
          </w:pPr>
          <w:rPr>
            <wx:font wx:val="Tahoma" />
          </w:rPr>
        </w:style>
        <w:style w:type="character" w:styleId="HeaderChar">
          <w:name w:val="Header Char" />
          <w:basedOn w:val="DefaultParagraphFont" />
          <w:link w:val="Header" />
          <w:rsid w:val="003D746A" />
          <w:rPr>
            <w:sz w:val="16" />
            <w:sz-cs w:val="16" />
            <w:lang w:fareast="EN-US" />
          </w:rPr>
        </w:style>
        <w:style w:type="paragraph" w:styleId="Footer">
          <w:name w:val="footer" />
          <wx:uiName wx:val="Footer" />
          <w:basedOn w:val="Normal" />
          <w:link w:val="FooterChar" />
          <w:rsid w:val="003D746A" />
          <w:pPr>
            <w:tabs>
              <w:tab w:val="center" w:pos="4703" />
              <w:tab w:val="right" w:pos="9406" />
            </w:tabs>
          </w:pPr>
          <w:rPr>
            <wx:font wx:val="Tahoma" />
          </w:rPr>
        </w:style>
        <w:style w:type="character" w:styleId="FooterChar">
          <w:name w:val="Footer Char" />
          <w:basedOn w:val="DefaultParagraphFont" />
          <w:link w:val="Footer" />
          <w:rsid w:val="003D746A" />
          <w:rPr>
            <w:sz w:val="16" />
            <w:sz-cs w:val="16" />
            <w:lang w:fareast="EN-US" />
          </w:rPr>
        </w:style>
        <w:style w:type="paragraph" w:styleId="BalloonText">
          <w:name w:val="Balloon Text" />
          <w:basedOn w:val="Normal" />
          <w:link w:val="BalloonTextChar" />
          <w:rsid w:val="003D746A" />
          <w:pPr>
            <w:spacing w:after="0" w:line="240" w:line-rule="auto" />
          </w:pPr>
          <w:rPr>
            <w:rFonts w:cs="Tahoma" />
            <wx:font wx:val="Tahoma" />
          </w:rPr>
        </w:style>
        <w:style w:type="character" w:styleId="BalloonTextChar">
          <w:name w:val="Balloon Text Char" />
          <w:basedOn w:val="DefaultParagraphFont" />
          <w:link w:val="BalloonText" />
          <w:rsid w:val="003D746A" />
          <w:rPr>
            <w:rFonts w:cs="Tahoma" />
            <w:sz w:val="16" />
            <w:sz-cs w:val="16" />
            <w:lang w:fareast="EN-US" />
          </w:rPr>
        </w:style>
      </w:styles>
      <w:shapeDefaults>
        <o:shapedefaults v:ext="edit" spidmax="20482" />
        <o:shapelayout v:ext="edit">
          <o:idmap v:ext="edit" data="1" />
        </o:shapelayout>
      </w:shapeDefaults>
      <w:docPr>
        <w:view w:val="print" />
        <w:zoom w:percent="110" />
        <w:doNotEmbedSystemFonts />
        <w:defaultTabStop w:val="708" />
        <w:hyphenationZone w:val="425" />
        <w:drawingGridHorizontalSpacing w:val="80" />
        <w:displayHorizontalDrawingGridEvery w:val="2" />
        <w:punctuationKerning />
        <w:characterSpacingControl w:val="DontCompress" />
        <w:optimizeForBrowser />
        <w:validateAgainstSchema />
        <w:saveInvalidXML />
        <w:ignoreMixedContent />
        <w:alwaysShowPlaceholderText w:val="off" />
        <w:footnotePr>
          <w:footnote w:type="separator">
            <w:p wsp:rsidR="00FC2D9F" wsp:rsidRDefault="00FC2D9F" wsp:rsidP="003D746A">
              <w:pPr>
                <w:spacing w:after="0" w:line="240" w:line-rule="auto" />
              </w:pPr>
              <w:r>
                <w:separator />
              </w:r>
            </w:p>
          </w:footnote>
          <w:footnote w:type="continuation-separator">
            <w:p wsp:rsidR="00FC2D9F" wsp:rsidRDefault="00FC2D9F" wsp:rsidP="003D746A">
              <w:pPr>
                <w:spacing w:after="0" w:line="240" w:line-rule="auto" />
              </w:pPr>
              <w:r>
                <w:continuationSeparator />
              </w:r>
            </w:p>
          </w:footnote>
        </w:footnotePr>
        <w:endnotePr>
          <w:endnote w:type="separator">
            <w:p wsp:rsidR="00FC2D9F" wsp:rsidRDefault="00FC2D9F" wsp:rsidP="003D746A">
              <w:pPr>
                <w:spacing w:after="0" w:line="240" w:line-rule="auto" />
              </w:pPr>
              <w:r>
                <w:separator />
              </w:r>
            </w:p>
          </w:endnote>
          <w:endnote w:type="continuation-separator">
            <w:p wsp:rsidR="00FC2D9F" wsp:rsidRDefault="00FC2D9F" wsp:rsidP="003D746A">
              <w:pPr>
                <w:spacing w:after="0" w:line="240" w:line-rule="auto" />
              </w:pPr>
              <w:r>
                <w:continuationSeparator />
              </w:r>
            </w:p>
          </w:endnote>
        </w:endnotePr>
        <w:compat>
          <w:breakWrappedTables />
          <w:snapToGridInCell />
          <w:wrapTextWithPunct />
          <w:useAsianBreakRules />
          <w:dontGrowAutofit />
        </w:compat>
        <wsp:rsids>
          <wsp:rsidRoot wsp:val="00707D24" />
          <wsp:rsid wsp:val="00003D40" />
          <wsp:rsid wsp:val="00007C14" />
          <wsp:rsid wsp:val="000779F8" />
          <wsp:rsid wsp:val="000A60F6" />
          <wsp:rsid wsp:val="001128D5" />
          <wsp:rsid wsp:val="00113117" />
          <wsp:rsid wsp:val="0011373D" />
          <wsp:rsid wsp:val="00115791" />
          <wsp:rsid wsp:val="00187CDE" />
          <wsp:rsid wsp:val="001F2D4D" />
          <wsp:rsid wsp:val="00282AFD" />
          <wsp:rsid wsp:val="00297D98" />
          <wsp:rsid wsp:val="0033355B" />
          <wsp:rsid wsp:val="00335423" />
          <wsp:rsid wsp:val="00342D2A" />
          <wsp:rsid wsp:val="00346892" />
          <wsp:rsid wsp:val="00350D31" />
          <wsp:rsid wsp:val="003D746A" />
          <wsp:rsid wsp:val="004067D5" />
          <wsp:rsid wsp:val="0043499E" />
          <wsp:rsid wsp:val="00465521" />
          <wsp:rsid wsp:val="00480867" />
          <wsp:rsid wsp:val="00490168" />
          <wsp:rsid wsp:val="00497651" />
          <wsp:rsid wsp:val="004B1319" />
          <wsp:rsid wsp:val="004F26E7" />
          <wsp:rsid wsp:val="00500126" />
          <wsp:rsid wsp:val="00553D21" />
          <wsp:rsid wsp:val="00564C30" />
          <wsp:rsid wsp:val="00590435" />
          <wsp:rsid wsp:val="005C7EB9" />
          <wsp:rsid wsp:val="005E5781" />
          <wsp:rsid wsp:val="006024C3" />
          <wsp:rsid wsp:val="00657F73" />
          <wsp:rsid wsp:val="00694954" />
          <wsp:rsid wsp:val="006D567F" />
          <wsp:rsid wsp:val="00707D24" />
          <wsp:rsid wsp:val="0071234C" />
          <wsp:rsid wsp:val="00730B6B" />
          <wsp:rsid wsp:val="007448C5" />
          <wsp:rsid wsp:val="00754952" />
          <wsp:rsid wsp:val="0077226B" />
          <wsp:rsid wsp:val="007951C2" />
          <wsp:rsid wsp:val="007C23C6" />
          <wsp:rsid wsp:val="007E77E7" />
          <wsp:rsid wsp:val="008037E2" />
          <wsp:rsid wsp:val="00833EC9" />
          <wsp:rsid wsp:val="00840EB1" />
          <wsp:rsid wsp:val="00871609" />
          <wsp:rsid wsp:val="008816F2" />
          <wsp:rsid wsp:val="008970DF" />
          <wsp:rsid wsp:val="009340B9" />
          <wsp:rsid wsp:val="0093454F" />
          <wsp:rsid wsp:val="0093584F" />
          <wsp:rsid wsp:val="00952D5B" />
          <wsp:rsid wsp:val="009E1CB0" />
          <wsp:rsid wsp:val="00A20B74" />
          <wsp:rsid wsp:val="00A441CB" />
          <wsp:rsid wsp:val="00A52B63" />
          <wsp:rsid wsp:val="00AA78C6" />
          <wsp:rsid wsp:val="00AB4255" />
          <wsp:rsid wsp:val="00AF5F6D" />
          <wsp:rsid wsp:val="00B60036" />
          <wsp:rsid wsp:val="00B63C0C" />
          <wsp:rsid wsp:val="00B75FA1" />
          <wsp:rsid wsp:val="00B824B8" />
          <wsp:rsid wsp:val="00B900F0" />
          <wsp:rsid wsp:val="00BC7F09" />
          <wsp:rsid wsp:val="00C65FF0" />
          <wsp:rsid wsp:val="00C852EF" />
          <wsp:rsid wsp:val="00CA6E9C" />
          <wsp:rsid wsp:val="00CB2608" />
          <wsp:rsid wsp:val="00CE47D5" />
          <wsp:rsid wsp:val="00D91E77" />
          <wsp:rsid wsp:val="00DB0C8D" />
          <wsp:rsid wsp:val="00DD6DD7" />
          <wsp:rsid wsp:val="00E26FA9" />
          <wsp:rsid wsp:val="00E6561F" />
          <wsp:rsid wsp:val="00EE4E41" />
          <wsp:rsid wsp:val="00F11D72" />
          <wsp:rsid wsp:val="00F15091" />
          <wsp:rsid wsp:val="00F86981" />
          <wsp:rsid wsp:val="00F9573B" />
          <wsp:rsid wsp:val="00FC2D9F" />
          <wsp:rsid wsp:val="00FD35D2" />
          <wsp:rsid wsp:val="00FF6DE4" />
        </wsp:rsids>
        <w:showXMLTags w:val="off" />
      </w:docPr>
      <w:body>
        <xsl:apply-templates select="ns2:root" />
        <w:sectPr wsp:rsidR="0033355B" wsp:rsidRPr="00707D24" wsp:rsidSect="00707D24">
          <w:ftr w:type="odd">
            <w:p wsp:rsidR="00346892" wsp:rsidRDefault="00346892" wsp:rsidP="00346892">
              <w:pPr>
                <w:tabs>
                  <w:tab w:val="center" w:pos="7002" />
                  <w:tab w:val="right" w:pos="14005" />
                </w:tabs>
              </w:pPr>
              <w:r>
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Oracle Data Modeler</xsl:text></w:t></w:r>
              <w:r>
                <w:tab />
              </w:r>
              <w:fldSimple w:instr=" TIME \@ &quot;dd/M/yyyy&quot; ">
                <w:r wsp:rsidR="00282AFD">
                  <w:rPr>
                    <w:noProof />
                  </w:rPr> <w:t><xsl:text>05/8/2010</xsl:text></w:t></w:r>
              </w:fldSimple>
              <w:r wsp:rsidR="00282AFD">
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text> </xsl:text></w:t></w:r>
              <w:r wsp:rsidR="00730B6B">
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr>
                <w:fldChar w:fldCharType="begin" />
              </w:r>
              <w:r wsp:rsidR="00730B6B">
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr>
                <w:instrText> DATE \@ "HH:mm:ss" </w:instrText>
              </w:r>
              <w:r wsp:rsidR="00730B6B">
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr>
                <w:fldChar w:fldCharType="separate" />
              </w:r>
              <w:r wsp:rsidR="00730B6B">
                <w:rPr>
                  <w:noProof />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>12:32:32</xsl:text></w:t></w:r>
              <w:r wsp:rsidR="00730B6B">
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr>
                <w:fldChar w:fldCharType="end" />
              </w:r>
              <w:r>
                <w:tab /> <w:t><xsl:text>Page </xsl:text></w:t></w:r>
              <w:fldSimple w:instr=" PAGE ">
                <w:r wsp:rsidR="00282AFD">
                  <w:rPr>
                    <w:noProof />
                  </w:rPr> <w:t><xsl:text>1</xsl:text></w:t></w:r>
              </w:fldSimple>
              <w:r> <w:t><xsl:text> of </xsl:text></w:t></w:r>
              <w:fldSimple w:instr=" NUMPAGES  ">
                <w:r wsp:rsidR="00282AFD">
                  <w:rPr>
                    <w:noProof />
                  </w:rPr> <w:t><xsl:text>3</xsl:text></w:t></w:r>
              </w:fldSimple>
            </w:p>
            <w:p wsp:rsidR="00346892" wsp:rsidRPr="00346892" wsp:rsidRDefault="00346892">
              <w:pPr>
                <w:pStyle w:val="Footer" />
                <w:rPr>
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
            </w:p>
          </w:ftr>
          <w:pgSz w:w="16839" w:h="11907" w:orient="landscape" w:code="9" />
          <w:pgMar w:top="1417" w:right="1417" w:bottom="1417" w:left="1417" w:header="708" w:footer="708" w:gutter="0" />
          <w:cols w:space="708" />
          <w:docGrid w:line-pitch="360" />
        </w:sectPr>
      </w:body>
      <o:CustomDocumentProperties>
        <o:processingInstructions dt:dt="string"> <xsl:for-each select="processing-instruction()"><xsl:text>&lt;?</xsl:text><xsl:value-of select="name()" /><xsl:text> </xsl:text><xsl:value-of select="." /><xsl:text>?&gt;</xsl:text></xsl:for-each></o:processingInstructions>
      </o:CustomDocumentProperties>
    </w:wordDocument>
  </xsl:template>
  <xsl:template match="/ns2:root">
    <ns2:root>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="008970DF" wsp:rsidRPr="00694954" wsp:rsidRDefault="00707D24" wsp:rsidP="00694954">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:jc w:val="center" />
          <w:rPr>
            <w:b />
            <w:sz w:val="28" />
            <w:sz-cs w:val="28" />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="00694954">
          <w:rPr>
            <w:b />
            <w:sz w:val="28" />
            <w:sz-cs w:val="28" />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>All Tables Details</xsl:text></w:t></w:r>
      </w:p>
      <w:p wsp:rsidR="00694954" wsp:rsidRDefault="00694954" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2376" />
          <w:gridCol w:w="10915" />
        </w:tblGrid>
        <xsl:apply-templates select="ns2:VersionDate|ns2:DesignName" />
        <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2376" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00FD35D2" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Version Comment</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <xsl:apply-templates select="ns2:VersionComment" />
        </w:tr>
        <xsl:apply-templates select="ns2:ModelName" />
      </w:tbl>
      <xsl:apply-templates select="ns2:TablesCollection" />
    </ns2:root>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:DesignName">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00FD35D2" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Design Name</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:DesignName>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="10915" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B824B8" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:DesignName>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection">
    <ns2:TablesCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:TableDetails" />
    </ns2:TablesCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails">
    <ns2:TableDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00707D24" wsp:rsidRDefault="00707D24" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2376" />
          <w:gridCol w:w="4111" />
        </w:tblGrid>
        <xsl:apply-templates select="ns2:FunctionalName|ns2:ObjectTypeName|ns2:TableName|ns2:ClassificationTypeName|ns2:Abbreviation" />
      </w:tbl>
      <w:p wsp:rsidR="00C852EF" wsp:rsidRDefault="00C852EF" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:p wsp:rsidR="00694954" wsp:rsidRPr="00C852EF" wsp:rsidRDefault="00C852EF" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="00C852EF">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Comments</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2376" />
          <w:gridCol w:w="11769" />
        </w:tblGrid>
        <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2376" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Description</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <xsl:apply-templates select="ns2:Description" />
        </w:tr>
        <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2376" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Notes</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <xsl:apply-templates select="ns2:Notes" />
        </w:tr>
      </w:tbl>
      <w:p wsp:rsidR="00C852EF" wsp:rsidRDefault="00C852EF" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:p wsp:rsidR="00694954" wsp:rsidRPr="00C852EF" wsp:rsidRDefault="00C852EF" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="00C852EF">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Quantitative Information</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2376" />
          <w:gridCol w:w="2410" />
        </w:tblGrid>
        <xsl:apply-templates select="ns2:NumberOfColumns|ns2:GrowthInterval|ns2:NumberOfRowsMax|ns2:ExpectedGrowth|ns2:NumberOfRowsMin|ns2:ExpectedNumberOfRows" />
      </w:tbl>
      <w:p wsp:rsidR="00694954" wsp:rsidRDefault="00694954" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <xsl:apply-templates select="ns2:FKCollection|ns2:ColumnsCommentsCollection|ns2:ColumnsCollection|ns2:ConstraintsCollection|ns2:IndexesCollection" />
    </ns2:TableDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:NumberOfColumns">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="00003D40">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00490168" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Number Of Columns</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:NumberOfColumns>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="2410" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00497651" wsp:rsidP="0077226B">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:jc w:val="right" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:NumberOfColumns>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Notes">
    <ns2:Notes>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="11769" w:type="dxa" />
        </w:tcPr>
        <xsl:apply-templates select="ns2:NotesDetails" />
      </w:tc>
    </ns2:Notes>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Notes/ns2:NotesDetails">
    <ns2:NotesDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:NoteRow" />
      <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:NotesDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Notes/ns2:NotesDetails/ns2:NoteRow">
    <ns2:NoteRow>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00A441CB" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="009340B9">
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
      </w:p>
    </ns2:NoteRow>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ObjectTypeName">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Object Type Name</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:ObjectTypeName>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="4111" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:ObjectTypeName>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection">
    <ns2:IndexesCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="0093454F" wsp:rsidRPr="0093454F" wsp:rsidRDefault="0093454F" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="0093454F">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Indexes</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="4219" />
          <w:gridCol w:w="709" />
          <w:gridCol w:w="1059" />
          <w:gridCol w:w="784" />
          <w:gridCol w:w="3260" />
          <w:gridCol w:w="3260" />
          <w:gridCol w:w="854" />
        </w:tblGrid>
        <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="00AF5F6D">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="4219" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Index Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="709" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>State</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1059" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Functional</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="784" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Spatial</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="3260" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Expression</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="3260" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Column Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="854" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00833EC9" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Sort Order</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:IndexDetails" />
      </w:tbl>
      <w:p wsp:rsidR="0033355B" wsp:rsidRDefault="004F26E7" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:IndexesCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails">
    <ns2:IndexDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="00AF5F6D">
        <xsl:apply-templates select="ns2:IndexFunctional|ns2:IndexName|ns2:IndexSpatial|ns2:IndexExpression|ns2:IndexState|ns2:IndexColumnName|ns2:IndexSortOrder" />
      </w:tr>
    </ns2:IndexDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexFunctional">
    <ns2:IndexFunctional>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1059" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexFunctional>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexState">
    <ns2:IndexState>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="709" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="00AF5F6D">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexState>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexSpatial">
    <ns2:IndexSpatial>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="784" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexSpatial>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexColumnName">
    <ns2:IndexColumnName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="3260" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexColumnName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexName">
    <ns2:IndexName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="4219" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexSortOrder">
    <ns2:IndexSortOrder>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="854" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexSortOrder>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:IndexesCollection/ns2:IndexDetails/ns2:IndexExpression">
    <ns2:IndexExpression>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="3260" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00480867" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:IndexExpression>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ExpectedGrowth">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="00003D40">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00490168" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Expected Growth</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:ExpectedGrowth>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="2410" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00497651" wsp:rsidP="0077226B">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:jc w:val="right" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:ExpectedGrowth>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ClassificationTypeName">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Classification Type Name</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:ClassificationTypeName>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="4111" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:ClassificationTypeName>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ExpectedNumberOfRows">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="00003D40">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00490168" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Expected Number Of Rows</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:ExpectedNumberOfRows>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="2410" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00497651" wsp:rsidP="0077226B">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:jc w:val="right" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:ExpectedNumberOfRows>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:NumberOfRowsMin">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="00003D40">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00490168" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Number Of Rows Min.</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:NumberOfRowsMin>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="2410" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00497651" wsp:rsidP="0077226B">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:jc w:val="right" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:NumberOfRowsMin>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:GrowthInterval">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="00003D40">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00490168" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Growth Interval</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:GrowthInterval>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="2410" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00497651" wsp:rsidP="0077226B">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:jc w:val="right" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:GrowthInterval>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FunctionalName">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Functional Name</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:FunctionalName>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="4111" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:FunctionalName>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection">
    <ns2:FKCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00833EC9" wsp:rsidRPr="00FF6DE4" wsp:rsidRDefault="00FF6DE4" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="00FF6DE4">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Foreign Keys</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2943" />
          <w:gridCol w:w="2977" />
          <w:gridCol w:w="2552" />
          <w:gridCol w:w="1134" />
          <w:gridCol w:w="1275" />
          <w:gridCol w:w="480" />
          <w:gridCol w:w="2784" />
        </w:tblGrid>
        <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2943" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2977" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Referring To</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2552" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Referred From</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1134" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Mandatory</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1275" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Transferable</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="480" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>In </xsl:text></w:t></w:r>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Arc</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2784" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00952D5B" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Column Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:FKDetails" />
      </w:tbl>
      <w:p wsp:rsidR="0033355B" wsp:rsidRPr="00707D24" wsp:rsidRDefault="004F26E7" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:FKCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails">
    <ns2:FKDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:FKMandatory|ns2:FKColumnName|ns2:FKTransferable|ns2:FKReferingTo|ns2:FKInArc|ns2:FKReferedFrom|ns2:FKName" />
      </w:tr>
    </ns2:FKDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKMandatory">
    <ns2:FKMandatory>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1134" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKMandatory>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKName">
    <ns2:FKName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2943" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKColumnName">
    <ns2:FKColumnName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2784" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKColumnName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKReferedFrom">
    <ns2:FKReferedFrom>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2552" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKReferedFrom>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKReferingTo">
    <ns2:FKReferingTo>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2977" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKReferingTo>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKInArc">
    <ns2:FKInArc>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="480" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKInArc>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:FKCollection/ns2:FKDetails/ns2:FKTransferable">
    <ns2:FKTransferable>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1275" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A20B74" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FKTransferable>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Abbreviation">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Abbreviation</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:Abbreviation>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="4111" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:Abbreviation>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Description">
    <ns2:Description>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="11769" w:type="dxa" />
        </w:tcPr>
        <xsl:apply-templates select="ns2:DescriptionDetails" />
      </w:tc>
    </ns2:Description>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Description/ns2:DescriptionDetails">
    <ns2:DescriptionDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:DescriptionRow" />
      <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:DescriptionDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:Description/ns2:DescriptionDetails/ns2:DescriptionRow">
    <ns2:DescriptionRow>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00A441CB" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="009340B9">
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
      </w:p>
    </ns2:DescriptionRow>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:TableName">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00564C30" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Table Name</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:TableName>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="4111" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00A441CB" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:TableName>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection">
    <ns2:ConstraintsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00833EC9" wsp:rsidRPr="00833EC9" wsp:rsidRDefault="00833EC9" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="00833EC9">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Constraints</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="1668" />
          <w:gridCol w:w="1984" />
          <w:gridCol w:w="10493" />
        </w:tblGrid>
        <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1668" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="007448C5" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Type</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1984" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="007448C5" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Column / Constraint Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="10493" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="007448C5" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Details</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:TableLevelConstraintsCollection|ns2:ColumnLevelConstraintsCollection" />
      </w:tbl>
      <w:p wsp:rsidR="0033355B" wsp:rsidRDefault="004F26E7" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:ConstraintsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection">
    <ns2:TableLevelConstraintsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:TableLevelConstraintDetails" />
    </ns2:TableLevelConstraintsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection/ns2:TableLevelConstraintDetails">
    <ns2:TableLevelConstraintDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:TLConstraintRule|ns2:TLConstraintType|ns2:TLConstraintName" />
      </w:tr>
    </ns2:TableLevelConstraintDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection/ns2:TableLevelConstraintDetails/ns2:TLConstraintName">
    <ns2:TLConstraintName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1984" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00F15091" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:TLConstraintName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection/ns2:TableLevelConstraintDetails/ns2:TLConstraintRule">
    <ns2:TLConstraintRule>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="10493" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <xsl:apply-templates select="ns2:TLConstraintRuleDetails" />
      </w:tc>
    </ns2:TLConstraintRule>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection/ns2:TableLevelConstraintDetails/ns2:TLConstraintRule/ns2:TLConstraintRuleDetails">
    <ns2:TLConstraintRuleDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:TLConstraintRuleRow" />
      <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:TLConstraintRuleDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection/ns2:TableLevelConstraintDetails/ns2:TLConstraintRule/ns2:TLConstraintRuleDetails/ns2:TLConstraintRuleRow">
    <ns2:TLConstraintRuleRow>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00F15091" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00F15091" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="009340B9">
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
      </w:p>
    </ns2:TLConstraintRuleRow>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:TableLevelConstraintsCollection/ns2:TableLevelConstraintDetails/ns2:TLConstraintType">
    <ns2:TLConstraintType>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1668" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00F15091" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:TLConstraintType>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection">
    <ns2:ColumnLevelConstraintsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:ConstraintDetails" />
    </ns2:ColumnLevelConstraintsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails">
    <ns2:ConstraintDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:ContstraintType|ns2:ALCConstraintName" />
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="10493" w:type="dxa" />
            <w:shd w:val="clear" w:color="auto" w:fill="auto" />
          </w:tcPr>
          <xsl:apply-templates select="ns2:RangesCollection|ns2:ValueListsCollection|ns2:CheckConstraintsCollection" />
          <w:p wsp:rsidR="00CB2608" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00CB2608" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
          </w:p>
        </w:tc>
      </w:tr>
    </ns2:ConstraintDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:ValueListsCollection">
    <ns2:ValueListsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00E6561F" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2297" />
          <w:gridCol w:w="7938" />
        </w:tblGrid>
        <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="10235" w:type="dxa" />
              <w:gridSpan w:val="2" />
              <w:tcBorders>
                <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              </w:tcBorders>
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Value List</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2297" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Value</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="7938" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Description</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:ValueListDetails" />
      </w:tbl>
      <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:ValueListsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:ValueListsCollection/ns2:ValueListDetails">
    <ns2:ValueListDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:VLValue|ns2:VLShortDescription" />
      </w:tr>
    </ns2:ValueListDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:ValueListsCollection/ns2:ValueListDetails/ns2:VLValue">
    <ns2:VLValue>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2297" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:VLValue>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:ValueListsCollection/ns2:ValueListDetails/ns2:VLShortDescription">
    <ns2:VLShortDescription>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="7938" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:VLShortDescription>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:ContstraintType">
    <ns2:ContstraintType>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1668" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ContstraintType>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:CheckConstraintsCollection">
    <ns2:CheckConstraintsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00E6561F" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="7825" />
          <w:gridCol w:w="2410" />
        </w:tblGrid>
        <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="10235" w:type="dxa" />
              <w:gridSpan w:val="2" />
              <w:tcBorders>
                <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              </w:tcBorders>
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Check Constraint</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="7825" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Text</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2410" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>DB Type</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:CheckConstraintDetails" />
      </w:tbl>
      <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:CheckConstraintsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:CheckConstraintsCollection/ns2:CheckConstraintDetails">
    <ns2:CheckConstraintDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:CheckConstraintText|ns2:DatabaseType" />
      </w:tr>
    </ns2:CheckConstraintDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:CheckConstraintsCollection/ns2:CheckConstraintDetails/ns2:CheckConstraintText">
    <ns2:CheckConstraintText>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="7825" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <xsl:apply-templates select="ns2:CheckConstraintTextDetails" />
      </w:tc>
    </ns2:CheckConstraintText>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:CheckConstraintsCollection/ns2:CheckConstraintDetails/ns2:CheckConstraintText/ns2:CheckConstraintTextDetails">
    <ns2:CheckConstraintTextDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:CheckConstraintTextRow" />
      <w:p wsp:rsidR="00EE4E41" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="00BC7F09">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:CheckConstraintTextDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:CheckConstraintsCollection/ns2:CheckConstraintDetails/ns2:CheckConstraintText/ns2:CheckConstraintTextDetails/ns2:CheckConstraintTextRow">
    <ns2:CheckConstraintTextRow>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="0071234C" wsp:rsidRDefault="0071234C" wsp:rsidP="0071234C">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
      </w:p>
    </ns2:CheckConstraintTextRow>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:CheckConstraintsCollection/ns2:CheckConstraintDetails/ns2:DatabaseType">
    <ns2:DatabaseType>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2410" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="007E77E7">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:DatabaseType>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:RangesCollection">
    <ns2:RangesCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0033355B" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="2297" />
          <w:gridCol w:w="2268" />
          <w:gridCol w:w="5670" />
        </w:tblGrid>
        <w:tr wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="10235" w:type="dxa" />
              <w:gridSpan w:val="3" />
              <w:tcBorders>
                <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
              </w:tcBorders>
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Ranges</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2297" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Begin Value</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2268" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>End Value</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="5670" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="0093584F" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Description</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:RangeDetails" />
      </w:tbl>
      <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:RangesCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:RangesCollection/ns2:RangeDetails">
    <ns2:RangeDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:RangeShortDescription|ns2:RangeBeginValue|ns2:RangeEndValue" />
      </w:tr>
    </ns2:RangeDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:RangesCollection/ns2:RangeDetails/ns2:RangeEndValue">
    <ns2:RangeEndValue>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2268" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="right" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:RangeEndValue>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:RangesCollection/ns2:RangeDetails/ns2:RangeBeginValue">
    <ns2:RangeBeginValue>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2297" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="right" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:RangeBeginValue>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:RangesCollection/ns2:RangeDetails/ns2:RangeShortDescription">
    <ns2:RangeShortDescription>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="5670" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="00342D2A" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:RangeShortDescription>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ConstraintsCollection/ns2:ColumnLevelConstraintsCollection/ns2:ConstraintDetails/ns2:ALCConstraintName">
    <ns2:ALCConstraintName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1984" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00E6561F" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ALCConstraintName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection">
    <ns2:ColumnsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="0093454F" wsp:rsidRPr="0093454F" wsp:rsidRDefault="0093454F" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="0093454F">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Columns</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblLayout w:type="Fixed" />
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="534" />
          <w:gridCol w:w="2682" />
          <w:gridCol w:w="436" />
          <w:gridCol w:w="425" />
          <w:gridCol w:w="426" />
          <w:gridCol w:w="2268" />
          <w:gridCol w:w="708" />
          <w:gridCol w:w="1560" />
          <w:gridCol w:w="1559" />
          <w:gridCol w:w="1701" />
          <w:gridCol w:w="1846" />
        </w:tblGrid>
        <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="534" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>No</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2682" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Column Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="436" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>PK</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="425" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>FK</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="426" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>M</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2268" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Data Type</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="708" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="00553D21" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>DT</xsl:text></w:t></w:r>
            </w:p>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Kind</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1560" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Domain Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1559" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Formula (Default Value)</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1701" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Security</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="1846" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00553D21" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Abbreviation</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:ColumnDetails" />
      </w:tbl>
      <w:p wsp:rsidR="0033355B" wsp:rsidRDefault="004F26E7" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:ColumnsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails">
    <ns2:ColumnDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:Formula|ns2:DomainName|ns2:DataTypeKind|ns2:ColumnName|ns2:Sequence|ns2:PK|ns2:FK|ns2:M|ns2:Security|ns2:PreferredAbbreviation|ns2:DataType" />
      </w:tr>
    </ns2:ColumnDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:PreferredAbbreviation">
    <ns2:PreferredAbbreviation>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1846" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:PreferredAbbreviation>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:DomainName">
    <ns2:DomainName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1560" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:DomainName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:Formula">
    <ns2:Formula>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1559" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:Formula>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:FK">
    <ns2:FK>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="425" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:FK>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:DataTypeKind">
    <ns2:DataTypeKind>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="708" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:DataTypeKind>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:PK">
    <ns2:PK>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="436" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:PK>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:DataType">
    <ns2:DataType>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2268" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:DataType>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:ColumnName">
    <ns2:ColumnName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2682" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ColumnName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:Security">
    <ns2:Security>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="1701" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:Security>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:Sequence">
    <ns2:Sequence>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="534" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="right" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:Sequence>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCollection/ns2:ColumnDetails/ns2:M">
    <ns2:M>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="426" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00D91E77" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="center" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:M>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:NumberOfRowsMax">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="00003D40">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00490168" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Number Of Rows Max.</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:NumberOfRowsMax>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="2410" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00497651" wsp:rsidP="0077226B">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:jc w:val="right" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:NumberOfRowsMax>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCommentsCollection">
    <ns2:ColumnsCommentsCollection>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="0093454F" wsp:rsidRPr="0093454F" wsp:rsidRDefault="0093454F" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="0093454F">
          <w:rPr>
            <w:i />
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:text>Column Comments</xsl:text></w:t></w:r>
      </w:p>
      <w:tbl>
        <w:tblPr>
          <w:tblW w:w="0" w:type="auto" />
          <w:tblBorders>
            <w:top w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:left w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:bottom w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:right w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideH w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
            <w:insideV w:val="single" w:sz="4" wx:bdrwidth="10" w:space="0" w:color="auto" />
          </w:tblBorders>
          <w:tblCellMar>
            <w:top w:w="28" w:type="dxa" />
            <w:bottom w:w="28" w:type="dxa" />
          </w:tblCellMar>
          <w:tblLook w:val="04A0" />
        </w:tblPr>
        <w:tblGrid>
          <w:gridCol w:w="534" />
          <w:gridCol w:w="2693" />
          <w:gridCol w:w="5528" />
          <w:gridCol w:w="5390" />
        </w:tblGrid>
        <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="534" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B60036" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>No</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="2693" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B60036" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Column Name</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="5528" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B60036" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>Description</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
          <w:tc>
            <w:tcPr>
              <w:tcW w:w="5390" w:type="dxa" />
              <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
            </w:tcPr>
            <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00AA78C6" wsp:rsidP="009340B9">
              <w:pPr>
                <w:spacing w:after="0" />
                <w:jc w:val="center" />
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr>
              </w:pPr>
              <w:r wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>N</xsl:text></w:t></w:r>
              <w:r wsp:rsidR="00B60036" wsp:rsidRPr="009340B9">
                <w:rPr>
                  <w:b />
                  <w:lang w:val="EN-US" />
                </w:rPr> <w:t><xsl:text>otes</xsl:text></w:t></w:r>
            </w:p>
          </w:tc>
        </w:tr>
        <xsl:apply-templates select="ns2:ColumnCommentsDetails" />
      </w:tbl>
      <w:p wsp:rsidR="0033355B" wsp:rsidRDefault="004F26E7" wsp:rsidP="00707D24">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:ColumnsCommentsCollection>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCommentsCollection/ns2:ColumnCommentsDetails">
    <ns2:ColumnCommentsDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tr wsp:rsidR="009340B9" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
        <xsl:apply-templates select="ns2:ColumnDescription|ns2:ColumnCommentsName|ns2:ColumnCommentsSequence|ns2:ColumnNotes" />
      </w:tr>
    </ns2:ColumnCommentsDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCommentsCollection/ns2:ColumnCommentsDetails/ns2:ColumnNotes">
    <ns2:ColumnNotes>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="5390" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00335423" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ColumnNotes>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCommentsCollection/ns2:ColumnCommentsDetails/ns2:ColumnCommentsName">
    <ns2:ColumnCommentsName>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2693" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00335423" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ColumnCommentsName>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCommentsCollection/ns2:ColumnCommentsDetails/ns2:ColumnDescription">
    <ns2:ColumnDescription>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="5528" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00335423" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ColumnDescription>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:TablesCollection/ns2:TableDetails/ns2:ColumnsCommentsCollection/ns2:ColumnCommentsDetails/ns2:ColumnCommentsSequence">
    <ns2:ColumnCommentsSequence>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="534" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="auto" />
        </w:tcPr>
        <w:p wsp:rsidR="0033355B" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00335423" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:jc w:val="right" />
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
        </w:p>
      </w:tc>
    </ns2:ColumnCommentsSequence>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:VersionComment">
    <ns2:VersionComment>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="10915" w:type="dxa" />
        </w:tcPr>
        <xsl:apply-templates select="ns2:VersionCommentDetails" />
      </w:tc>
    </ns2:VersionComment>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:VersionComment/ns2:VersionCommentDetails">
    <ns2:VersionCommentDetails>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates select="ns2:VersionCommentRow" />
      <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="004F26E7" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
      </w:p>
    </ns2:VersionCommentDetails>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:VersionComment/ns2:VersionCommentDetails/ns2:VersionCommentRow">
    <ns2:VersionCommentRow>
      <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
        <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
          <xsl:value-of select="." />
        </xsl:attribute>
      </xsl:for-each>
      <w:p wsp:rsidR="00B824B8" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B824B8" wsp:rsidP="009340B9">
        <w:pPr>
          <w:spacing w:after="0" />
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr>
        </w:pPr>
        <w:r wsp:rsidRPr="009340B9">
          <w:rPr>
            <w:lang w:val="EN-US" />
          </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
      </w:p>
    </ns2:VersionCommentRow>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:ModelName">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00FD35D2" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Model Name</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:ModelName>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="10915" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B824B8" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:ModelName>
    </w:tr>
  </xsl:template>
  <xsl:template match="/ns2:root/ns2:VersionDate">
    <w:tr wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidTr="009340B9">
      <w:tc>
        <w:tcPr>
          <w:tcW w:w="2376" w:type="dxa" />
          <w:shd w:val="clear" w:color="auto" w:fill="D9F5FF" />
        </w:tcPr>
        <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00FD35D2" wsp:rsidP="009340B9">
          <w:pPr>
            <w:spacing w:after="0" />
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr>
          </w:pPr>
          <w:r wsp:rsidRPr="009340B9">
            <w:rPr>
              <w:b />
              <w:lang w:val="EN-US" />
            </w:rPr> <w:t><xsl:text>Version Date</xsl:text></w:t></w:r>
        </w:p>
      </w:tc>
      <ns2:VersionDate>
        <xsl:for-each select="@ns2:*|@*[namespace-uri()='']">
          <xsl:attribute name="{name()}" namespace="{namespace-uri()}">
            <xsl:value-of select="." />
          </xsl:attribute>
        </xsl:for-each>
        <w:tc>
          <w:tcPr>
            <w:tcW w:w="10915" w:type="dxa" />
          </w:tcPr>
          <w:p wsp:rsidR="00694954" wsp:rsidRPr="009340B9" wsp:rsidRDefault="00B824B8" wsp:rsidP="009340B9">
            <w:pPr>
              <w:spacing w:after="0" />
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr>
            </w:pPr>
            <w:r wsp:rsidRPr="009340B9">
              <w:rPr>
                <w:lang w:val="EN-US" />
              </w:rPr> <w:t><xsl:value-of select="." /></w:t></w:r>
          </w:p>
        </w:tc>
      </ns2:VersionDate>
    </w:tr>
  </xsl:template>
</xsl:stylesheet>