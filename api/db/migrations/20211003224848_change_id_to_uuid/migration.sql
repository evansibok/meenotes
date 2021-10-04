/*
  Warnings:

  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `notes` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `songs` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_users" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_users" ("created_at", "email", "first_name", "id", "image", "last_name", "password", "updated_at", "username") SELECT "created_at", "email", "first_name", "id", "image", "last_name", "password", "updated_at", "username" FROM "users";
DROP TABLE "users";
ALTER TABLE "new_users" RENAME TO "users";
CREATE UNIQUE INDEX "users.email_unique" ON "users"("email");
CREATE UNIQUE INDEX "users.username_unique" ON "users"("username");
CREATE TABLE "new_notes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "content" TEXT NOT NULL,
    "author_id" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    FOREIGN KEY ("author_id") REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_notes" ("author_id", "content", "created_at", "id", "updated_at") SELECT "author_id", "content", "created_at", "id", "updated_at" FROM "notes";
DROP TABLE "notes";
ALTER TABLE "new_notes" RENAME TO "notes";
CREATE UNIQUE INDEX "notes.author_id_unique" ON "notes"("author_id");
CREATE TABLE "new_songs" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "singer" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_songs" ("created_at", "id", "singer", "title", "updated_at") SELECT "created_at", "id", "singer", "title", "updated_at" FROM "songs";
DROP TABLE "songs";
ALTER TABLE "new_songs" RENAME TO "songs";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
