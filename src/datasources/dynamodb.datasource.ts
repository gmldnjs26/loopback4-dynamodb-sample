import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';

const config = {
  name: 'dynamodb',
  connector: 'loopback-connector-dynamodb',
  accessKeyId: 'fakeaccesskey',
  secretAccessKey: 'fakesecretaccesskey',
  host: 'dynamodb',
  port: 8000,
  region: 'ap-northeast-1',
};

@lifeCycleObserver('datasource')
export class DynamodbDataSource
  extends juggler.DataSource
  implements LifeCycleObserver
{
  static dataSourceName = 'dynamodb';
  static readonly defaultConfig = config;

  constructor(
    @inject('datasources.config.dynamodb', {optional: true})
    dsConfig: object = config,
  ) {
    super(dsConfig);
  }
}
