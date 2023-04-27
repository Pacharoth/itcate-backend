-- CreateTable
CREATE TABLE "GroupOption" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GroupOption_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GroupOptionWithOption" (
    "id" SERIAL NOT NULL,
    "option_id" INTEGER NOT NULL,
    "group_option_id" INTEGER NOT NULL,

    CONSTRAINT "GroupOptionWithOption_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Option" (
    "id" SERIAL NOT NULL,
    "name_kh" TEXT,
    "name_en" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MenuQuestion" (
    "id" SERIAL NOT NULL,
    "name_kh" TEXT,
    "name_en" TEXT,
    "group_option_id" INTEGER NOT NULL,

    CONSTRAINT "MenuQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Survayer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "dateVisit" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "usedToVisit" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Survayer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SurvayerOption" (
    "id" SERIAL NOT NULL,
    "menu_id" INTEGER NOT NULL,
    "survayer_id" INTEGER NOT NULL,
    "option_id" INTEGER NOT NULL,

    CONSTRAINT "SurvayerOption_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SurvayerOption_menu_id_survayer_id_option_id_key" ON "SurvayerOption"("menu_id", "survayer_id", "option_id");

-- AddForeignKey
ALTER TABLE "GroupOptionWithOption" ADD CONSTRAINT "GroupOptionWithOption_option_id_fkey" FOREIGN KEY ("option_id") REFERENCES "Option"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupOptionWithOption" ADD CONSTRAINT "GroupOptionWithOption_group_option_id_fkey" FOREIGN KEY ("group_option_id") REFERENCES "GroupOption"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuQuestion" ADD CONSTRAINT "MenuQuestion_group_option_id_fkey" FOREIGN KEY ("group_option_id") REFERENCES "GroupOption"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SurvayerOption" ADD CONSTRAINT "SurvayerOption_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "MenuQuestion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SurvayerOption" ADD CONSTRAINT "SurvayerOption_survayer_id_fkey" FOREIGN KEY ("survayer_id") REFERENCES "Survayer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SurvayerOption" ADD CONSTRAINT "SurvayerOption_option_id_fkey" FOREIGN KEY ("option_id") REFERENCES "Option"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
