import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc,AuthState>(
      builder: (context, authState) {
        return AssignmentScaffold(
          showAppbar: true,
          resizeOnKeyboard: true,
          title: AssignmentText(
            text: LoginStrings.signIn,
            fontSize: StyleSheet.largeFontSize,
          ),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*4),
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
                    RememberMeSwitch(),
                    SizedBox(height: StyleSheet.blockSizeVertical*2,),
                    AssignmentButton(
                      label:LoginStrings.signIn,
                      onPressed: () {
                        context.read<AuthBloc>().add(SignIn());
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
