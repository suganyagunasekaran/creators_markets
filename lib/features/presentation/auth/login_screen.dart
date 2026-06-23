import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff6A11CB),
              Color(0xff2575FC),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Card(
                elevation: 12,
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(24),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      const FlutterLogo(
                        size: 90,
                      ),

                      const SizedBox(
                          height: 20),

                      const Text(
                        "Creator Marketplace",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 8),

                      Text(
                        "Connect creators and brands effortlessly",
                        textAlign:
                        TextAlign.center,
                        style: TextStyle(
                          color:
                          Colors.grey[600],
                        ),
                      ),

                      const SizedBox(
                          height: 30),

                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: "Mobile Number",
                          hintText: "Enter mobile number",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 20),

                      SizedBox(
                        width:
                        double.infinity,
                        height: 55,
                        child:
                        ElevatedButton(
                          style:
                          ElevatedButton
                              .styleFrom(
                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  15),
                            ),
                          ),
                          onPressed: () {
                            if (phoneController.text.length != 10) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Please enter a valid 10-digit mobile number',
                                  ),
                                ),
                              );
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OtpScreen(
                                  mobile: phoneController.text,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Send OTP",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight
                                  .bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}