<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<TITLE>{$article->getArticleTitle()}</TITLE>
</HEAD>
<BODY LINK=\"#0000ff\" VLINK=\"#800080\">
<P>[text pii="{$pii}" doctopic="oa" language="{$localeShort}" ccode="{$ccode}" status="1" version="3.1" type="nd" order="{$articleOrder}" seccode="{$seccode}" sponsor="nd" stitle="{$stitle}" volid="{$issue->getVolume()}" issueno="{$issue->getNumber()}" dateiso="{$issue->getDatePublished()|date_format:'%Y%m00'}" fpage="{$fPage}" lpage="{$lPage}" issn="{$onlineIssn}" toccode="1"]</P>


<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[titlegrp]</FONT><FONT FACE=\"Arial\" COLOR=\"#000080\">[title language={$localeShort}]</FONT>{$articleTitle}<FONT FACE=\"Arial\" COLOR=\"#000080\">[/title]</FONT>{if $articleSubTitle}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[subtitle]</FONT>{$articleSubTitle}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[/subtitle]</FONT>{/if}
<FONT FACE=\"Arial\" COLOR=\"#000080\">[title language=en]</FONT>{$articleTitleEnUS}<FONT FACE=\"Arial\" COLOR=\"#000080\">[/title]</FONT>{if $articleSubTitleEnUs}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[subtitle]</FONT>{$articleSubTitleEnUs}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[/subtitle]</FONT>{/if}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[/titlegrp]</FONT>
<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[authgrp]</FONT>
{foreach from=$authors item=author}
{foreach from=$affs key=keyvar item=aff}{if $articlesExtrasDao->getAuthorMetadataByAuthorId($author->getAuthorId(), "aff_orgname") == $aff.aff_orgname}{assign var="affId" value=$keyvar}{/if}{/foreach}
<FONT FACE="Arial" COLOR="#000080">[author role="nd" rid="{$affId}"]</FONT>
<FONT FACE="Arial" COLOR="#008080">[fname]</FONT>{$author->getFirstName()}<FONT FACE="Arial" COLOR="#008080">[/fname][surname]</FONT>{$author->getLastName()}<FONT FACE="Arial" COLOR="#008080">[/surname]</FONT><FONT FACE="Arial" COLOR="#000080">[/author]</FONT>
{/foreach}
<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[/authgrp]</FONT>

<BR /><BR />
{assign var="hadaffs" value=1}
{if count($affs) <= 1 }
{foreach from=$affs key=keyvar item=aff}
{if $aff.aff_orgname == ""}
{assign var="hadaffs" value=0}
{/if}
{/foreach}
{/if}

<br/>
{if $hadaffs == 0}
[aff id="a01" orgname="{$publisherInstitution}"][city]{$city}[/city][country]{$country}[/country][zipcode]{$zipcode}[/zipcode]{if $affsAreTheSame}[email]{$firstAuthor->getEmail()}[/email]{/if}[/aff]
{else}
{foreach from=$affs key=keyvar item=aff}
{assign var="afforgname" value=$aff.aff_orgname|replace:'"':''}
{assign var="afforgname" value=$afforgname|replace:'“':''}
{assign var="afforgname" value=$afforgname|replace:'”':''}
{assign var="afforgname" value=$afforgname|replace:'¨':''}

{assign var="orgdiv1" value=$aff.aff_orgdiv1|replace:'"':''}
{assign var="orgdiv1" value=$orgdiv1|replace:'“':''}
{assign var="orgdiv1" value=$orgdiv1|replace:'”':''}
{assign var="orgdiv1" value=$orgdiv1|replace:'¨':''}

{assign var="orgdiv2" value=$aff.aff_orgdiv2|replace:'"':''}
{assign var="orgdiv2" value=$orgdiv2|replace:'“':''}
{assign var="orgdiv2" value=$orgdiv2|replace:'”':''}
{assign var="orgdiv2" value=$orgdiv2|replace:'¨':''}

{assign var="orgdiv3" value=$aff.aff_orgdiv3|replace:'"':''}
{assign var="orgdiv3" value=$orgdiv3|replace:'“':''}
{assign var="orgdiv3" value=$orgdiv3|replace:'”':''}
{assign var="orgdiv3" value=$orgdiv3|replace:'¨':''}

[aff id="{$keyvar}" orgname="{$afforgname}"{if $aff.aff_orgdiv1 != ""} orgdiv1="{$orgdiv1}"{/if}{if $aff.aff_orgdiv2 != ""} orgdiv2="{$orgdiv2}"{/if}{if $aff.aff_orgdiv3 != ""} orgdiv3="{$orgdiv3}"{/if}]{if $aff.aff_city != ""}[city]{$aff.aff_city}[/city]{/if}{if $aff.aff_state != ""}[state]{$aff.aff_state}[/state]{/if}{if $aff.aff_country != ""}[country]{$aff.aff_country}[/country]{/if}{if $aff.aff_zipcode != ""}[zipcode]{$aff.aff_zipcode}[/zipcode]{/if}{*if $aff.aff_email != ""}[email]{$aff.aff_email}[/email]{/if*}[/aff]
<br />
{/foreach}
{/if}
<br /><br />
<HR />
<br />

{$body}
<FONT FACE=\"Arial\" COLOR=\"#008000\">[back]</FONT>

{if $refCount != 0}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[vancouv standard=vancouv count="{$refCount}"]</FONT>{assign var='counter' value=1}
{foreach from=$citations item=citation}<FONT FACE=\"Arial\" COLOR=\"#000080\"><LI>[vcitat]</FONT><FONT FACE=\"Arial\" COLOR=\"#008080\">[no]</FONT>{$counter}<FONT FACE=\"Arial\" COLOR=\"#008080\">[/no]</FONT>{$citation->getCitation()}<FONT FACE=\"Arial\" COLOR=\"#000080\">[/vcitat]</LI></FONT><BR/>{assign var='counter' value=$counter+1}{/foreach}<FONT FACE=\"Arial\" COLOR=\"#ff0000\">[/vancouv]</FONT>{/if}



{$article->getDateSubmitted()|date_format:'%d/%B/%Y'}
{$article->getDatePublished()|date_format:'%d/%B/%Y'}



<FONT FACE=\"Arial\" COLOR=\"#008000\">[/back]</FONT>
[/text]
</BODY>
</HTML>
