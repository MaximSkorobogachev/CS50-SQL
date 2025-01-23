CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
 );

 CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY("id")
 );

 CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departing" TEXT NOT NULL,
    "heading" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arriving_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
