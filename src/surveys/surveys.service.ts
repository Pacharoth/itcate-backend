import { Injectable } from '@nestjs/common';
import { CreateSurveyDto } from './dto/create-survey.dto';
import { UpdateSurveyDto } from './dto/update-survey.dto';
import { PrismaClient } from '@prisma/client';
@Injectable()
export class SurveysService {
  constructor(private prisma: PrismaClient) { }
  create(createSurveyDto: CreateSurveyDto) {
    return 'This action adds a new survey';
  }
  async getFields() {

    let bigOption = await this.prisma.groupOption.findMany({
      orderBy:{
        id:"asc",
      },
      include:{
        menuOption:true,
        options:{
          include:{
            option:true
          }
        }
      }
    });
    let newSerialize =bigOption.map(value=>{
      let options=value.options.map(value=>value.option);
      return {
        ...value,
        options,
      }
    })
    return newSerialize;
  } 
  findAll() {
    return `This action returns all surveys`;
  }

  findOne(id: number) {
    return `This action returns a #${id} survey`;
  }

  update(id: number, updateSurveyDto: UpdateSurveyDto) {
    return `This action updates a #${id} survey`;
  }

  remove(id: number) {
    return `This action removes a #${id} survey`;
  }
}
