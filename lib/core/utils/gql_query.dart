
mixin GqlQuery {

  static String authenticate = '''
query Authenticate(\$value: String!) {
  authenticate(value: \$value) {
    message
  }
}
  ''';

  static String verify = '''
 query Verify(\$code: Int!, \$value: String!) {
  verify(code: \$code, value: \$value) {
  token
  }
  }
  ''';


}
