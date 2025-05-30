import Image from "next/image";

export function RevupAILogoSVG({
  className,
  width = 120,
  height = 100,
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
      className={className ? className.replace(/h-\d+/, '') : ''}
      priority
      style={{ height: `${height}px`, width: `${width}px` }}
    />
  );
}
