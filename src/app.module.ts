import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { UsersModule } from './users/users.module';
import { SurveysModule } from './surveys/surveys.module';
import { PrismaService } from './prisma.service';


@Module({
  imports: [ConfigModule.forRoot({
    envFilePath: [".env", ".env.development", ".env.development.local"]
  }), UsersModule, SurveysModule ],
  controllers: [AppController],
  providers: [AppService,PrismaService],

})
export class AppModule { }
