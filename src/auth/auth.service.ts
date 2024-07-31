import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../user/entities/user.entity';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
    private jwtService: JwtService,
  ) {}

  async validateUser(nip: string, password: string): Promise<any> {
    const user = await this.usersRepository.query(
      `
  SELECT users.name, users.level, users.nip, 
         jobroles.name as jobrole_name, 
         jabatans.title as jabatan_title, 
         sections.name as section_name, 
         departments.name as department_name, 
         divisions.name as division_name
  FROM users
  LEFT JOIN jobroles ON users.jobrole_id = jobroles.id
  LEFT JOIN jabatans ON jobroles.jabatan_id = jabatans.id
  LEFT JOIN sections ON jobroles.section_id = sections.id
  LEFT JOIN departments ON sections.department_id = departments.id
  LEFT JOIN divisions ON departments.division_id = divisions.id
  WHERE users.nip = ? AND users.password = ?
  `,
      [nip, password],
    );

    if (user.length > 0) {
      const { password, ...result } = user[0];
      const payload = {
        nip: result.nip,
        jobrole_name: result.jobrole_name,
        level: result.level,
      };
      const token = this.jwtService.sign(payload);
      return {
        status: 200,
        message: 'logged in successfully',
        user: {
          ...result,
          token,
        },

        error: false,
      };
    }
    return null;
  }
}
