import { Controller, Request, Post, Body } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('login')
  async login(@Body('nip') nip: string, @Body('password') password: string) {
    return this.authService.validateUser(nip, password);
  }
}
