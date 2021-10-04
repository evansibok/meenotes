/*
  Warnings:

  - You are about to drop the column `created_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `first_name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `last_name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `author_id` on the `notes` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `notes` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `notes` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `songs` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `songs` table. All the data in the column will be lost.
  - Added the required column `firstName` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastName` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `authorId` to the `notes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `notes` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `songs` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "notes.author_id_unique";

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_users" ("email", "id", "image", "password", "username") SELECT "email", "id", "image", "password", "username" FROM "users";
DROP TABLE "users";
ALTER TABLE "new_users" RENAME TO "users";
CREATE UNIQUE INDEX "users.email_unique" ON "users"("email");
CREATE UNIQUE INDEX "users.username_unique" ON "users"("username");
CREATE TABLE "new_notes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "content" TEXT NOT NULL,
    "authorId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    FOREIGN KEY ("authorId") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_notes" ("content", "id") SELECT "content", "id" FROM "notes";
DROP TABLE "notes";
ALTER TABLE "new_notes" RENAME TO "notes";
CREATE UNIQUE INDEX "notes.authorId_unique" ON "notes"("authorId");
CREATE TABLE "new_songs" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "singer" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_songs" ("id", "singer", "title") SELECT "id", "singer", "title" FROM "songs";
DROP TABLE "songs";
ALTER TABLE "new_songs" RENAME TO "songs";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
