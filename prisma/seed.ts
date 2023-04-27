import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
var optionArrayString = ["Strongly Agree", "Agree",
    "Neutral", "Disagree", "Strongly Disagree",
    "Very Satisfied", "Satisfied", "Dissatisfied", "Very Dissatisfied",
    "Very Likely", "Likely", "Unlikely", "Very Unlikely",
];
var optionBigOption = [
    ["Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"],
    ["Very Satisfied", "Satisfied", "Neutral", "Dissatisfied", "Very Dissatisfied"],
    ["Very Likely", "Likely", "Neutral", "Unlikely", "Very Unlikely",]
];
var groupOption = ["Agree", "Satisfy", "Like"]
let menu = [["The menu was easy to read", "My order was taken promptly",
    "My order was taken correctly", "My order was prepared & served promptly",
    "My order was prepared & served correcty", "The food tasted good", "The food was reasonably priced",
    "Employees were polite", "The restaurant was clean", "Napkin and sauces were freely available",
    "There was sufficient seating available"], ["Overall, how satisfied were you with your visit?"],
["How likely are you to dine with us again?"]]
async function createOption() {
    optionArrayString.map(async (value, index) => {
        const option = await prisma.option.create({
            data:{
                name_en:value
            }
        })
    });
}

async function createBigOption() {
    groupOption.map(async (value: string, index: number) => {
        // console.log(optionBigOption[index].length);
        let data = await Promise.all(optionBigOption[index].map(async val => {
            return { option_id: (await prisma.option.findFirst({ where: { name_en: val } })).id }
        }));
        const bigOption = await prisma.groupOption.upsert({
            create: {
                name: value,
                options: {
                    create: data
                }
            },
            where: {
                id: index + 1
            },
            update: {
                name: value,
            }
        });
        console.log(data.length);

    });
}
async function createBigOptionWithOption() {

}
async function main() {
    // await createOption();
    // await createBigOption();

    await menu.map(async (value, index) => {
        console.log(value.length);
        await value.map(async (val, i) => {
            let menuQuestion = await prisma.menuQuestion.create({
                data: {
                    name_en: val,
                    group_option_id: index + 1,
                }
            })
        })
    })

}
main().then(async () => {
    await prisma.$disconnect();
}).catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
})