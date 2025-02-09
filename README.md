# 📱 Flutter Motels Nearby

Este aplicativo exibe uma lista de motéis próximos, permitindo visualizar suítes disponíveis, comodidades e preços. Ele foi desenvolvido em **Flutter**, utilizando **MVVM** como padrão arquitetural e **Atomic Design** para organização dos componentes da UI.

## 📸 Capturas de Tela

### Telas

![mobile](assets/media/screen.png)

### Navegação

<p align="center">
  <img src="assets/media/media.gif" width="50%" />
</p>

## 🚀 Tecnologias Utilizadas

- **Linguagem:** Dart
- **Framework:** Flutter
- **Arquitetura:** MVVM
- **Padrão de UI:** Atomic Design (atoms, molecules, organisms, templates)
- **Gerenciamento de estado:** flutter_bloc
- **Injeção de dependência:** get_it
- **Cache de imagens:** cached_network_image

## 📂 Estrutura do Projeto

```
lib/
├── app/                    # Contém a lógica de negócios e a interface do usuário do aplicativo
│   ├── app.dart            # Arquivo principal que configura o aplicativo
│   ├── models/             # Modelos de dados utilizados no aplicativo
│   ├── repositories/       # Repositórios de dados, responsáveis por gerenciar a lógica de acesso a dados
│   ├── services/           # Serviços e requisições HTTP
│   ├── viewmodel/          # ViewModels (lógica de negócios e estado)
│   └── views/              # Telas do aplicativo
│       ├── atoms/          # Componentes básicos da interface (ex: botões, textos)
│       ├── molecules/      # Pequenos agrupamentos de átomos
│       └── pages/          # Páginas completas do aplicativo
├── core/                   # Contém funcionalidades e componentes centrais compartilhados
│   ├── constants/          # Constantes globais do aplicativo
│   ├── shared/             # Componentes compartilhados (AppBar, Drawer, etc.)
│   ├── theme/              # Temas e estilos globais do aplicativo
│   └── utils/              # Utilitários e funções auxiliares
├── injection.dart          # Configuração de injeção de dependências
└── main.dart               # Arquivo principal de execução do aplicativo
```

## ✅ Testes

O projeto inclui testes unitários e de widgets para garantir a qualidade do código e a estabilidade das funcionalidades. Os testes são escritos utilizando `mockito` para simulação de dependências e `flutter_test` para validação de widgets.

Para executar os testes, utilize o seguinte comando:

```bash
flutter test
```

## 🛠 Dependências Externas

As seguintes bibliotecas foram utilizadas no projeto:

```yaml
dependencies:
  http: ^1.3.0
  freezed: ^2.5.8
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  flutter_bloc: ^9.0.0
  mockito: ^5.4.5
  equatable: ^2.0.7
  get_it: ^8.0.3
  flutter_svg: ^2.0.17
  cached_network_image: ^3.4.1
  smooth_page_indicator: ^1.2.0+3

dev_dependencies:
  flutter_lints: ^5.0.0
  build_runner: ^2.4.14
  json_serializable: ^6.9.3
  bloc_test: ^10.0.0
```

## 📌 Instruções para Execução

### Pré-requisitos

Certifique-se de ter instalado:

- **Flutter** ([Instalação](https://flutter.dev/docs/get-started/install))
- **Dart**
- **Emulador ou dispositivo físico**

### Como rodar o projeto

1. Clone o repositório:

   ```bash
   git clone https://github.com/origemjhanpoll/flutter_motels_nearby_test
   cd flutter_motels_nearby_test
   ```

2. Instale as dependências:

   ```bash
   flutter pub get
   ```

3. Execute o aplicativo:

   ```bash
   flutter run
   ```

_(Para rodar no iOS, é necessário um Mac com Xcode instalado.)_

## ❌ Suporte para Web

Atualmente, este aplicativo **não possui suporte para Web**. Ele foi desenvolvido exclusivamente para **Android e iOS**.

## 🤝 Contribuição

Sinta-se à vontade para abrir issues ou contribuir com melhorias!

## 📄 Licença

Este projeto está sob a licença MIT.
