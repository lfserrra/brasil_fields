# brasil_fields

O jeito mais fácil de utilizar padrões e formatos brasileiros em seu projeto.

## Apresentação

Este package facilita o desenvolvimento com a linguagem Dart em projetos que
utilizam campos com os padrões e formatos brasileiros.

### Instalação

```
dependencies:
  brasil_fields: ^0.0.7+2
```

### Formatters

- CPF (999.999.99-99)
- CNPJ (99.999.999/9999-99)
- CEP (99.999-999)
- Real (R\$) (20.550)
- Centavos (R\$) (20,90)
- Telefone ( (99) 9999-9999)
- Data (01/01/1900)

<img src="https://github.com/rubensdemelo/brasil_fields/blob/master/img/formatters.png" width="350px">

### Padrões

- Estados
- Meses
- Regiões
- Semana

<img src="https://github.com/rubensdemelo/brasil_fields/blob/master/img/padroes.png" width="350px">

### Como utilizar :

Basta incluir o formatter que você quer que o campo tenha, na lista de `inputFormatters` :

**Para garantir que o campo aceite apenas valores numéricos, utilize em conjunto com o formatter `WhitelistingTextInputFormatter.digitsOnly` .**

```dart
TextFormField(
  inputFormatters: [
    WhitelistingTextInputFormatter.digitsOnly,
    CepInputFormatter(),
  ],
);
```

- `CpfInputFormatter()`
- `CnpjInputFormatter()`
- `CepInputFormatter()`
- `RealInputFormatter()`
- `TelefoneInputFormatter()`
- `DataInputFormatter()`

Caso precise de um DropdownButton com algumas das classes de padrões:

```dart
DropdownButton(
  items: Regioes.listaRegioes.map((String opcao) {
    return DropdownMenuItem<String>(
    value: opcao,
    child: Text(opcao),
  );
}).toList(),
```
