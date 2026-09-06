import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const blog = defineCollection({
	loader: glob({ base: './src/content/blog', pattern: '**/*.{md,mdx}' }),
	schema: ({ image }) =>
		z.object({
			title: z.string(),
			description: z.string(),
			pubDate: z.coerce.date(),
			updatedDate: z.coerce.date().optional(),
			heroImage: z.optional(image()),
			// campos espelhando o vault Dataview
			type: z.enum(['Essay', 'Note']).optional(),
			status: z.string().optional(),
			topics: z.array(z.string()).optional(),
		}),
});

export const collections = { blog };
