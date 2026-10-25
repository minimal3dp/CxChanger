# Printing the CNC-designed parts

Decision (2026-10-01): print instead of CNC. The CNC quote was over $300.
Measurements are from the files in this folder (m3dp_cnc_6_p1–p8), read 2026-10-01.

| File | Part | Size (mm) | Print notes |
|---|---|---|---|
| p1 | Top magnet plate | 3.5 × 28.3 × 34.8 | Thin. 5 × Ø6 magnet pockets, 1.5 mm pin holes. Print flat, 100% infill or 6+ walls. |
| p2 | Spring support plate | 6.1 × 8.5 × 16 | Tiny; fine in ASA. |
| p3 | Cover, left | 6.5 × 18 × 23.2 | Low load. |
| p4 | Cover, right | 3.0 × 18 × 23.2 | Low load. |
| p5 | Back plate (Trident) | 7.5 × 49.9 × 63 | Carries the whole head on the MGN12H. Highest priority for stiff material (ASA min, PC-CF/PA-CF better). |
| p6 + p7 | Swing lever outer/inner (CNC) | 5.0 / 3.8 × 13.5 × ~41 | **Don't print these.** Too thin for plastic at a bearing pivot. |
| p8 | Swing arm, one-piece printed version | 12.9 × 19.5 × 41.9 | **Use this instead of p6 + p7.** Upstream designed it for printing. |
| dock 6.11 | Hotend dock (CNC) | 21.2 × 76.3 × 130 | ×6. Upstream's 5.5 BOM lists docks as printed parts. Docked hotends stay hot, so ASA/ABS only, and keep the dock fans. |

## Changes needed for plastic

1. **Tapped M3 holes (Ø2.5 in the CNC files, ~5 total, mostly p5):** either let M3 screws self-thread
   (fine for parts you assemble once) or open the hole to Ø4.0–4.2 for the M3 heat-set inserts already on the BOM.
2. **Bearing seats and Ø1.5 / Ø3 pin holes:** do a test print of one hole first and tune hole compensation;
   pins should press in, bearings should press in without cracking the part.
3. **Material:** ASA or ABS minimum. PLA and PETG will creep in a 50–60 °C chamber and next to parked hot hotends.
4. **Settings to start from:** 4–6 walls, 40%+ infill, 0.2 mm layers; orient so screw and pin loads are not across layer lines.
