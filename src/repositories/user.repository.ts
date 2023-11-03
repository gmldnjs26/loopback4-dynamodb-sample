import {DefaultCrudRepository} from '@loopback/repository';
import {User} from '../models';
import {DynamodbDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UserRepository extends DefaultCrudRepository<
  User,
  typeof User.prototype.id
> {
  constructor(@inject('datasources.dynamodb') dataSource: DynamodbDataSource) {
    super(User, dataSource);
  }
}
