String link({required Uri uri, String? message}) {
  const leading = '\x1B]8;;';
  const trailing = '\x1B\\';

  return '$leading$uri$trailing${message ?? uri}$leading$trailing';
}
