/** @type {import('next').NextConfig} */
const nextConfig = {
    images: {
        // Disable Next.js' default behavior of optimizing images.
        // https://nextjs.org/docs/app/api-reference/components/image#unoptimized
        unoptimized: true,
    }
}

module.exports = nextConfig
