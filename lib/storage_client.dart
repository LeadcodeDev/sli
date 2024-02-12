import 'package:aws_s3_api/s3-2006-03-01.dart';

abstract interface class ClientStorageContract {
  S3 get provider;

  Future<ListBucketsOutput> getAllBuckets();
  Future<ListObjectsV2Output> getBucketObjects(String bucketName, {int? limit});
}

final class ClientStorage implements ClientStorageContract{
  @override
  late final S3 provider;

  @override
  Future<ListBucketsOutput> getAllBuckets() async {
    return provider.listBuckets();
  }

  @override
  Future<ListObjectsV2Output> getBucketObjects(String bucketName, {int? limit}) async {
    return provider.listObjectsV2(bucket: bucketName, maxKeys: limit);
  }
}
