import { Test, TestingModule } from '@nestjs/testing';
import { SurveysService } from './surveys.service';
import { PrismaClient } from '@prisma/client';

describe('SurveysService', () => {
  let service: SurveysService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SurveysService,PrismaClient],
    }).compile();

    service = module.get<SurveysService>(SurveysService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
