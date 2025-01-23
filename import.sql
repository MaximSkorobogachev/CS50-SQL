CREATE TABLE "meteorites" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

.import --csv --skip 1 meteorites.csv meteorites

UPDATE "meteorites"
SET "mass" = ROUND("mass", 2);
UPDATE "meteorites"
SET "lat" = ROUND("lat", 2);
UPDATE "meteorites"
SET "long" = ROUND("long", 2);

DELETE FROM "meteorites"
WHERE "nametype" = 'Relict';

CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

INSERT INTO "meteorites_temp" ("name", "nametype", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "nametype", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites"
ORDER BY "year", "name";

UPDATE "meteorites_temp"
SET "mass" = NULL
WHERE "mass" = 0;
UPDATE "meteorites_temp"
SET "lat" = NULL
WHERE "lat" = 0;
UPDATE "meteorites_temp"
SET "long" = NULL
WHERE "long" = 0;
UPDATE "meteorites_temp"
SET "year" = NULL
WHERE "year" = 0;

DELETE FROM "meteorites";

INSERT INTO "meteorites" ("name", "nametype", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "nametype", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp";

DROP TABLE "meteorites_temp";

ALTER TABLE "meteorites"
DROP COLUMN "nametype";

UPDATE "meteorites"
SET "year" = NULL
WHERE "year" = '';

CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" NUMERIC,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY("id")
);

INSERT INTO "meteorites_temp" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites"
ORDER BY "year", "name";

DELETE FROM "meteorites";

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp";

DROP TABLE "meteorites_temp";
