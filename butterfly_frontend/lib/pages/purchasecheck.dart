import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PickupScreen(),
    );
  }
}

class PickupScreen extends StatefulWidget {
  @override
  _PickupScreenState createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  String _pickupMethod = '직거래';
  String _pickupLocation = '해솔관';
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('픽업 방법'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('픽업방법'),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('직거래'),
                    value: '직거래',
                    groupValue: _pickupMethod,
                    onChanged: (value) {
                      setState(() {
                        _pickupMethod = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('배달'),
                    value: '배달',
                    groupValue: _pickupMethod,
                    onChanged: (value) {
                      setState(() {
                        _pickupMethod = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('픽업장소'),
            RadioListTile<String>(
              title: Text('w3'),
              value: 'w3',
              groupValue: _pickupLocation,
              onChanged: (value) {
                setState(() {
                  _pickupLocation = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('w4'),
              value: 'w4',
              groupValue: _pickupLocation,
              onChanged: (value) {
                setState(() {
                  _pickupLocation = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('예술관'),
              value: '예술관',
              groupValue: _pickupLocation,
              onChanged: (value) {
                setState(() {
                  _pickupLocation = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('청송관'),
              value: '청송관',
              groupValue: _pickupLocation,
              onChanged: (value) {
                setState(() {
                  _pickupLocation = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('해솔관'),
              value: '해솔관',
              groupValue: _pickupLocation,
              onChanged: (value) {
                setState(() {
                  _pickupLocation = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: '픽업 시간을 작성해주세요. 예) 13시',
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle purchase request
                },
                child: Text('구매신청'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
