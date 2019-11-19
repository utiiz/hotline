class MyQuery {
  String getPersons() {
    return r''' 
      query {
        persons {
          edges {
            node {
              id
              phone
              user {
                username
                firstName
                lastName
              }
            }
          }
        }
      }
    ''';
  }
}
