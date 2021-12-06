import 'dart:convert';

class SettingsList {
  static List<dynamic> elements = [
    {
      "id": 1,
      "title": "Samsung Account",
      "subtitle": "Профиль • Безопасность • Приложения",
      "icon": "image/acc_.png",
      "group": "1"
    },
    {
      "id": 2,
      "title": "Подключение",
      "subtitle": "Wi-Fi • Bluetooth • Авиорежим",
      "icon": "image/wi.png",
      "group": "2"
    },
    {
      "id": 3,
      "title": 'Звук и вибрация',
      "subtitle": 'Режим звука • Мелодия звонка',
      "icon": 'image/soundd.png',
      "group": "3"
    },
    {
      "id": 4,
      "title": "Уведомления",
      "subtitle": "Строка состояния • Не беспокоить",
      "icon": "image/notific.png",
      "group": "3"
    },
    ////////////////
    {
      "id": 5,
      "title": "Дисплей",
      "subtitle": "Яркость • Комфорт для глаз • Навигационная\nпанель",
      "icon": "image/1515.png",
      "group": "4"
    },

    {
      "id": 6,
      "title": "Обои",
      "subtitle": "Обои для главного экрана и блокировки",
      "icon": "image/image.png",
      "group": "4"
    },
    {
      "id": 7,
      "title": "Темы",
      "subtitle": "Темы • Обои • Знакчки",
      "icon": "image/th.png",
      "group": "4"
    },
    {
      "id": 8,
      "title": 'Главный экран',
      "subtitle": 'Макеты • Индекаторы на значках',
      "icon": 'image/11.png',
      "group": "4"
    },
    {
      "id": 9,
      "title": "Экран блокировки",
      "subtitle": 'Тип блокировки экрана',
      "icon": 'image/lllock.png',
      "group": "4"
    },
    //////////////////////////
    {
      "id": 10,
      "title": "Биометрия и безопасность",
      "subtitle": "Распознавание лица • Отпечатки пальцев",
      "icon": "image/145.png",
      "group": "5"
    },
    {
      "id": 11,
      "title": "Конфиденциальность",
      "subtitle": "Диспетчер разрешений",
      "icon": "image/146.png",
      "group": "5"
    },
    {
      "id": 12,
      "title": "Локация",
      "subtitle":
          "Резрешения на определение местоположения • \nЗапросы на доступ к местоположению",
      "icon": "image/146.png",
      "group": "5"
    },
    {
      "id": 13,
      "title": "Google",
      "subtitle": "Службы Google",
      "icon": "image/google.png",
      "group": "5"
    },
    {
      "id": 14,
      "title": "Учетные записи и архивация",
      "subtitle": "Управление учетными записями • Smart Switch",
      "icon": "image/synchr.png",
      "group": "5"
    },
    //////////////
    {
      "id": 15,
      "title": "Дополнительные функции",
      "subtitle": "Android Auto • Боковая клавиша",
      "icon": "image/sett.png",
      "group": "6"
    },
    ///////////////
    {
      "id": 16,
      "title": "Использование устройства и\nродительский контроль",
      "subtitle": "Время использования экрана • Таймер\nприложений • Режим сна",
      "icon": "image/child.png",
      "group": "7"
    },
    {
      "id": 17,
      "title": "Обслуживание устройства",
      "subtitle": "Память • ОЗУ • Защита устройства",
      "icon": "image/user.png",
      "group": "7"
    },
    {
      "id": 18,
      "title": "Приложения",
      "subtitle": "Приложения по умолчанию  • Настройки\nприложений",
      "icon": "image/app.png",
      "group": "7"
    },
    ///////////////
    {
      "id": 19,
      "title": "Общие настройки",
      "subtitle": "Язык и клавиатура • дата и время",
      "icon": "image/2355.png",
      "group": "8"
    },
    {
      "id": 20,
      "title": "Специальные возможности",
      "subtitle": "TalkBack • Звук моно • Вспомогательное меню",
      "icon": "image/002.png",
      "group": "8"
    },
    //////////////////////
    {
      "id": 21,
      "title": "Обнавление ПО",
      "subtitle": "Зaгрузка и установка",
      "icon": "image/flat.png",
      "group": "9"
    },
    {
      "id": 22,
      "title": "Руководство пользователя",
      "subtitle": "Руководство пользователя",
      "icon": "image/7455.png",
      "group": "9"
    },
    {
      "id": 23,
      "title": "Удаленная поддержка",
      "subtitle": "Удаленная поддержка",
      "icon": "image/service.png",
      "group": "9"
    },
    {
      "id": 23,
      "title": "Состояние • Юридическая информация • Имя\nтелефона",
      "subtitle": "Сведения о телефоне",
      "icon": "image/0102.png",
      "group": "9"
    },

    {
      "id": 23,
      "title": "Параметры разработчика",
      "subtitle": "Параметры разработчика",
      "icon": "image/dev.png",
      "group": "9"
    }
  ];
}

List<SettingItem> settingList() =>
    settingItemFromJson(json.encode(SettingsList.elements));

List<SettingItem> settingItemFromJson(String str) => List<SettingItem>.from(
    json.decode(str).map((x) => SettingItem.fromJson(x)));

String settingItemToJson(List<SettingItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SettingItem {
  SettingItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.group,
  });

  final int id;
  final String title;
  final String subtitle;
  final String icon;
  final String group;

  factory SettingItem.fromJson(Map<String, dynamic> json) => SettingItem(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        icon: json["icon"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "icon": icon,
        "group": group,
      };

}
