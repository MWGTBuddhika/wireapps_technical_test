# WIREAPPS Technical test

WIREAPPS Technical test

## Special notes 

- Used state management procedure - BLoC

### Authentication, SignIn,SignUp

- For the authentication, the user should be navigated to the dashboard page
  until user login off from the application. For keep that single entry state as the offline
  that i used Hydrated BLoC as the offline state because of simple and reliable
  offline state management coming from flutter BLoC. We can use it here because of using state is a
  single entry record other than that if record is larger then we need to proper offline database tool
  like SQLite,Hive, etc. For the simplicity i used Hydrated BLoC here.