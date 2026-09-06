import { getCollection } from 'astro:content';
import { SITE_DESCRIPTION, SITE_TITLE } from '../consts';

export async function GET(context) {
	const posts = await getCollection('blog');

	const items = posts
		.map(
			(post) => `
		<item>
			<title><![CDATA[${post.data.title}]]></title>
			<link>${context.site}/blog/${post.id}/</link>
			<guid>${context.site}/blog/${post.id}/</guid>
			<description><![CDATA[${post.data.description}]]></description>
			<pubDate>${post.data.pubDate.toUTCString()}</pubDate>
		</item>`
		)
		.join('');

	const xml = `<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="/rss-styles.xsl"?>
<rss version="2.0">
	<channel>
		<title>${SITE_TITLE}</title>
		<link>${context.site}</link>
		<description>${SITE_DESCRIPTION}</description>
		<language>en-us</language>${items}
	</channel>
</rss>`;

	return new Response(xml, {
		headers: { 'Content-Type': 'application/xml; charset=utf-8' },
	});
}
