abstract class AppStates {}
class InitialState extends AppStates  {}
class LaunchState extends AppStates {}


// Bottom Navigation,
class SetCurrentIndexStates extends AppStates {}

// Sign Up States

class SignUpLoadingState extends AppStates {}

class SignUpSuccessState extends AppStates {}

class SignUpErrorState extends AppStates {
  SignUpErrorState(String error);
}

//Login States

class LoginLoadingState extends AppStates {}

class LoginSuccessState extends AppStates {}

class LoginErrorState extends AppStates {
  LoginErrorState(String error);
}

//Save user
class SaveUserLoadingState extends AppStates{}
class SaveUserSuccessState extends AppStates{}
class SaveUserErrorState extends AppStates{
  SaveUserErrorState(String error);
}

//Get User
class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates{}


// Local Database
class CreateTableState  extends AppStates{}
class CreateDatabaseSuccessState  extends AppStates{}
class CreateDatabaseErrorState  extends AppStates{}
class InsertDatabaseSuccessState  extends AppStates{}
class InsertDatabaseErrorState  extends AppStates{}
class GetDatabaseSuccessState  extends AppStates{}
class GetDatabaseErrorState  extends AppStates{}
class DeleteDatabaseSuccessState  extends AppStates{}

//Delete User

class DeleteUserLoadingState extends AppStates{}
class DeleteUserSuccessState extends AppStates{}
class DeleteUserErrorState extends AppStates{}


//Get Products From Api User

class GetProductsFromApiLoadingState extends AppStates{}
class GetProductsFromApiSuccessState extends AppStates{}
class GetProductsFromApiErrorState extends AppStates{}

//Add User Products To FireStore
class AddUserProductsLoadingState extends AppStates{}
class AddUserProductsSuccessState extends AppStates{}
class AddUserProductsErrorState extends AppStates{}


//Get User Products From FireStore
class GetUserProductsLoadingState extends AppStates{}
class GetUserProductsSuccessState extends AppStates{}
class GetUserProductsErrorState extends AppStates{}


class DeleteProductsLoadingState extends AppStates{}
class DeleteProductsSuccessState extends AppStates{}
class DeleteProductsErrorState extends AppStates{}