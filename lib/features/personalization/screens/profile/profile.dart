import 'package:agrocart/features/personalization/screens/settings/seetings.dart';
import 'package:agrocart/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Profile Picture with Hero Animation
              Hero(
                tag: 'profile-pic',
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/image/products/cattle/img_1.png'),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.camera, size: 20),
                label: const Text('Change Profile Picture'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),

              /// Profile Information Card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildProfileRow('Name', 'MD Raihanul Islam Rahat'),
                      _buildProfileRow('Username', 'rahat8123'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Personal Information Card
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildProfileRow('User ID', '8123', icon: Iconsax.copy),
                      _buildProfileRow('E-mail', 'rayhanulrahat8123@gmail.com'),
                      _buildProfileRow('Phone Number', '01650041778'),
                      _buildProfileRow('Gender', 'Male'),
                      _buildProfileRow('Date of Birth', '7 August 1999'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Close Account Button with Confirmation Dialog
              TextButton(
                onPressed: () => _showCloseAccountDialog(context),
                child: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileRow(String title, String value, {IconData? icon}) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(value, style: const TextStyle(color: Colors.black54)),
      trailing: icon != null ? Icon(icon, size: 18, color: Colors.grey) : null,
    );
  }

  void _showCloseAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Close Account'),
        content: const Text('Are you sure you want to close your account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {Get.to(()=> SettingsScreen());},
            child: const Text('Confirm', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
