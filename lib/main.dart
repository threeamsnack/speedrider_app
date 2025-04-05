import 'package:flutter/material.dart';

void main() {
  runApp(const BikeCompanyApp());
}

class BikeCompanyApp extends StatelessWidget {
  const BikeCompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeedRider Bikes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BikeCompanyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BikeCompanyHomePage extends StatefulWidget {
  const BikeCompanyHomePage({super.key});

  @override
  State<BikeCompanyHomePage> createState() => _BikeCompanyHomePageState();
}

class _BikeCompanyHomePageState extends State<BikeCompanyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpeedRider Bikes'),
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.directions_bike, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'SpeedRider',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Premium Bikes Since 1995',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: _currentIndex == 0,
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us'),
            selected: _currentIndex == 1,
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_bike),
            title: const Text('Our Bikes'),
            selected: _currentIndex == 2,
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact Us'),
            selected: _currentIndex == 3,
            onTap: () {
              setState(() {
                _currentIndex = 3;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomePage();
      case 1:
        return _buildAboutPage();
      case 2:
        return _buildBikesPage();
      case 3:
        return _buildContactPage();
      default:
        return _buildHomePage();
    }
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'),
                fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: const Text(
                  'Ride The Future',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Welcome to SpeedRider - Where Performance Meets Passion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'At SpeedRider, we are dedicated to crafting high-performance bicycles that cater to the needs of every cyclist. '
              'Whether you are a competitive racer or a casual rider, we have the perfect bike for you.',
              style: TextStyle(fontSize: 16, height: 1.5,),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About SpeedRider',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Founded in 1995, SpeedRider has been at the forefront of bicycle innovation for over 25 years. '
            'Our mission is to create high-performance bikes that deliver an exceptional riding experience.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'Our Philosophy',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'We believe in quality over quantity. Every SpeedRider bike is crafted with precision and attention to detail, '
            'using only the finest materials and components.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),
          const Text(
            'Our Team',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Our team consists of passionate cyclists and engineers who live and breathe bicycles. '
            'From design to production, every step is handled with care and expertise.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: const Text('View Our Bikes'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBikesPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Bike Collection',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _buildBikeCard(
                'Thunder X1',
                '\₹12,000',
                'https://images.unsplash.com/photo-1511994298241-608e28f14fde?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                'Our entry-level road bike with premium components',
              ),
              _buildBikeCard(
                'Aero Pro',
                '\₹16,000',
                'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                'Lightweight carbon frame for competitive racing',
              ),
              _buildBikeCard(
                'Mountain King',
                '\₹19,000',
                'https://images.unsplash.com/photo-1576435728678-68d0fbf94e91?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                'Full-suspension mountain bike for all terrains',
              ),
              _buildBikeCard(
                'Urban Cruiser',
                '\₹25,000',
                'https://images.unsplash.com/photo-1507035895480-2b3156c31fc8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                'Comfortable city bike with premium features',
              ),
              _buildBikeCard(
                'Junior Explorer',
                '\₹15,000',
                'https://images.unsplash.com/photo-1593764592116-bfb2a97c642a?q=80&w=2505&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'Perfect first bike for young adventurers',
              ),
              _buildBikeCard(
                'Touring Elite',
                '\$₹17,000',
                'https://images.unsplash.com/photo-1505705694340-019e1e335916?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'Built for long-distance comfort and reliability',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBikeCard(String name, String price, String imageUrl, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('View Details'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactPage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.contact_mail, size: 60, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text(
              'SpeedRider Bikes Inc.',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'SSCBS Campus, KN Katju Marg, New Delhi, 110085',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'India',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Phone: +91 7983001663',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Email: pradhyumshivhare6@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            const Text(
              'Business Hours:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Monday - Friday: 9am - 6pm',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Saturday: 10am - 4pm',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Sunday: Closed',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Send Us a Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}