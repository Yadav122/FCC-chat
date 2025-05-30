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
    <svg
      width={width}
      height={height}
      viewBox="0 0 98 51"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      {/* Left arrow/triangle - dark purple */}
      <path
        d="M15 8 L45 25.5 L15 43 Q8 43 8 36 L8 15 Q8 8 15 8 Z"
        fill="#1a1a2e"
      />
      {/* Top right arrow/triangle - bright purple */}
      <path
        d="M53 8 L83 25.5 L53 43 Q46 43 46 36 L46 15 Q46 8 53 8 Z"
        fill="#8b5cf6"
      />
      {/* Bottom arrow/triangle - dark purple */}
      <path
        d="M30 28 L60 45.5 L30 63 Q23 63 23 56 L23 35 Q23 28 30 28 Z"
        fill="#1a1a2e"
        transform="scale(0.7) translate(15, -15)"
      />
    </svg>
  );
}
