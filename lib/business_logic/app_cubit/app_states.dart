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


//Forget Password States

class ForgetPasswordLoadingState extends AppStates {}
class ForgetPasswordSuccessState extends AppStates {}
class ForgetPasswordErrorState extends AppStates {}

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

class GetAllProductsFromApiLoadingState extends AppStates{}
class GetAllProductsFromApiSuccessState extends AppStates{}
class GetAllProductsFromApiErrorState extends AppStates{}

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

//Increase Counter
class IncreaseCounterSuccessState extends AppStates{}

//Get Products NewSell
class GetNewSellProductsFromApiLoadingState extends AppStates{}
class GetNewSellProductsFromApiSuccessState extends AppStates{}
class GetNewSellProductsFromApiErrorState extends AppStates{}

//Get Products BestSell
class GetBestSellProductsFromApiLoadingState extends AppStates{}
class GetBestSellProductsFromApiSuccessState extends AppStates{}
class GetBestSellProductsFromApiErrorState extends AppStates{}

class GetTokenFromApiLoadingState extends AppStates{}
class GetTokenFromApiSuccessState extends AppStates{}
class GetTokenFromApiErrorState extends AppStates{}

class GetSearchLoadingState extends AppStates{}
class GetSearchSuccessState extends AppStates{}
class GetSearchErrorState extends AppStates{}

class EditProductsLoadingState extends AppStates{}
class EditProductsSuccessState extends AppStates{}
class EditProductsErrorState extends AppStates{}

class UpdateNoteDatabaseState extends AppStates{}


class IncreaseProductByOneState extends AppStates{}
class DecreaseProductByOneState extends AppStates{}