class MyQuery {
  String getPersons() {
    return ''' 
      {
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
