import 'package:flutter_motels_nearby_test/app/models/category_item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/data_model.dart';
import 'package:flutter_motels_nearby_test/app/models/discount_model.dart';
import 'package:flutter_motels_nearby_test/app/models/item_model.dart';
import 'package:flutter_motels_nearby_test/app/models/motel_model.dart';
import 'package:flutter_motels_nearby_test/app/models/period_model.dart';
import 'package:flutter_motels_nearby_test/app/models/response_model.dart';
import 'package:flutter_motels_nearby_test/app/models/suite_model.dart';

ResponseModel get responseSample => ResponseModel(
      success: true,
      data: DataModel(
        page: 1,
        itemsPerPage: 10,
        totalSuites: 0,
        totalMotels: 1,
        radius: 0,
        maxPages: 1.0,
        motels: [
          MotelModel(
            name: 'Motel Le Nid',
            logo:
                'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif',
            neighborhood: 'Chácara Flora - São Paulo',
            distance: 28.27,
            favoritesCount: 0,
            suites: [
              SuiteModel(
                name: 'Suíte Marselha s/ garagem privativa',
                quantity: 1,
                showAvailableQuantity: true,
                photos: [
                  'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg',
                  'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg',
                ],
                items: [
                  ItemModel(name: 'ducha dupla'),
                ],
                categoryItems: [
                  CategoryItemModel(
                    name: 'Frigobar',
                    icon:
                        'https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png',
                  ),
                ],
                periods: [
                  PeriodModel(
                    formattedTime: '3 horas',
                    time: "3",
                    price: 88.0,
                    totalPrice: 88.0,
                    hasCourtesy: false,
                    discount: null,
                  ),
                  PeriodModel(
                    formattedTime: '12 horas',
                    time: "12",
                    price: 129.58,
                    totalPrice: 81.58,
                    hasCourtesy: false,
                    discount: DiscountModel(amount: 48.0),
                  ),
                ],
              ),
            ],
            reviewsCount: 2159,
            rating: 4.6,
          ),
        ],
      ),
      messages: [],
    );
