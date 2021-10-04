/* eslint-disable no-console */
const { PrismaClient } = require('@prisma/client')
const dotenv = require('dotenv')

import songData from './songs'
import userData from './users'

dotenv.config()
const db = new PrismaClient()

/*
 * Seed data is database data that needs to exist for your app to run.
 *
 * @see https://www.prisma.io/docs/reference/api-reference/command-reference#migrate-reset
 * @see https://www.prisma.io/docs/guides/prisma-guides/seed-database
 * @see https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#upsert
 * @see https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#createmany
 */
async function main() {
  console.warn('Please define your seed data.')

  // // Change to match your data model and seeding needs

  // // Note: if using PostgreSQL, using `createMany` to insert multiple records is much faster
  // // @see: https://www.prisma.io/docs/reference/api-reference/prisma-client-reference#createmany
  return Promise.all([
    userData.map(async (user) => {
      const record = await db.user.create({
        data: {
          id: user.id,
          firstName: user.firstName,
          lastName: user.lastName,
          email: user.email,
          username: user.username,
          image: user.image,
          password: user.password,
          createdAt: user.createdAt,
          updatedAt: user.updatedAt,
        },
      })
      console.log('user record', record)
    }),
    songData.map(async (song) => {
      const record = await db.song.create({
        data: {
          id: song.id,
          title: song.title,
          singer: song.singer,
          createdAt: song.createdAt,
          updatedAt: song.updatedAt,
        },
      })
      console.log('song record', record)
    }),
  ])
}

main()
  .catch((e) => console.error(e))
  .finally(async () => {
    await db.$disconnect()
  })
