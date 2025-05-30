import Image from "next/image";

export function RevupAILogoSVG({
  className,
  width = 120,
  height = 60,
}: {
  width?: number;
  height?: number;
  className?: string;
}) {
  return (
    <Image
      src="/revupai.png"
      alt="RevupAI Logo"
      width={width}
      height={height}
      className={className}
      priority
    />
  );
}
