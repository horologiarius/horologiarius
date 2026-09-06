import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const blog = defineCollection({
	loader: glob({ base: './src/content/blog', pattern: '**/*.{md,mdx}' }),
	schema: ({ image }) =>
		z.object({
			title: z.string().default('Untitled'),
			description: z.string().default(''),
			pubDate: z.coerce.date().default(new Date()),
			updatedDate: z.coerce.date().optional(),
			heroImage: z.optional(image()),
			type: z.string().optional(),
			status: z.string().optional(),
			topics: z.array(z.string()).optional(),
		}),
});

export const collections = { blog };
