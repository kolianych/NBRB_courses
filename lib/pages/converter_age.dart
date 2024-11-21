import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nbrb_curs/config/constants.dart';
import 'package:nbrb_curs/controller/currency_controller.dart';
import 'package:nbrb_curs/blocs/localizatio_bloc/localizatio_cubit.dart';
import 'package:nbrb_curs/generated/l10n.dart';
import 'package:nbrb_curs/servise/current_courses_pesponse/models/current_courses.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  CurrencyConverterPageState createState() => CurrencyConverterPageState();
}

class CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final CurrencyController _currency = CurrencyController();
  final controller = TextEditingController();
  String fromCurrency = 'USD';
  String toCurrency = 'EUR';
  double amount = 1.0;
  String? quotName;

  @override
  Widget build(BuildContext context) {
    final localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    final currentLocale = localizationBloc.state.languageCode == 'en';
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).converter_text),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              localizationBloc.switchLocale((currentLocale) ? 'ru' : 'en');
              controller.clear();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(allPadingConvertAge),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = double.tryParse(value) ?? 1.0;
                  _currency.convert(amount, fromCurrency, toCurrency);
                },
                onTapOutside: (event) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(labelText: S.of(context).sum),
              ),
              StreamBuilder<List<CurrentCourses>>(
                stream: _currency.currenciesStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (!snapshot.hasData) {
                    return Text(S.of(context).errorLoadingCurrencies);
                  }
                  final currencies = snapshot.data!;
                  final selectedCurrency = currencies
                      .firstWhere((cur) => cur.Cur_Abbreviation == toCurrency);
                  quotName = (currentLocale)
                      ? selectedCurrency.Cur_QuotName_Eng
                      : selectedCurrency.Cur_QuotName;
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          value: fromCurrency,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              fromCurrency = newValue!;
                              if (amount > 0) {
                                _currency.convert(
                                    amount, fromCurrency, toCurrency);
                              }
                            });
                          },
                          items: currencies.map((currency) {
                            String? name = (currentLocale)
                                ? currency.Cur_Name_Eng
                                : currency.Cur_Name;
                            return DropdownMenuItem<String>(
                              value: currency.Cur_Abbreviation,
                              child: Text(name ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButton<String>(
                          value: toCurrency,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              toCurrency = newValue!;
                              if (amount > 0) {
                                _currency.convert(
                                    amount, fromCurrency, toCurrency);
                              }
                            });
                          },
                          items: currencies.map((currency) {
                            String? name = (currentLocale)
                                ? currency.Cur_Name_Eng
                                : currency.Cur_Name;
                            return DropdownMenuItem<String>(
                              value: currency.Cur_Abbreviation,
                              child: Text(name ?? ''),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              StreamBuilder<double>(
                stream: _currency.conversionStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String formattedAmount = snapshot.data.toString();
                    if (formattedAmount.contains('.')) {
                      int decimalIndex = formattedAmount.indexOf('.');
                      if (formattedAmount.length > decimalIndex + 2) {
                        // Обрезаем строку до двух знаков после запятой
                        formattedAmount =
                            formattedAmount.substring(0, decimalIndex + 3);
                      }
                    }
                    return Column(
                      children: [
                        Text(
                          S
                              .of(context)
                              .exchange
                              .replaceAll('{snapshot.data}', formattedAmount),
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(S.of(context).exchangeHowmuch(quotName ?? '')),
                      ],
                    );
                  }
                  return Text(S.of(context).no_cover_value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currency.dispose();
    super.dispose();
  }
}
