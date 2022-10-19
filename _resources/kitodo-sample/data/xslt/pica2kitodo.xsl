<?xml version="1.0" encoding="UTF-8" ?>
<!--
 *
 * (c) Kitodo. Key to digital objects e. V. <contact@kitodo.org>
 *
 * This file is part of the Kitodo project.
 *
 * It is licensed under GNU General Public License version 3 or later.
 *
 * For the full copyright and license information, please read the
 * GPL3-License.txt file that was distributed with this source code.
 *
-->

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:mets="http://www.loc.gov/METS/"
                xmlns:pica="info:srw/schema/5/picaXML-v1.0"
                xmlns:kitodo="http://meta.kitodo.org/v1/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.loc.gov/METS/ ">

    <xsl:output method="xml" indent="yes" encoding="utf-8"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="pica:record">
        <mets:mdWrap MDTYPE="PICAXML">
            <mets:xmlData>
                <kitodo:kitodo>
                    <xsl:apply-templates select="@*|node()"/>
                    <!-- ### DocType ### -->
                    <kitodo:metadata name="docType">
                        <xsl:variable name="status" select="pica:datafield[@tag='002@']/pica:subfield[@code='0']"/>
                        <xsl:variable name="genre" select="pica:datafield[@tag='013D']/pica:subfield[@code='a']"/>
                        <xsl:if test="matches($status,'^[AO]a[uv]')">
                            <xsl:choose>
                                <xsl:when test="($genre='Handschrift')">
                                    <xsl:text>Manuscript</xsl:text>
                                </xsl:when>
                                <xsl:when test="($genre='Musikhandschrift')">
                                    <xsl:text>Manuscript</xsl:text>
                                </xsl:when>
                                <xsl:when test="($genre='Bild')">
                                    <xsl:text>Graphics</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Monograph</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="matches($status,'^[AO][fF][uv]')">
                            <xsl:choose>
                                <xsl:when test="($genre='Bild')">
                                    <xsl:text>MultiPartGraphics</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Volume</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="matches($status,'^[AO][c][uv]')">
                            <xsl:choose>
                                <xsl:when test="($genre='Bild')">
                                    <xsl:text>MultiPartGraphics</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>MultiVolumeWork</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="matches($status,'^[AO]b[uv]')">
                            <xsl:choose>
                                <xsl:when test="($genre='Zeitung')">
                                    <xsl:text>Newspaper</xsl:text>
                                </xsl:when>
                                <xsl:when test="($genre='Programmheft')">
                                    <xsl:text>Ephemera</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Periodical</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </kitodo:metadata>
                </kitodo:kitodo>
            </mets:xmlData>
        </mets:mdWrap>
    </xsl:template>

    <!-- ### CatalogIDDigital ### -->
    <xsl:template match="pica:datafield[@tag='003@']/pica:subfield[@code='0']">
        <kitodo:metadata name="CatalogIDDigital">
            <xsl:value-of select="normalize-space()"/>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Besitznachweis des reproduzierten Exemplars / Signatur + Besitzer der Vorlage ### -->
    <xsl:template match="pica:datafield[@tag='009A']">
        <xsl:variable name="shelfmarksource" select="pica:subfield[@code='a']"/>
        <xsl:variable name="ownerOrig" select="pica:subfield[@code='c']"/>
        <kitodo:metadata name="shelfmarksource">
            <xsl:value-of select="normalize-space($shelfmarksource)"/>
        </kitodo:metadata>
        <kitodo:metadata name="slub_ownerOrig">
            <xsl:choose>
                <xsl:when test="($ownerOrig='SLUB Dresden')">
                    <xsl:text>SLUB Dresden</xsl:text>
                </xsl:when>
                <xsl:when test="($ownerOrig='HfBK Dresden')">
                    <xsl:text>Hochschule für Bildende Künste Dresden</xsl:text>
                </xsl:when>
                <xsl:when test="($ownerOrig='Stadtbibliothek Chemnitz')">
                    <xsl:text>Stadtbibliothek Chemnitz</xsl:text>
                </xsl:when>
            </xsl:choose>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Sprachcodes ### -->
    <xsl:template match="pica:datafield[@tag='010@']/pica:subfield[@code='a']">
        <kitodo:metadata name="DocLanguage">
            <xsl:value-of select="normalize-space()"/>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Rechteinformation ### -->
    <xsl:template name="Rechteinformation" match="pica:datafield[@tag='017M']">
        <xsl:variable name="rightsinformation" select="pica:subfield[@code='u']"/>
        <kitodo:metadata name="LegalNoteAndTermsOfUse">
            <xsl:choose>
                <xsl:when test="($rightsinformation = 'https://creativecommons.org/publicdomain/mark/1.0/')">
                    <xsl:text>PDM1.0</xsl:text>
                </xsl:when>
                <xsl:when test="($rightsinformation = 'https://creativecommons.org/licenses/by-sa/4.0/')">
                    <xsl:text>CCBYSA4.0</xsl:text>
                </xsl:when>
                <xsl:when test="($rightsinformation = 'http://rightsstatements.org/vocab/InC/1.0/')">
                    <xsl:text>INC1.0</xsl:text>
                </xsl:when>
            </xsl:choose>
        </kitodo:metadata>
        <!--*** This can be used, when rights information is not captured in the dmdSec: "LegalNoteAndTermsOfUse" ***
        <kitodo:metadata name="license"> 
            <xsl:choose>
                <xsl:when test="($rightsinformation = 'https://creativecommons.org/publicdomain/mark/1.0/')">
                    <xsl:text>pdm</xsl:text>
                </xsl:when>
                <xsl:when test="($rightsinformation = 'https://creativecommons.org/licenses/by-sa/4.0/')">
                    <xsl:text>cc-by-sa</xsl:text>
                </xsl:when>
                <xsl:when test="($rightsinformation = 'http://rightsstatements.org/vocab/InC/1.0/')">
                    <xsl:text>http://rightsstatements.org/vocab/InC/1.0/</xsl:text>
                </xsl:when>
            </xsl:choose>
        </kitodo:metadata>
        -->
    </xsl:template>
    <xsl:template name="RechteinformationVW" match="pica:datafield[@tag='037A']"><!-- It is possible to use values from other PICA fields to derive the rights information. -->
        <xsl:variable name="rightsinformationVW" select="pica:subfield[@code='a']"/>
        <kitodo:metadata name="LegalNoteAndTermsOfUse">
            <xsl:choose>
                <xsl:when test="starts-with($rightsinformationVW,'Wahrnehmung der Rechte durch die VG Wort')">
                    <xsl:text>VW1.0</xsl:text>
                </xsl:when>
            </xsl:choose>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Haupttitel, Titelzusatz, Haupttitel (Sortierung) ### -->
    <xsl:template match="pica:datafield[@tag='021A']">
        <xsl:variable name="TitleDocMain" select="pica:subfield[@code='a']"/>
        <xsl:variable name="TitleDocSub" select="pica:subfield[@code='d']"/>
        <kitodo:metadata name="TitleDocMain">
            <xsl:value-of select="normalize-space (replace($TitleDocMain, ' @', ' '))"/>
        </kitodo:metadata>
        <kitodo:metadata name="LABEL">
            <xsl:value-of select="normalize-space (replace($TitleDocMain, ' @', ' '))"/>
        </kitodo:metadata>
        <kitodo:metadata name="TitleDocSub">
            <xsl:value-of select="normalize-space($TitleDocSub)"/>
        </kitodo:metadata>
        <kitodo:metadata name="TitleDocMainShort">
            <xsl:if test="contains($TitleDocMain, ' @')">
                <xsl:value-of select="normalize-space(substring-after($TitleDocMain, ' @'))"/>
            </xsl:if>
            <xsl:if test="not(contains($TitleDocMain, ' @'))">
                <xsl:value-of select="normalize-space($TitleDocMain)"/>
            </xsl:if>
        </kitodo:metadata>
        <kitodo:metadata name="ORDERLABEL">
            <xsl:if test="contains($TitleDocMain, ' @')">
                <xsl:value-of select="normalize-space(substring-after($TitleDocMain, ' @'))"/>
            </xsl:if>
            <xsl:if test="not(contains($TitleDocMain, ' @'))">
                <xsl:value-of select="normalize-space($TitleDocMain)"/>
            </xsl:if>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Verlagsname ### -->
    <xsl:template match="pica:datafield[@tag='033A']/pica:subfield[@code='n']">
        <kitodo:metadata name="PublisherName">
            <xsl:value-of select="normalize-space()"/>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### PPN Überordnung ### -->
    <xsl:template match="pica:datafield[@tag='036D']">
        <xsl:variable name="CatalogIDDigitalAnchor" select="pica:subfield[@code='9']"/>
        <kitodo:metadata name="CatalogIDDigitalAnchor">
            <xsl:value-of select="normalize-space($CatalogIDDigitalAnchor)"/>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Erscheinungsort ### -->
    <xsl:template match="pica:datafield[@tag='033A']/pica:subfield[@code='p']">
        <kitodo:metadata name="PlaceOfPublication">
            <xsl:value-of select="normalize-space()"/>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Kollektion ### -->
    <xsl:template match="pica:datafield[@tag='036L']">
        <xsl:variable name="singleDigCollection_1" select="pica:subfield[@code='a']"/>
        <xsl:variable name="singleDigCollection_2" select="pica:subfield[@code='p']"/>
        <kitodo:metadata name="singleDigCollection">
            <xsl:choose>
                <xsl:when test="($singleDigCollection_1='Drucke des 15. Jahrhunderts') or ($singleDigCollection_2='Drucke des 15. Jahrhunderts')">
                    <xsl:text>Drucke des 15. Jahrhunderts</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Drucke des 16. Jahrhunderts') or ($singleDigCollection_2='Drucke des 16. Jahrhunderts')">
                    <xsl:text>Drucke des 16. Jahrhunderts</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Drucke des 17. Jahrhunderts') or ($singleDigCollection_2='Drucke des 17. Jahrhunderts')">
                    <xsl:text>Drucke des 17. Jahrhunderts</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Drucke des 18. Jahrhunderts') or ($singleDigCollection_2='Drucke des 18. Jahrhunderts')">
                    <xsl:text>Drucke des 18. Jahrhunderts</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Kunst') or ($singleDigCollection_2='Kunst')">
                    <xsl:text>Kunst</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Musik') or ($singleDigCollection_2='Musik')">
                    <xsl:text>Musik</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Saxonica') or ($singleDigCollection_2='Saxonica')">
                    <xsl:text>Saxonica</xsl:text>
                </xsl:when>
                <xsl:when test="($singleDigCollection_1='Technikgeschichte') or ($singleDigCollection_2='Technikgeschichte')">
                    <xsl:text>Technikgeschichte</xsl:text>
                </xsl:when>
            </xsl:choose>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Reproduktion andere physische Form / PPN ### -->
    <xsl:template match="pica:datafield[@tag='039I']/pica:subfield[@code='9']">
        <kitodo:metadata name="CatalogIDSource">
            <xsl:value-of select="normalize-space()"/>
        </kitodo:metadata>
    </xsl:template>

    <!-- ### Reproduktion andere physische Form / PPN ### 
    <xsl:template match="pica:datafield[@tag='039D']/pica:subfield[@code='9']">
        <kitodo:metadata name="CatalogIDSource">
            <xsl:value-of select="normalize-space()"/>
        </kitodo:metadata>
    </xsl:template>-->

    <!-- ### Person/Familie als 1. geistiger Schöpfer ### -->
    <xsl:template match="pica:datafield[@tag='028A']">
        <xsl:variable name="IdentifierPPN" select="pica:subfield[@code='9']"/>
        <xsl:variable name="IdentifierGND" select="pica:subfield[@code='7']"/>
        <xsl:variable name="IdentifierGNDURI" select="pica:subfield[@code='7']"/>
        <xsl:variable name="Authority" select="pica:subfield[@code='7']"/>
        <xsl:variable name="RoleCode" select="pica:subfield[@code='4']"/>
        <xsl:variable name="RoleText" select="pica:subfield[@code='B']"/>
        <xsl:variable name="LastName" select="pica:subfield[@code='A']"/>
        <xsl:variable name="LastName_2" select="pica:subfield[@code='a']"/>
        <xsl:variable name="FirstName" select="pica:subfield[@code='D']"/>
        <xsl:variable name="FirstName_2" select="pica:subfield[@code='d']"/>
        <xsl:variable name="PersonalName" select="pica:subfield[@code='P']"/>
        <xsl:variable name="AdditionalMetadataPerson" select="pica:subfield[@code='L']"/>
        <xsl:variable name="Count" select="pica:subfield[@code='N']"/>
        <kitodo:metadataGroup name="Person">
            <kitodo:metadata name="IdentifierPPN">
                <xsl:value-of select="normalize-space($IdentifierPPN)"/>
            </kitodo:metadata>
            <kitodo:metadata name="IdentifierGND">
                <xsl:choose>
                    <xsl:when test="$IdentifierGND != ''">
                        <xsl:value-of select="normalize-space(substring-after($IdentifierGND, 'gnd/'))"/>
                    </xsl:when>
                </xsl:choose>
            </kitodo:metadata>
            <kitodo:metadata name="IdentifierGNDURI">
                <xsl:choose>
                    <xsl:when test="$IdentifierGNDURI != ''">
                        <xsl:value-of select="normalize-space(concat('http://d-nb.info/',$IdentifierGND))"/>
                    </xsl:when>
                </xsl:choose>
            </kitodo:metadata>
            <kitodo:metadata name="Authority">
                <xsl:choose>
                    <xsl:when test="$Authority != ''">
                        <xsl:value-of select="normalize-space(substring-before($IdentifierGND, '/'))"/>
                    </xsl:when>
                </xsl:choose>
            </kitodo:metadata>
            <xsl:for-each select="$RoleCode">
                <kitodo:metadata name="RoleCode">
                    <xsl:value-of select="normalize-space(.)"/>
                </kitodo:metadata>
            </xsl:for-each>
            <xsl:for-each select="$RoleText">
                <kitodo:metadata name="RoleText">
                    <xsl:value-of select="normalize-space(.)"/>
                </kitodo:metadata>
            </xsl:for-each>
            <kitodo:metadata name="LastName">
                <xsl:choose>
                    <xsl:when test="($LastName != '')">
                        <xsl:value-of select="normalize-space($LastName)"/>
                    </xsl:when>
                    <xsl:when test="($LastName_2 != '')">
                        <xsl:value-of select="normalize-space($LastName_2)"/>
                    </xsl:when>
                </xsl:choose>
            </kitodo:metadata>
            <kitodo:metadata name="FirstName">
                <xsl:choose>
                    <xsl:when test="($FirstName != '')">
                        <xsl:value-of select="normalize-space($FirstName)"/>
                    </xsl:when>
                    <xsl:when test="($FirstName_2 != '')">
                        <xsl:value-of select="normalize-space($FirstName_2)"/>
                    </xsl:when>
                </xsl:choose>
            </kitodo:metadata>
            <kitodo:metadata name="DisplayForm">
                <xsl:choose>
                    <xsl:when test="(boolean($LastName) = boolean($FirstName)) and ($LastName != '')">
                        <xsl:value-of select="normalize-space(concat($LastName,', ',$FirstName))"/>
                    </xsl:when>
                    <xsl:when test="boolean($LastName) != boolean($FirstName) and ($LastName != '')">
                        <xsl:value-of select="normalize-space($LastName)"/>
                    </xsl:when>
                    <xsl:when test="boolean($FirstName) != boolean($LastName) and ($FirstName != '')">
                        <xsl:value-of select="normalize-space($FirstName)"/>
                    </xsl:when>
                    <xsl:when test="(boolean($PersonalName) = boolean($Count)) and ($PersonalName != '')">
                        <xsl:value-of select="concat($PersonalName, ' ',$Count,', ',$AdditionalMetadataPerson)"/>
                    </xsl:when>
                    <xsl:when
                            test="(boolean($PersonalName) != boolean($Count)) and (boolean($AdditionalMetadataPerson))">
                        <xsl:value-of select="concat($PersonalName,', ',$AdditionalMetadataPerson)"/>
                    </xsl:when>
                    <xsl:when
                            test="(boolean($PersonalName) != boolean($Count)) and (boolean($PersonalName) != boolean($AdditionalMetadataPerson))">
                        <xsl:value-of select="$PersonalName"/>
                    </xsl:when>
                </xsl:choose>
            </kitodo:metadata>
            <kitodo:metadata name="PersonalName">
                <xsl:value-of select="normalize-space($PersonalName)"/>
            </kitodo:metadata>
            <kitodo:metadata name="AdditionalMetadataPerson">
                <xsl:value-of select="normalize-space($AdditionalMetadataPerson)"/>
            </kitodo:metadata>
            <kitodo:metadata name="Count">
                <xsl:value-of select="normalize-space($Count)"/>
            </kitodo:metadata>
        </kitodo:metadataGroup>
    </xsl:template>

    <!-- pass-through rule -->
    <xsl:template match="@*|node()">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>
</xsl:stylesheet>
