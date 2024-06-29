import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _naviPointController = TextEditingController();
  String _paymentMethod = '나비 간편결제';
  String _generalPaymentMethod = '신용/체크카드';
  String _selectedCard = '카드를 선택해주세요.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결제수단'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('나비포인트'),
            TextField(
              controller: _naviPointController,
              decoration: InputDecoration(
                hintText: '0원',
                suffixIcon: TextButton(
                  onPressed: () {
                    // Handle use all points
                  },
                  child: Text('전액사용'),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text('결제수단'),
            RadioListTile<String>(
              title: Text('나비 간편결제'),
              value: '나비 간편결제',
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Row(
                children: [
                  Icon(Icons.payment, color: Colors.blue),
                  SizedBox(width: 8.0),
                  Text('toss pay'),
                ],
              ),
              value: 'toss pay',
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('일반결제'),
              value: '일반결제',
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                });
              },
            ),
            if (_paymentMethod == '일반결제') ...[
              Row(
                children: [
                  Expanded(
                    child: ChoiceChip(
                      label: Text('신용/체크카드'),
                      selected: _generalPaymentMethod == '신용/체크카드',
                      onSelected: (selected) {
                        setState(() {
                          _generalPaymentMethod = '신용/체크카드';
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ChoiceChip(
                      label: Text('카카오페이'),
                      selected: _generalPaymentMethod == '카카오페이',
                      onSelected: (selected) {
                        setState(() {
                          _generalPaymentMethod = '카카오페이';
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ChoiceChip(
                      label: Text('휴대폰'),
                      selected: _generalPaymentMethod == '휴대폰',
                      onSelected: (selected) {
                        setState(() {
                          _generalPaymentMethod = '휴대폰';
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: _selectedCard,
                items: [
                  DropdownMenuItem(
                    child: Text('카드를 선택해주세요.'),
                    value: '카드를 선택해주세요.',
                  ),
                  DropdownMenuItem(
                    child: Text('카드 1'),
                    value: '카드 1',
                  ),
                  DropdownMenuItem(
                    child: Text('카드 2'),
                    value: '카드 2',
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCard = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: '일시불',
                ),
              ),
            ],
            SizedBox(height: 16.0),
            Text('결제금액'),
            Text('총 상품 금액  30,000원'),
            Text('상품 할인  -300원'),
            Text('쿠폰/포인트 할인  0원'),
            Text('배송비  0원'),
            Divider(),
            Text('최종 결제 금액  29,700원', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment action
                },
                child: Text('29,700원 결제하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
