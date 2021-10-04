/*
  Warnings:

  - You are about to drop the column `fan_id` on the `songs` table. All the data in the column will be lost.
  - Added the required column `singer` to the `songs` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "songs.fan_id_unique";

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_songs" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "singer" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_songs" ("created_at", "id", "title", "updated_at") SELECT "created_at", "id", "title", "updated_at" FROM "songs";
DROP TABLE "songs";
ALTER TABLE "new_songs" RENAME TO "songs";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
