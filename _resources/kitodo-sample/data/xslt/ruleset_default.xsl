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
                xmlns:dv="https://dfg-viewer.de/profil-der-metadaten/"
                xmlns:kitodo="http://meta.kitodo.org/v1/" 
                xmlns:mods="http://www.loc.gov/mods/v3" 
                xmlns:mets="http://www.loc.gov/METS/" 
                xmlns:xlink="http://www.w3.org/1999/xlink" 
                >
    <xsl:output method="xml" indent="yes" encoding="utf-8" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/*">
        <xsl:copy>
            <xsl:namespace name="dv">
                <xsl:value-of select="'https://dfg-viewer.de/profil-der-metadaten/'"/>
            </xsl:namespace>
            <xsl:namespace name="kitodo">
                <xsl:value-of select="'http://meta.kitodo.org/v1/'"/>
            </xsl:namespace>
            <xsl:namespace name="mods">
                <xsl:value-of select="'http://www.loc.gov/mods/v3'"/>
            </xsl:namespace>
            <xsl:namespace name="xlink">
                <xsl:value-of select="'http://www.w3.org/1999/xlink'"/>
            </xsl:namespace>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mets:dmdSec/mets:mdWrap">
        <xsl:copy>
            <xsl:attribute name="MDTYPE">MODS</xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mets:amdSec/mets:rightsMD/mets:mdWrap">
        <xsl:copy>
            <xsl:attribute name="MDTYPE">OTHER</xsl:attribute>
            <xsl:attribute name="MIMETYPE">text/xml</xsl:attribute>
            <xsl:attribute name="OTHERMDTYPE">DVRIGHTS</xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mets:amdSec/mets:digiprovMD/mets:mdWrap">
        <xsl:copy>
            <xsl:attribute name="MDTYPE">OTHER</xsl:attribute>
            <xsl:attribute name="MIMETYPE">text/xml</xsl:attribute>
            <xsl:attribute name="OTHERMDTYPE">DVLINKS</xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mets:structMap[@TYPE='PHYSICAL']/mets:div">
        <xsl:copy>
            <xsl:attribute name="TYPE">physSequence</xsl:attribute>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mets:fileGrp">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()[not(self::mets:file)]"/>
            <xsl:apply-templates select="mets:file">
                <xsl:sort select="mets:FLocat/@xlink:href" order="ascending"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="mets:amdSec/mets:rightsMD/mets:mdWrap/mets:xmlData/kitodo:kitodo">
        <xsl:variable name="license" select="kitodo:metadata[@name='license']"/>
        <xsl:variable name="owner" select="kitodo:metadata[@name='owner']"/><!-- metadata from project configuration -->
        <xsl:variable name="ownerContact" select="kitodo:metadata[@name='ownerContact']"/><!-- metadata from project configuration -->
        <xsl:variable name="ownerLogo" select="kitodo:metadata[@name='ownerLogo']"/><!-- metadata from project configuration -->
        <xsl:variable name="ownerSiteURL" select="kitodo:metadata[@name='ownerSiteURL']"/><!-- metadata from project configuration -->
        <xsl:variable name="rights" select="/mets:mets/mets:dmdSec/mets:mdWrap/mets:xmlData/kitodo:kitodo/kitodo:metadata[@name='LegalNoteAndTermsOfUse']"/><!-- metadata from the dmdSec -->
        <dv:rights>
            <xsl:if test="$owner">
                <dv:owner>
                    <xsl:value-of select="normalize-space($owner)"/>
                </dv:owner>
            </xsl:if>
            <xsl:if test="$ownerLogo">
                <dv:ownerLogo>
                    <xsl:value-of select="normalize-space($ownerLogo)"/>
                </dv:ownerLogo>
            </xsl:if>
            <xsl:if test="$ownerSiteURL">
                <dv:ownerSiteURL>
                    <xsl:value-of select="normalize-space($ownerSiteURL)"/>
                </dv:ownerSiteURL>
            </xsl:if>
            <xsl:if test="$ownerContact">
                <dv:ownerContact>
                    <xsl:value-of select="normalize-space($ownerContact)"/>
                </dv:ownerContact>
            </xsl:if>
            <!-- *** Values of $rights are used ***
            <xsl:if test="$license">
                <dv:license>
                    <xsl:value-of select="normalize-space($license)"/>
                </dv:license>
            </xsl:if>-->
            <xsl:if test="$rights">
                <dv:license>
                    <xsl:choose>
                        <xsl:when test="($rights = 'PDM1.0')">
                            <xsl:text>pdm</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'CC01.0')">
                            <xsl:text>cc0</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'CCBYSA4.0')">
                            <xsl:text>cc-by-sa</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'CCBYNCSA4.0')">
                            <xsl:text>cc-by-nc-sa</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'FZRV1.0INC1.0')">
                            <xsl:text>https://rightsstatements.org/page/InC/1.0</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'FZRV1.0')">
                            <xsl:text>reserved</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'INC1.0')">
                            <xsl:text>https://rightsstatements.org/page/InC/1.0</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'VW1.0')">
                            <xsl:text>https://rightsstatements.org/page/InC/1.0</xsl:text>
                        </xsl:when>
                        <xsl:when test="($rights = 'TODR1.0')">
                            <xsl:text>reserved</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                </dv:license>
            </xsl:if>
        </dv:rights>
    </xsl:template>

    <xsl:template match="mets:amdSec/mets:digiprovMD/mets:mdWrap/mets:xmlData/kitodo:kitodo">
        <!-- 
        *** metadata from project configuration - due to the transformations of newspaper processes, the metadata "processTitle" and "CatalogIDDigital'" from the dmdSec is used. Otherwise, the values from the project configuration can be used.***
        <xsl:variable name="presentation" select="kitodo:metadata[@name='presentation']"/>
        <xsl:variable name="reference" select="kitodo:metadata[@name='reference']"/>
        -->
        <xsl:variable name="processTitle" select="/mets:mets/mets:dmdSec/mets:mdWrap/mets:xmlData/kitodo:kitodo/kitodo:metadata[@name='processTitle']"/><!-- metadata from the dmdSec -->
        <xsl:variable name="catalogIDDigital" select="/mets:mets/mets:dmdSec/mets:mdWrap/mets:xmlData/kitodo:kitodo/kitodo:metadata[@name='CatalogIDDigital']"/><!-- metadata from the dmdSec -->
        <dv:links>
            <dv:presentation>
                <xsl:if test="$catalogIDDigital">
                    <xsl:value-of select="normalize-space(concat('https://digital.slub-dresden.de/id',$catalogIDDigital))"/>
                </xsl:if>
                <xsl:if test="$processTitle">
                    <xsl:choose>
                        <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)')"><!-- identifier for newspaper issues -->
                            <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)', 'https://digital.slub-dresden.de/id$2-$3'))"/>
                        </xsl:when>
                        <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})')"><!-- identifier for newspaper issues -->
                            <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})', 'https://digital.slub-dresden.de/id$2-$3'))"/>
                        </xsl:when>
                        <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})')"><!-- identifier for newspaper year -->
                            <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})', 'https://digital.slub-dresden.de/id$2-$3'))"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
            </dv:presentation>
            <dv:reference>
                <xsl:if test="$catalogIDDigital">
                    <xsl:choose>
                        <xsl:when test="matches($catalogIDDigital,'^[0-9]{8,9}[0-9X]{1}$')"><!-- identifier for processes with an own PPN -->
                            <xsl:value-of select="normalize-space(concat('http://dienste.slub-dresden.de/cgi-bin/FOZK.pl?PPN=',$catalogIDDigital))"/>
                        </xsl:when>
                        <xsl:when test="matches($catalogIDDigital,'^([0-9]{8,9}[0-9X]{1})(-)([0-9]{4,10})$')"><!-- identifier for processes without an own PPN - PPN is extracted; otherwise there would be no result in the catalog search -->
                            <xsl:value-of select="normalize-space(replace($catalogIDDigital,'^([0-9]{8,9}[0-9X]{1})(-)([0-9]{4,10})', 'http://dienste.slub-dresden.de/cgi-bin/FOZK.pl?PPN=$1'))"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="$processTitle">
                    <xsl:choose>
                        <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)')"><!-- identifier for newspaper issues - PPN of parent process is extracted; otherwise there would be no result in the catalog search -->
                            <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)', 'http://dienste.slub-dresden.de/cgi-bin/FOZK.pl?PPN=$2'))"/>
                        </xsl:when>
                        <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})')"><!-- identifier for newspaper issues - PPN of parent process is extracted; otherwise there would be no result in the catalog search -->
                            <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})', 'http://dienste.slub-dresden.de/cgi-bin/FOZK.pl?PPN=$2'))"/>
                        </xsl:when>
                        <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})')"><!-- identifier for newspaper year - PPN of parent process is extracted; otherwise there would be no result in the catalog search -->
                            <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})', 'http://dienste.slub-dresden.de/cgi-bin/FOZK.pl?PPN=$2'))"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
            </dv:reference>
        </dv:links>
    </xsl:template>

    <xsl:template name="dmdSec" match="mets:dmdSec/mets:mdWrap/mets:xmlData/kitodo:kitodo">
        <xsl:variable name="title" select="kitodo:metadata[@name='TitleDocMain']"/>
        <xsl:variable name="subTitle" select="kitodo:metadata[@name='TitleDocSub1']"/>
        <xsl:variable name="personGroup" select="kitodo:metadataGroup[@name='Person']"/>
        <xsl:variable name="slubOwnerOrig" select="kitodo:metadata[@name='slub_ownerOrig']"/>
        <xsl:variable name="publicationPlace" select="kitodo:metadata[@name='PlaceOfPublication']"/>
        <xsl:variable name="publisher" select="kitodo:metadata[@name='PublisherName']"/>
        <xsl:variable name="language" select="kitodo:metadata[@name='DocLanguage']"/>
        <xsl:variable name="script" select="kitodo:metadata[@name='slub_script']"/>
        <xsl:variable name="collection" select="kitodo:metadata[@name='singleDigCollection']"/>
        <xsl:variable name="recordIdentifierHost" select="kitodo:metadata[@name='CatalogIDDigitalAnchor']"/>
        <xsl:variable name="processTitle" select="kitodo:metadata[@name='processTitle']"/>
        <xsl:variable name="catalogIDDigital" select="kitodo:metadata[@name='CatalogIDDigital']"/>
        <xsl:variable name="shelfLocator" select="kitodo:metadata[@name='shelfmarksource']"/>
        <xsl:variable name="rights" select="kitodo:metadata[@name='LegalNoteAndTermsOfUse']"/>
        <xsl:variable name="TSL_ATS" select="kitodo:metadata[@name='TSL_ATS']"/>
        <mods:mods>
            <xsl:if test="$title or $subTitle">
                <mods:titleInfo>
                    <xsl:if test="$title">
                        <xsl:for-each select="$title">
                            <mods:title>
                                <xsl:value-of select="normalize-space($title)"/>
                            </mods:title>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="$subTitle">
                        <xsl:for-each select="$subTitle">
                            <mods:subTitle>
                                <xsl:value-of select="normalize-space($subTitle)"/>
                            </mods:subTitle>
                    </xsl:for-each>
                        </xsl:if>
                </mods:titleInfo>
            </xsl:if>
            <xsl:if test="$personGroup">
                <xsl:apply-templates select="$personGroup"/>
            </xsl:if>
            <xsl:if test="$slubOwnerOrig">
                <mods:name type="corporate">
                    <mods:role>
                        <mods:roleTerm authority="marcrelator" type="code">
                            <xsl:text>len</xsl:text>
                        </mods:roleTerm>
                    </mods:role>
                    <mods:displayForm>
                        <xsl:value-of select="normalize-space($slubOwnerOrig)"/>
                    </mods:displayForm>
                </mods:name>
            </xsl:if>
            <xsl:if test="$publicationPlace or $publisher">
                <mods:originInfo eventType="publication">
                    <xsl:if test="$publicationPlace">
                        <mods:place>
                            <xsl:for-each select="$publicationPlace">
                                <mods:placeTerm type="text">
                                    <xsl:value-of select="(.)"/>
                                </mods:placeTerm>
                            </xsl:for-each>
                        </mods:place>
                    </xsl:if>
                    <xsl:if test="$publisher">
                        <xsl:for-each select="$publisher">
                            <mods:publisher>
                                <xsl:value-of select="(.)"/>
                            </mods:publisher>
                        </xsl:for-each>
                    </xsl:if>
                </mods:originInfo>
            </xsl:if>
            <xsl:if test="$script or $language">
                <mods:language>
                    <xsl:if test="($language != '')">
                        <xsl:for-each select="$language">
                            <mods:languageTerm type="code" authority="rfc3066">
                                <xsl:value-of select="(.)"/>
                            </mods:languageTerm>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="($language = '') or not($language)">
                        <mods:languageTerm type="code" authority="rfc3066">
                            <xsl:text>und</xsl:text>
                        </mods:languageTerm>
                    </xsl:if>
                    <xsl:if test="$script">
                        <mods:scriptTerm type="code" authority="iso15924">
                            <xsl:choose>
                                <xsl:when test="($script = 'Fraktur')">
                                    <xsl:text>Latf</xsl:text>
                                </xsl:when>
                                <xsl:when test="($script = 'Antiqua')">
                                    <xsl:text>Latn</xsl:text>
                                </xsl:when>
                            </xsl:choose>
                        </mods:scriptTerm>
                    </xsl:if>
                </mods:language>
            </xsl:if>
            <xsl:if test="$collection">
                <xsl:for-each select="$collection">
                    <mods:relatedItem type="series">
                        <mods:titleInfo>
                            <mods:title lang="ger">
                                <xsl:value-of select="normalize-space(.)"/>
                            </mods:title>
                        </mods:titleInfo>
                    </mods:relatedItem>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="$recordIdentifierHost or $processTitle">
                <mods:relatedItem type="host">
                    <mods:recordInfo>
                        <mods:recordIdentifier source="http://digital.slub-dresden.de/oai/">
                            <xsl:if test="$recordIdentifierHost"><!-- record identifier host for standard document types -->
                                <xsl:value-of select="normalize-space(concat('oai:de:slub-dresden:db:id-',$recordIdentifierHost))"/>
                            </xsl:if>
                            <xsl:if test="$processTitle"><!-- record identifier host for newspaper issue and newspaper year -->
                                <xsl:choose>
                                    <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)')">
                                        <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)', 'oai:de:slub-dresden:db:id-$2'))"/>
                                    </xsl:when>
                                    <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})')">
                                        <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})', 'oai:de:slub-dresden:db:id-$2'))"/>
                                    </xsl:when>
                                    <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})')">
                                        <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})', 'oai:de:slub-dresden:db:id-$2'))"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                        </mods:recordIdentifier>
                    </mods:recordInfo>
                </mods:relatedItem>
            </xsl:if>
            <xsl:if test="$catalogIDDigital or $processTitle">
                <mods:identifier type="purl">
                    <xsl:if test="$catalogIDDigital"><!-- purl for standard document types -->
                        <xsl:value-of select="normalize-space(concat('http://digital.slub-dresden.de/id',$catalogIDDigital))"/>
                    </xsl:if>
                    <xsl:if test="$processTitle"><!-- purl for newspaper issue and newspaper year -->
                        <xsl:choose>
                            <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)')">
                                <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)', 'http://digital.slub-dresden.de/id$2-$3'))"/>
                            </xsl:when>
                            <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})')">
                                <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})', 'http://digital.slub-dresden.de/id$2-$3'))"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                </mods:identifier>
                <mods:identifier type="urn">
                    <xsl:if test="$catalogIDDigital"><!-- urn without check digit for standard document types -->
                        <xsl:value-of select="normalize-space(concat('urn:nbn:de:bsz:14-db-id',$catalogIDDigital))"/>
                    </xsl:if>
                    <xsl:if test="$processTitle"><!-- urn without check digit for newspaper issue and newspaper year -->
                        <xsl:choose>
                            <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)')">
                                <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)', 'urn:nbn:de:bsz:14-db-id$2-$3'))"/>
                            </xsl:when>
                            <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})')">
                                <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})', 'urn:nbn:de:bsz:14-db-id$2-$3'))"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                </mods:identifier>
            </xsl:if>
            <xsl:if test="$shelfLocator != '' or $slubOwnerOrig">
                <mods:location>
                    <xsl:if test="$slubOwnerOrig">
                        <xsl:choose>
                            <xsl:when test="($slubOwnerOrig = 'Hochschule für Bildende Künste Dresden')">
                                <mods:physicalLocation valueURI="https://ld.zdb-services.de/resource/organisations/DE-540" authority="marcorg" displayLabel="Hochschule für Bildende Künste Dresden">
                                    <xsl:text>DE-540</xsl:text>
                                </mods:physicalLocation>
                            </xsl:when>
                            <xsl:when test="($slubOwnerOrig = 'SLUB Dresden') or not($slubOwnerOrig) or ($slubOwnerOrig = '')">
                                <mods:physicalLocation valueURI="https://ld.zdb-services.de/resource/organisations/DE-14" authority="marcorg" displayLabel="SLUB Dresden">
                                    <xsl:text>DE-14</xsl:text>
                                </mods:physicalLocation>
                            </xsl:when>
                            <xsl:when test="($slubOwnerOrig = 'Stadtbibliothek Chemnitz')">
                                <mods:physicalLocation valueURI="https://ld.zdb-services.de/resource/organisations/DE-59" authority="marcorg" displayLabel="Stadtbibliothek Chemnitz">
                                    <xsl:text>DE-59</xsl:text>
                                </mods:physicalLocation>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                    <xsl:if test="$shelfLocator">
                        <mods:shelfLocator>
                            <xsl:value-of select="normalize-space($shelfLocator)"/>
                        </mods:shelfLocator>
                    </xsl:if>
                </mods:location>
            </xsl:if>
            <xsl:if test="$rights">
                <xsl:choose>
                    <xsl:when test="($rights = 'PDM1.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href ="http://creativecommons.org/publicdomain/mark/1.0/">
                            <xsl:text>Public Domain Mark 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'CC01.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href="http://creativecommons.org/publicdomain/zero/1.0/">
                            <xsl:text>CC0 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'CCBYSA4.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href="http://creativecommons.org/licenses/by-sa/4.0/">
                            <xsl:text>CC BY-SA 4.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'CCBYNCSA4.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
                            <xsl:text>CC BY-NC-SA 4.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'FZRV1.0INC1.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/InC/1.0/">
                            <xsl:text>Urheberrechtsschutz 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition type="local terms of use" xlink:href="http://nutzungshinweis.slub-dresden.de/fz-rv/1.0/">
                            <xsl:text>Freier Zugang - Rechte vorbehalten 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'FZRV1.0')">
                        <mods:accessCondition type="local terms of use" xlink:href="http://nutzungshinweis.slub-dresden.de/fz-rv/1.0/">
                            <xsl:text>Freier Zugang - Rechte vorbehalten 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'INC1.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/InC/1.0/">
                            <xsl:text>Urheberrechtsschutz 1.0</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                    <xsl:when test="($rights = 'VW1.0')">
                        <mods:accessCondition type="use and reproduction" xlink:href="http://rightsstatements.org/vocab/InC/1.0/">
                            <xsl:text>Urheberrechtsschutz 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition type="local terms of use" xlink:href="http://nutzungshinweis.slub-dresden.de/fz-rv/1.0/">
                            <xsl:text>Freier Zugang - Rechte vorbehalten 1.0</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition type="out of print work">
                            <xsl:text>Wahrnehmung der Rechte durch die VG WORT (§ 51 VGG)</xsl:text>
                        </mods:accessCondition>
                        <mods:accessCondition displayLabel="Access Status" type="restriction on access" xlink:href="http://purl.org/coar/access_right/c_abf2">
                            <xsl:text>Open Access</xsl:text>
                        </mods:accessCondition>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
            <xsl:if test="$catalogIDDigital or $processTitle">
                <mods:recordInfo>
                    <mods:recordIdentifier source="http://digital.slub-dresden.de/oai/">
                        <xsl:if test="$catalogIDDigital"><!-- record identifier for standard document types -->
                            <xsl:value-of select="normalize-space(concat('oai:de:slub-dresden:db:id-',$catalogIDDigital))"/>
                        </xsl:if>
                        <xsl:if test="$processTitle"><!-- record identifier for newspaper issue and newspaper year -->
                            <xsl:choose>
                                <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)')">
                                    <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})_(.*)', 'oai:de:slub-dresden:db:id-$2-$3'))"/>
                                </xsl:when>
                                <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})')">
                                    <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4,10})', 'oai:de:slub-dresden:db:id-$2-$3'))"/>
                                </xsl:when>
                                <xsl:when test="matches($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})')">
                                    <xsl:value-of select="normalize-space(replace($processTitle,'^(.*)_([0-9]{8,9}[0-9X]{1})-([0-9]{4})', 'oai:de:slub-dresden:db:id-$2-$3'))"/>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:if>
                    </mods:recordIdentifier>
                </mods:recordInfo>
            </xsl:if>
        </mods:mods>
    </xsl:template>

    <xsl:template name="personGroup" match="kitodo:kitodo/kitodo:metadataGroup[@name='Person']">
        <xsl:variable name="firstName" select="kitodo:metadata[@name='FirstName']"/>
        <xsl:variable name="lastName" select="kitodo:metadata[@name='LastName']"/>
        <xsl:variable name="displayForm" select="kitodo:metadata[@name='DisplayForm']"/>
        <xsl:variable name="personalName" select="kitodo:metadata[@name='PersonalName']"/>
        <xsl:variable name="additionalMetadataPerson" select="kitodo:metadata[@name='AdditionalMetadataPerson']"/>
        <xsl:variable name="count" select="kitodo:metadata[@name='Count']"/>
        <xsl:variable name="roleCode" select="kitodo:metadata[@name='RoleCode']"/>
        <xsl:variable name="identifierGND" select="kitodo:metadata[@name='IdentifierGND']"/>
        <xsl:variable name="identifierGNDURI" select="kitodo:metadata[@name='IdentifierGNDURI']"/>
        <xsl:variable name="authority" select="kitodo:metadata[@name='Authority']"/>
        <mods:name type="personal">
            <xsl:if test="$personalName">
                <mods:namePart>
                    <xsl:value-of select="normalize-space($personalName)"/>
                </mods:namePart>
            </xsl:if>
            <xsl:if test="$lastName">
                <mods:namePart type="family">
                    <xsl:value-of select="normalize-space($lastName)"/>
                </mods:namePart>
            </xsl:if>
            <xsl:if test="$firstName">
                <mods:namePart type="given">
                    <xsl:value-of select="normalize-space($firstName)"/>
                </mods:namePart>
            </xsl:if>
            <xsl:if test="$additionalMetadataPerson">
                <mods:namePart type="termsOfAddress">
                    <xsl:choose>
                        <xsl:when test="(boolean($additionalMetadataPerson) = boolean($count))">
                            <xsl:value-of select="concat($count, ', ',$additionalMetadataPerson)"/>
                        </xsl:when>
                        <xsl:when test="(boolean($additionalMetadataPerson) != boolean($count))">
                            <xsl:value-of select="($additionalMetadataPerson)"/>
                        </xsl:when>
                    </xsl:choose>
                </mods:namePart>
            </xsl:if>
            <xsl:if test="$displayForm">
                <mods:displayForm>
                    <xsl:value-of select="normalize-space($displayForm)"/>
                </mods:displayForm>
            </xsl:if>
            <xsl:if test="$roleCode">
                <mods:role>
                    <mods:roleTerm type="code" authority="marcrelator">
                        <xsl:value-of select="normalize-space($roleCode)"/>
                    </mods:roleTerm>
                </mods:role>
            </xsl:if>
            <xsl:if test="$identifierGND or $authority or $identifierGNDURI">
                <mods:nameIdentifier>
                    <xsl:if test="$authority">
                        <xsl:attribute name="type">
                            <xsl:value-of select="$authority"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="$identifierGNDURI">
                        <xsl:attribute name="typeURI">
                            <xsl:value-of select="$identifierGNDURI"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="$identifierGND">
                        <xsl:value-of select="normalize-space($identifierGND)"/>
                    </xsl:if>
                </mods:nameIdentifier>
            </xsl:if>
        </mods:name>
    </xsl:template>

    <xsl:template match="@TYPE">
        <xsl:attribute name="TYPE">
            <xsl:choose>
                <xsl:when test=". = 'Article'">
                    <xsl:text>article</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'Chapter'">
                    <xsl:text>chapter</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'ContainedWork'">
                    <xsl:text>contained_work</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'Manuscript'">
                    <xsl:text>manuscript</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'Monograph'">
                    <xsl:text>monograph</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'MultiVolumeWork'">
                    <xsl:text>multivolume_work</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'Newspaper'">
                    <xsl:text>newspaper</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'NewspaperYear'">
                    <xsl:text>year</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'NewspaperMonth'">
                    <xsl:text>month</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'NewspaperDay'">
                    <xsl:text>day</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'Periodical'">
                    <xsl:text>periodical</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'PeriodicalIssue'">
                    <xsl:text>issue</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'PeriodicalVolume'">
                    <xsl:text>volume</xsl:text>
                </xsl:when>
                <xsl:when test=". = 'Volume'">
                    <xsl:text>volume</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="(.)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

    <!-- pass-through rule -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
