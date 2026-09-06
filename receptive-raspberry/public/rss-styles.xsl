<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:dc="http://purl.org/dc/elements/1.1/">

<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title><xsl:value-of select="/rss/channel/title" /> — RSS Feed</title>
<style>
:root {
	--color-bg: #0a0a0a;
	--color-text-primary: #e8e0c8;
	--color-text-heading: #f2d675;
	--color-text-muted: #b8a968;
	--color-accent: #d4af37;
	--color-accent-hover: #f0c93d;
	--color-surface: rgba(212, 175, 55, 0.05);
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
	font-family: Georgia, 'Times New Roman', serif;
	background: #0a0a0a;
	color: var(--color-text-primary);
	line-height: 1.7;
	min-height: 100vh;
}
header {
	background: rgba(10, 10, 10, 0.95);
	border-bottom: 1px solid var(--color-accent);
	padding: 2em 1em;
	text-align: center;
}
header h1 {
	color: var(--color-text-heading);
	font-size: 2em;
	margin-bottom: 0.3em;
}
header p {
	color: var(--color-text-muted);
	font-size: 14px;
}
.rss-badge {
	display: inline-flex;
	align-items: center;
	gap: 0.5em;
	background: var(--color-surface);
	border: 1px solid var(--color-accent);
	border-radius: 50px;
	padding: 0.5em 1.2em;
	margin: 1em auto 0;
	font-size: 13px;
	color: var(--color-accent);
}
.rss-badge svg {
	width: 16px;
	height: 16px;
}
main {
	max-width: 720px;
	margin: 0 auto;
	padding: 2em 1em;
}
.feed-info {
	background: var(--color-surface);
	border: 1px solid var(--color-text-muted);
	border-radius: 8px;
	padding: 1.5em;
	margin-bottom: 2em;
	font-size: 14px;
	color: var(--color-text-muted);
	line-height: 1.6;
}
.feed-info a {
	color: var(--color-accent);
	text-decoration: none;
}
.feed-info a:hover {
	color: var(--color-accent-hover);
}
.item {
	background: var(--color-surface);
	border: 1px solid rgba(184, 169, 104, 0.2);
	border-radius: 8px;
	padding: 1.5em;
	margin-bottom: 1.5em;
	transition: border-color 0.2s ease;
}
.item:hover {
	border-color: var(--color-accent);
}
.item-title {
	margin-bottom: 0.5em;
}
.item-title a {
	color: var(--color-text-heading);
	font-size: 1.3em;
	text-decoration: none;
	font-weight: 700;
}
.item-title a:hover {
	color: var(--color-accent-hover);
}
.item-date {
	color: var(--color-text-muted);
	font-size: 13px;
	margin-bottom: 0.8em;
}
.item-desc {
	color: var(--color-text-primary);
	font-size: 15px;
	line-height: 1.7;
}
.item-desc a {
	color: var(--color-accent);
}
footer {
	text-align: center;
	padding: 2em 1em;
	color: var(--color-text-muted);
	font-size: 13px;
	border-top: 1px solid rgba(184, 169, 104, 0.2);
}
</style>
</head>
<body>
<header>
	<h1>&#8982; <xsl:value-of select="/rss/channel/title" /></h1>
	<p><xsl:value-of select="/rss/channel/description" /></p>
	<div class="rss-badge">
		<svg viewBox="0 0 16 16" fill="currentColor"><path d="M2 11.5a1.5 1.5 0 1 1 3 0 1.5 1.5 0 0 1-3 0zm0-4a5.5 5.5 0 0 1 5.5 5.5h-2a3.5 3.5 0 0 0-3.5-3.5v-2zm0-4a9.5 9.5 0 0 1 9.5 9.5h-2A7.5 7.5 0 0 0 2 5.5v-2z"/></svg>
		RSS Feed
	</div>
</header>
<main>
	<div class="feed-info">
		<p>This is an RSS feed. Copy this URL and paste it into your favorite RSS reader (like Feedly, Inoreader, or NetNewsWire) to subscribe and receive updates automatically.</p>
		<p style="margin-top: 0.8em;">Feed URL: <a href="{/rss/channel/link}"><xsl:value-of select="/rss/channel/link" /></a></p>
	</div>
	<xsl:for-each select="/rss/channel/item">
		<div class="item">
			<div class="item-title">
				<a>
					<xsl:attribute name="href"><xsl:value-of select="link" /></xsl:attribute>
					<xsl:value-of select="title" />
				</a>
			</div>
			<div class="item-date">
				<xsl:value-of select="pubDate" />
			</div>
			<div class="item-desc">
				<xsl:value-of select="description" />
			</div>
		</div>
	</xsl:for-each>
</main>
<footer>
	<p>Horologiarius — The Watchmaker &#8982;</p>
</footer>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
