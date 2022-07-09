import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
  builder: (context, authState) {
    return AssignmentScaffold(
      showAppbar: true,
      resizeOnKeyboard: true,
      title: AssignmentText(
        text: LoginStrings.registration,
        fontSize: StyleSheet.largeFontSize,
      ),
      leading: AssignmentBackButton(
        onPressed: (){
          context.read<AuthBloc>().add(ClearTempData());
          assignmentRouter.pop();
        },
      ),
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(left: StyleSheet.blockSizeHorizontal*4,right: StyleSheet.blockSizeHorizontal*4),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: StyleSheet.blockSizeVertical * 3),
                  child: Image.asset(AssetImagePath.appIcon,
                      height: StyleSheet.blockSizeVertical * 17,
                      fit: BoxFit.cover),
                ),
                AssignmentTextBox(
                  hintText: LoginStrings.enterFirstName,
                  svgIcon: AssetIconPath.userIcon,
                  onChanged: (value){
                    context.read<AuthBloc>().add(FormFieldChanged(value,FieldType.firstName));
                  },
                ),
                SizedBox(height: StyleSheet.blockSizeVertical*2,),
                AssignmentTextBox(
                  hintText: LoginStrings.enterLastame,
                  svgIcon: AssetIconPath.userIcon,
                  onChanged: (value){
                    context.read<AuthBloc>().add(FormFieldChanged(value,FieldType.lastName));
                  },
                ),
                SizedBox(height: StyleSheet.blockSizeVertical*2,),
                AssignmentTextBox(
                  hintText: LoginStrings.enterEmail,
                  svgIcon: AssetIconPath.emailIcon,
                  onChanged: (value){
                    context.read<AuthBloc>().add(FormFieldChanged(value,FieldType.email));
                  },
                ),
                SizedBox(height: StyleSheet.blockSizeVertical*2,),
                AssignmentTextBox(
                  isPassword: true,
                  hintText: LoginStrings.enterPassword,
                  svgIcon: AssetIconPath.passwordIcon,
                  onChanged: (value){
                    context.read<AuthBloc>().add(FormFieldChanged(value,FieldType.password));
                  },
                ),
                SizedBox(height: StyleSheet.blockSizeVertical*2,),
                AssignmentButton(
                  label:LoginStrings.signUp,
                  onPressed: () {
                    context.read<AuthBloc>().add(SignUp());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
