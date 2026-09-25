import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Defining the colors that will be used
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF315E2E),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F5),

          // Style for textfield
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedSex = 'Male';
  bool machineLearning = true;
  bool fullStack = true;
  bool mobileApp = false;

  // Tuition slide button corresponds to amount
  double tuition = 500;

  bool showSuccessMessage = false;

  // Action button for submit

  void submitForm() {
    setState(() {
      showSuccessMessage = true;
    });
  }

  // Action Button for clearing
  void clearForm() {
    setState(() {
      usernameController.clear();
      passwordController.clear();
      selectedSex = 'Male';
      machineLearning = false;
      fullStack = false;
      mobileApp = false;
      tuition = 500;
      showSuccessMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: 340,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Welcome Back!!!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Username', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    TextField(controller: usernameController),
                    const Text(
                      'Username must be 10 char long',
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    ),
                    const SizedBox(height: 14),

                    const Text('Password', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    TextField(controller: passwordController, obscureText: true),
                    const Text(
                      'password must be 8 char long',
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    ),
                    const SizedBox(height: 14),

                    const Text('Sex', style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: selectedSex,
                          onChanged: (value) => setState(() => selectedSex = value!),
                        ),
                        const Text('Male'),
                        const SizedBox(width: 12),
                        Radio<String>(
                          value: 'Female',
                          groupValue: selectedSex,
                          onChanged: (value) => setState(() => selectedSex = value!),
                        ),
                        const Text('Female'),
                      ],
                    ),

                    const Text('Courses', style: TextStyle(fontWeight: FontWeight.bold)),
                    CheckboxListTile(
                      title: const Text('Machine Learning'),
                      value: machineLearning,
                      onChanged: (value) => setState(() => machineLearning = value!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      title: const Text('Full stack'),
                      value: fullStack,
                      onChanged: (value) => setState(() => fullStack = value!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    CheckboxListTile(
                      title: const Text('Mobile application'),
                      value: mobileApp,
                      onChanged: (value) => setState(() => mobileApp = value!),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 8),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Tuition', style: TextStyle(fontWeight: FontWeight.bold)),

                        Text(
                          '\$${tuition.round()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(

                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: theme.colorScheme.primary,
                        thumbColor: theme.colorScheme.primary,
                        overlayColor: theme.colorScheme.primary.withOpacity(0.2),
                        valueIndicatorColor: theme.colorScheme.primary,
                        valueIndicatorTextStyle: const TextStyle(color: Colors.white),
                      ),
                      child: Slider(
                        value: tuition,
                        min: 0,
                        max: 2000,
                        divisions: 40,
                        label: '\$${tuition.round()}',
                        onChanged: (value) => setState(() => tuition = value),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Submit'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: clearForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade400,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Clear'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Success message
              if (showSuccessMessage)
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Congratulations login info submitted successfully.',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}