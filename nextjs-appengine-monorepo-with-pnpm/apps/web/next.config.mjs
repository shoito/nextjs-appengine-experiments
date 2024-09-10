/** @type {import('next').NextConfig} */
const nextConfig = {
    output: 'standalone',
    images: {
        // Disable Next.js' default behavior of optimizing images.
        // https://nextjs.org/docs/app/api-reference/components/image#unoptimized
        unoptimized: true,
    }
};

export default nextConfig;
