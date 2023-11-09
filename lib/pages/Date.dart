import 'package:flutter/material.dart';

class suhu extends StatelessWidget {
  const suhu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            //app bar
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Convert",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " Suhu",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TemperatureConverter()
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final List<String> temperatureUnits = [
    'Celsius',
    'Reamur',
    'Fahrenheit',
    'Kelvin'
  ];
  String fromUnit = 'Celsius';
  String toUnit = 'Celsius';
  double inputValue = 0;
  double result = 0;

  void convertTemperature() {
    double tempValue = inputValue;

    // Konversi dari satuan awal ke Celcius
    if (fromUnit == 'Reamur') {
      tempValue = (5 / 4) * inputValue;
    } else if (fromUnit == 'Fahrenheit') {
      tempValue = (5 / 9) * (inputValue - 32);
    } else if (fromUnit == 'Kelvin') {
      tempValue = inputValue - 273.15;
    }

    // Konversi dari Celcius ke satuan tujuan
    if (toUnit == 'Reamur') {
      result = (4 / 5) * tempValue;
    } else if (toUnit == 'Fahrenheit') {
      result = (9 / 5) * tempValue + 32;
    } else if (toUnit == 'Kelvin') {
      result = tempValue + 273.15;
    } else {
      result = tempValue;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Masukkan Nilai Suhu'),
            onChanged: (value) {
              inputValue = double.tryParse(value) ?? 0;
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton<String>(
                value: fromUnit,
                items: temperatureUnits.map((unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    fromUnit = value!;
                  });
                },
              ),
              Icon(Icons.arrow_forward),
              DropdownButton<String>(
                value: toUnit,
                items: temperatureUnits.map((unit) {
                  return DropdownMenuItem<String>(
                    value: unit,
                    child: Text(unit),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    toUnit = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              convertTemperature();
            },
            child: Text('Konversi'),
          ),
          SizedBox(height: 20),
          Text('Hasil: ${result.toStringAsFixed(2)} $toUnit'),
        ],
      ),
    );
  }
}
