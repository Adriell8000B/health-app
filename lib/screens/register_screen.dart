import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _phoneController = TextEditingController();
  final _noteController = TextEditingController();
  
  String? _selectedExam;
  DateTime? _selectedDate;

  final List<String> _examTypes = ["Blood Test", "X-Ray", "MRI", "Check-up"];

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Exam", 
          style: TextStyle(color: isDark ? Colors.white : Colors.black87)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appointment Details",
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87, 
                  fontSize: 22, 
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 24),

              // Phone Number Field
              _buildLabel("Phone Number", isDark),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                decoration: _inputDecoration("Enter phone", Icons.phone, isDark),
                validator: (v) => v!.isEmpty ? "Enter phone number" : null,
              ),

              const SizedBox(height: 20),

              // Exam Type Dropdown
              _buildLabel("Type of Exam", isDark),
              DropdownButtonFormField<String>(
                dropdownColor: isDark ? const Color(0xFF24262C) : Colors.white,
                initialValue: _selectedExam,
                items: _examTypes.map((e) => DropdownMenuItem(
                  value: e, 
                  child: Text(e, style: TextStyle(color: isDark ? Colors.white : Colors.black87))
                )).toList(),
                onChanged: (val) => setState(() => _selectedExam = val),
                decoration: _inputDecoration("Select exam", Icons.medical_information, isDark),
                validator: (v) => v == null ? "Select an exam type" : null,
              ),

              const SizedBox(height: 20),

              // Date Selection
              _buildLabel("Date", isDark),
              InkWell(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xF724262C) : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Color(0xFF1976D2)),
                      const SizedBox(width: 12),
                      Text(
                        _selectedDate == null 
                          ? "Pick a date" 
                          : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                        style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Notes Field
              _buildLabel("Notes (Optional)", isDark),
              TextFormField(
                controller: _noteController,
                maxLines: 3,
                style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                decoration: _inputDecoration("Add details...", Icons.edit_note, isDark),
              ),

              const SizedBox(height: 40),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1976D2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _selectedDate != null) {}
                  },
                  child: const Text("SCHEDULE NOW", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon, bool isDark) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: const Color(0xFF1976D2)),
      filled: true,
      fillColor: isDark ? const Color(0xF724262C) : Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), 
        borderSide: BorderSide.none
      ),
    );
  }

  Widget _buildLabel(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text, 
        style: TextStyle(
          color: isDark ? Colors.grey : Colors.black54, 
          fontWeight: FontWeight.w500
        )
      ),
    );
  }
}