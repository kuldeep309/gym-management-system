import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedMembership = 'No plan selected';
  String selectedClass = 'No class booked';
  String selectedTrainer = 'No trainer selected';

  Widget _buildSummaryCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: 2,
        shadowColor: Colors.black12,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF64748B),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Color(0xFF94A3B8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openMembership() async {
    final result = await Navigator.pushNamed(context, '/membership');
    if (result != null && result is String) {
      setState(() {
        selectedMembership = result;
      });
    }
  }

  Future<void> _openClassBooking() async {
    final result = await Navigator.pushNamed(context, '/class-booking');
    if (result != null && result is String) {
      setState(() {
        selectedClass = result;
      });
    }
  }

  Future<void> _openTrainerDetails() async {
    final result = await Navigator.pushNamed(context, '/trainer-details');
    if (result != null && result is String) {
      setState(() {
        selectedTrainer = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Gym Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF8FAFC),
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withOpacity(0.22),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Manage your membership, classes, and trainers from one place.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              const Text(
                'Your Activity',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 14),
              _buildSummaryCard(
                icon: Icons.card_membership_rounded,
                title: 'Selected Membership',
                value: selectedMembership,
                color: const Color(0xFF8B5CF6),
              ),
              _buildSummaryCard(
                icon: Icons.event_available_rounded,
                title: 'Booked Class',
                value: selectedClass,
                color: const Color(0xFF06B6D4),
              ),
              _buildSummaryCard(
                icon: Icons.fitness_center_rounded,
                title: 'Selected Trainer',
                value: selectedTrainer,
                color: const Color(0xFFF97316),
              ),
              const SizedBox(height: 20),
              const Text(
                'Features',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 14),
              _buildFeatureCard(
                icon: Icons.card_membership_rounded,
                title: 'Membership Plans',
                subtitle: 'Choose a gym membership package.',
                color: const Color(0xFF8B5CF6),
                onTap: _openMembership,
              ),
              _buildFeatureCard(
                icon: Icons.event_available_rounded,
                title: 'Class Booking',
                subtitle: 'Book your preferred fitness class.',
                color: const Color(0xFF06B6D4),
                onTap: _openClassBooking,
              ),
              _buildFeatureCard(
                icon: Icons.fitness_center_rounded,
                title: 'Trainer Details',
                subtitle: 'View trainer profile and expertise.',
                color: const Color(0xFFF97316),
                onTap: _openTrainerDetails,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Color(0xFFCBD5E1)),
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF334155),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}