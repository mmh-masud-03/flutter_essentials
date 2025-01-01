import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  // Personal Information
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';
  DateTime? _dateOfBirth;
  String _gender = 'Male';

  // Address Information
  String _street = '';
  String _city = '';
  String _state = '';
  String _zipCode = '';
  String _country = 'United States';

  // Preferences
  List<String> _interests = [];
  String _occupation = '';
  String _education = 'Bachelor\'s';
  double _experienceYears = 0;
  bool _subscribe = false;
  bool _agree = false;

  int _currentStep = 0;
  bool _isLoading = false;

  final List<String> _countries = ['United States', 'Canada', 'United Kingdom', 'Australia'];
  final List<String> _educationLevels = ['High School', 'Associate\'s', 'Bachelor\'s', 'Master\'s', 'Doctorate'];
  final List<String> _interestsList = [
    'Technology', 'Sports', 'Music', 'Art', 'Travel',
    'Food', 'Fashion', 'Science', 'Literature', 'Gaming'
  ];

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(thickness: 1),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.blue),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateOfBirth = picked;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate() && _agree) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Form submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all required fields'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced Form'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _formKey.currentState?.reset();
              setState(() {
                _interests = [];
                _agree = false;
                _subscribe = false;
                _currentStep = 0;
              });
            },
          ),
        ],
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) _currentStep++;
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) _currentStep--;
          });
        },
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        steps: [
          Step(
            title: const Text('Personal Information'),
            content: _buildPersonalInfo(),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Address'),
            content: _buildAddress(),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Preferences'),
            content: _buildPreferences(),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Submit Form'),
        ),
      ),
    );
  }

  Widget _buildPersonalInfo() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'First Name *',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                  value?.isEmpty ?? true ? 'Required' : null,
                  onSaved: (value) => _firstName = value!,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Last Name *',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                  value?.isEmpty ?? true ? 'Required' : null,
                  onSaved: (value) => _lastName = value!,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email *',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Required';
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                return 'Enter a valid email';
              }
              return null;
            },
            onSaved: (value) => _email = value!,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Phone *',
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Required';
              if (value!.length < 10) return 'Enter valid phone number';
              return null;
            },
            onSaved: (value) => _phone = value!,
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _selectDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date of Birth *',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(
                _dateOfBirth == null
                    ? 'Select Date'
                    : '${_dateOfBirth!.day}/${_dateOfBirth!.month}/${_dateOfBirth!.year}',
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Gender *'),
          Row(
            children: ['Male', 'Female', 'Other'].map((String value) {
              return Expanded(
                child: RadioListTile<String>(
                  title: Text(value,style: TextStyle(fontSize: 10),),
                  value: value,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Street Address *',
            prefixIcon: Icon(Icons.home),
          ),
          validator: (value) =>
          value?.isEmpty ?? true ? 'Required' : null,
          onSaved: (value) => _street = value!,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'City *',
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (value) =>
                value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _city = value!,
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'State *',
                  prefixIcon: Icon(Icons.map),
                ),
                validator: (value) =>
                value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _state = value!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ZIP Code *',
                  prefixIcon: Icon(Icons.pin_drop),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                ],
                validator: (value) =>
                value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _zipCode = value!,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Country *',
                  prefixIcon: Icon(Icons.public),
                ),
                value: _country,
                items: _countries.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _country = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Occupation',
            prefixIcon: Icon(Icons.work),
          ),
          onSaved: (value) => _occupation = value ?? '',
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Education Level',
            prefixIcon: Icon(Icons.school),
          ),
          value: _education,
          items: _educationLevels.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _education = value!;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Experience (Years)'),
        Slider(
          value: _experienceYears,
          min: 0,
          max: 20,
          divisions: 20,
          label: _experienceYears.round().toString(),
          onChanged: (value) {
            setState(() {
              _experienceYears = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Interests'),
        Wrap(
          spacing: 8.0,
          children: _interestsList.map((String interest) {
            return FilterChip(
              label: Text(interest),
              selected: _interests.contains(interest),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    _interests.add(interest);
                  } else {
                    _interests.remove(interest);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text('Subscribe to newsletter'),
          value: _subscribe,
          onChanged: (bool value) {
            setState(() {
              _subscribe = value;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('I agree to the terms and conditions *'),
          value: _agree,
          onChanged: (value) {
            setState(() {
              _agree = value!;
            });
          },
          subtitle: !_agree
              ? const Text(
            'Required to submit the form',
            style: TextStyle(color: Colors.red, fontSize: 12),
          )
              : null,
        ),
      ],
    );
  }
}