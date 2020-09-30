import Foundation

// Перечисления-----------------------------------

enum CarName {
    case Audi, Jaguar, Chevrolet, Ford, Bugatti, MercedesBenz, Volvo, Ferrari
}

enum ColorCar: String {
    case red = "Красный закат", blue = "Синее небо", green = "Изумруд", grey = "Мокрый асфальт", yellow = "Желтый лимон", black = "Черный аметист"
}
    
enum TypeOfBody {
    case hatchback, minivan, sedan, cabriolet, coupe, pickup, crossover
}

enum Engine {
    case start, stop
}

enum Windows {
    case open
    case close
}


// Структуры. Вариант 1---------------------------------------------

struct SportCar {
    var color: ColorCar // не получилось вывести rawValue при инициализации. Как можно было бы это сделать?
    var carName: CarName
    let dateOfIssue: Int
    let bodyVolume: Double
    var typeOfBody: TypeOfBody
    var engine: Engine {
        didSet{
            switch engine {
            case .start: print("Двигатель запущен")
            case .stop : print("Двигатель заглушен")
            }
        }
    }
    var windows: Windows {
        willSet{
            switch windows {
            case .open: print("Инициирован процесс закрытия окон")
            case .close : print("Запущена процедура открытия окон")
            }
        }
    }
    var trunkCapacity: Double {
        didSet{
            let put = oldValue - trunkCapacity
            print("В багажник можно положить еще \(put) кг.")
        }
    }
    var airConditioner: Bool
    
    mutating func openWindow() {
        windows = .open
    }
    
    mutating func closeWindow() {
        windows = .close
    }
}

struct TrunkCar {
    var color: ColorCar
    var carName: CarName
    let dateOfIssue: Int
    let bodyVolume: Double
    var engine: Engine {
        didSet{
            switch engine {
            case .start: print("Двигатель запущен")
            case .stop : print("Двигатель заглушен")
            }
        }
    }
    var windows: Windows {
        willSet{
            switch windows {
            case .open: print("Инициирован процесс закрытия окон")
            case .close : print("Запущена процедура открытия окон")
            }
        }
    }
    var trunkCapacity: Double {
        didSet{
            let put = oldValue - trunkCapacity
            print("В основной прицеп можно положить еще \(put) кг.")
        }
    }
    var airBag: Bool
    var trailer: Bool
    
    mutating func airBagAction() {
        if airBag {
            airBag = false
            print ("Опция подушек безопасности удалена")
        } else {
            airBag = true
            print ("Опция подушек безопасности добавлена")
        }
    }
}

// Структуры. Вариант 2---------------------------------------------

enum CarsType {
    case sportCar (
        color: ColorCar,
        carName: CarName,
        dateOfIssue: Int,
        bodyVolume: Double,
        typeOfBody: TypeOfBody,
        engine: Engine,
        windows: Windows,
        trunkCapacity: Double,
        airConditioner: Bool
    )
    case trunkCar (
        color: ColorCar,
        carName: CarName,
        dateOfIssue: Int,
        bodyVolume: Double,
        engine: Engine,
        windows: Windows,
        trunkCapacity: Double,
        airBag: Bool,
        trailer: Bool
    )
}

struct CarTypes {
    var car: CarsType
}

func printSportCar(car: SportCar) {
    print("\n-------------Sport Car:----------------")
    print("Цвет: \(car.color.rawValue)")
    print("Марка машины: \(car.carName)")
    print("Тип кузова: \(car.typeOfBody)")
    print("Год выпуска: \(car.dateOfIssue)")
    print("Объем кузова: \(car.bodyVolume)")
    print("Объем багажника: \(car.trunkCapacity)")
    print("Наличие кондиционера: \(car.airConditioner == true ? "Есть" : "Нет")")
    print("Статус двигателя: \(car.engine == .start ? "Запущен" : "Вылючен")")
    print("Положение окон: \(car.windows == .open ? "Открыты" : "Закрыты")")
    print("-----------------------------------------")}

func printTrunkCar(car: TrunkCar) {
    print("\n-------------Trunk Car:----------------")
    print("Цвет: \(car.color.rawValue)")
    print("Марка машины: \(car.carName)")
    print("Год выпуска: \(car.dateOfIssue)")
    print("Объем кузова: \(car.bodyVolume)")
    print("Объем багажника: \(car.trunkCapacity)")
    print("Наличие подушек безопасности: \(car.airBag == true ? "Есть" : "Нет")")
    print("Наличие прицепа: \(car.trailer == true ? "Есть" : "Нет")")
    print("Статус двигателя: \(car.engine == .start ? "Запущен" : "Вылючен")")
    print("Положение окон: \(car.windows == .open ? "Открыты" : "Закрыты")")
    print("-----------------------------------------")}

// SportCar------------------------------------------
var sportCarOne = SportCar(color: .red , carName: .Audi, dateOfIssue: 2020, bodyVolume: 270, typeOfBody: .sedan, engine: .stop, windows: .close, trunkCapacity: 50, airConditioner: false)
var sportCarTwo = CarTypes(car: .sportCar(color: .grey , carName: .Ferrari, dateOfIssue: 2019, bodyVolume: 190, typeOfBody: .coupe, engine: .start, windows: .close, trunkCapacity: 70.8, airConditioner: true))

// TrunkCar------------------------------------------
var trunkCarOne = TrunkCar(color: .yellow, carName: .Ford, dateOfIssue: 2015, bodyVolume: 1500, engine: .stop, windows: .open, trunkCapacity: 2000, airBag: false, trailer: true)
var trunkCarTwo = CarTypes(car: .trunkCar(color: .black, carName: .MercedesBenz, dateOfIssue: 2018, bodyVolume: 1788, engine: .start, windows: .close, trunkCapacity: 1900, airBag: false, trailer: true))

// Меняем свойства-----------------------------------
print("---------------Действия с автомобилями---------------")
sportCarOne.engine = .start
trunkCarOne.engine = .stop
trunkCarOne.engine = .start
print("-----------------------------------------------------")
sportCarOne.windows = .open
trunkCarOne.windows = .close
trunkCarOne.windows = .open
print("-----------------------------------------------------")
sportCarOne.trunkCapacity = 15
trunkCarOne.trunkCapacity = 950
print("-------------------------Методы----------------------")
sportCarOne.windows
sportCarOne.closeWindow()
sportCarOne.windows
trunkCarOne.airBag
trunkCarOne.airBagAction()
trunkCarOne.airBag

printSportCar(car: sportCarOne)
printTrunkCar(car: trunkCarOne)
