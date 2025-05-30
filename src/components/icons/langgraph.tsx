import Image from "next/image";

export function RevupAILogoSVG({
  className,
  width,
  height,
}: {
  width?: number;
  height?: number;
  className?: string;
}) {
  return (
    <Image
      src="/revupai.png"
      alt="RevupAI Logo"
      width={width || 98}
      height={height || 51}
      className={className}
      priority
    />
  );
}
