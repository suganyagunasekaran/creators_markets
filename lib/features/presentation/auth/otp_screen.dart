import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String mobile;

  const OtpScreen({
    super.key,
    required this.mobile,
  });

  @override
  State<OtpScreen> createState() =>
      _OtpScreenState();
}

class _OtpScreenState
    extends State<OtpScreen> {
  final otpController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xffF5F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
        Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// OTP Icon
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue
                      .withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  size: 50,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Enter the 4-digit OTP sent to",
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 5),

              Text(
                widget.mobile,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight:
                  FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              Card(
                elevation: 5,
                shape:
                RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                      16),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.all(
                      20),
                  child: Column(
                    children: [
                      TextField(
                        controller:
                        otpController,
                        maxLength: 4,
                        keyboardType:
                        TextInputType
                            .number,
                        textAlign:
                        TextAlign.center,
                        style:
                        const TextStyle(
                          fontSize: 24,
                          letterSpacing:
                          10,
                          fontWeight:
                          FontWeight.bold,
                        ),
                        decoration:
                        InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor:
                          Colors.grey
                              .shade100,
                          border:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                                12),
                          ),
                          hintText:
                          "• • • •",
                        ),
                      ),

                      const SizedBox(
                          height: 10),

                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Resend OTP",
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style:
                  ElevatedButton
                      .styleFrom(
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius
                          .circular(
                          12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Verify OTP",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Didn't receive the code?",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}