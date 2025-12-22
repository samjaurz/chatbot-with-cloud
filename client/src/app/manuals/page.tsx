"use client";

import ManualDisplay from "@/components/manualsTable/ManualDisplay";
import PDFDisplay from "@/components/manualsTable/PDFDisplay";

export default function Manuals() {
 
  return (
    <div className="min-h-screen bg-gray-50 flex flex-col">
      <div className="flex-1 flex flex-col p-4">
        <div className="flex flex-row gap-6 h-[calc(100vh-130px)] w-full">
          <div className="flex-1 flex flex-col">
            <ManualDisplay  />
            <PDFDisplay />
          </div>
        </div>
      </div>
    </div>
  );
}