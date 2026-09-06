import { getCollection } from 'astro:content';
import rss from '@astrojs/rss';
import { SITE_DESCRIPTION, SITE_TITLE } from '../consts';

export async function GET(context) {
	const posts = await getCollection('blog');
	const feed = rss({
		title: SITE_TITLE,
		description: SITE_DESCRIPTION,
		site: context.site,
		items: posts.map((post) => ({
			...post.data,
			link: `/blog/${post.id}/`,
		})),
	});

	const xml = await feed.text();

	const styledXml = xml.replace(
		'<?xml version="1.0" encoding="UTF-8"?>',
		'<?xml version="1.0" encoding="UTF-8"?>\n<?xml-stylesheet type="text/xsl" href="/rss-styles.xsl"?>'
	);

	return new Response(styledXml, {
		headers: { 'Content-Type': 'application/xml; charset=utf-8' },
	});
}
