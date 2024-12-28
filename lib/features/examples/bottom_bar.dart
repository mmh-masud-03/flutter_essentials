import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _fabAnimationController;
  late final Animation<double> _fabRotateAnimation;

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: 'Home',
      widget: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.search_outlined,
      selectedIcon: Icons.search_rounded,
      label: 'Search',
      widget: const Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.qr_code_scanner_outlined,
      selectedIcon: Icons.qr_code_scanner_rounded,
      label: 'Scan',
      widget: const Center(
        child: Text(
          'QR Scanner',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.notifications_outlined,
      selectedIcon: Icons.notifications_rounded,
      label: 'Alerts',
      widget: const Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    NavigationItem(
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
      label: 'Profile',
      widget: const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fabRotateAnimation = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      if (_selectedIndex != 2) {
        _fabAnimationController.forward();
      }
    } else {
      _fabAnimationController.reverse();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _navigationItems[_selectedIndex].label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _navigationItems[_selectedIndex].widget,
      ),
      floatingActionButton: RotationTransition(
        turns: _fabRotateAnimation,
        child: FloatingActionButton(
          onPressed: () => _onItemTapped(2),
          elevation: 4,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            _selectedIndex == 2
                ? _navigationItems[2].selectedIcon
                : _navigationItems[2].icon,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          height: 65,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navigationItems.length, (index) {
              if (index == 2) {
                return const SizedBox(width: 48);
              }
              return _buildNavItem(index);
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = _navigationItems[index];
    final isSelected = _selectedIndex == index;

    return InkWell(
      onTap: () => _onItemTapped(index),
      customBorder: const CircleBorder(),
      child: SizedBox(
        height: 65,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? item.selectedIcon : item.icon,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final Widget widget;

  const NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.widget,
  });
}