import Foundation

// Перечисления-----------------------------------
enum CarName {
    case Audi, Jaguar, Chevrolet, Ford, Bugatti, MercedesBenz, Volvo, Ferrari
}

enum ColorCar {
    case red, white, blue, yellow, black, green
}

enum TypeOfBody: CaseIterable {
    case hatchback, minivan, sedan, cabriolet, coupe, pickup, crossover
}

enum Engine: String {
    case start = "запущен", stop = "заглушен"
}

enum Windows: String {
    case open = "открыты", close = "закрыты"
}

protocol CarProtocol: class {
    var color: ColorCar { get }
    var carName: CarName { get }
    var dateOfIssue: Int { get set }
    var bodyVolume: Double { get }
    var engine: Engine { get set }
    var windows: Windows { get set}
    var trunkCapasity: Double { get }
    
    func age () -> Int
    

}
    
extension CarProtocol {
    func changeWindowsStatus ()  {
        switch windows {
        case .open:
            windows = Windows.close
            print("Теперь окна \(windows.rawValue)")
        case .close:
            windows = Windows.open
            print("Теперь окна \(windows.rawValue)")
        }
    }
    
    func changeEngineStatus () {
        switch engine {
        case .start:
            engine = Engine.stop
            print("Теперь двигатель \(engine.rawValue)")
        case .stop:
            engine = Engine.start
            print ("Теперь двигатель \(engine.rawValue)")
        }
    }
}

class SportCar: CarProtocol {
    
// Свойства протокола
    var color: ColorCar
    var carName: CarName
    var dateOfIssue: Int = 0
    var bodyVolume: Double = 0.0
    var engine: Engine
    var windows: Windows
    var trunkCapasity: Double = 0.0
    
// Уникальные свойства класса SpotrCar
    var typeOfBody: TypeOfBody
    var airConditioner: Bool

    func age() -> Int {
        return Int(2020 - dateOfIssue)
    }
    
    init(color: ColorCar, carName: CarName, dateOfIssue: Int, bodyVolume: Double, engine: Engine, windows: Windows, trunkCapasity: Double, typeOfBody: TypeOfBody, airConditioner: Bool) {
         
        self.color = color
        self.carName = carName
        self.dateOfIssue = dateOfIssue
        self.bodyVolume = bodyVolume
        self.engine = engine
        self.windows = windows
        self.trunkCapasity = trunkCapasity
        self.typeOfBody = typeOfBody
        self.airConditioner = airConditioner
        
     }
}

class TrunkCar: CarProtocol {
    
// Свойства протокола

    var color: ColorCar
    var carName: CarName
    var dateOfIssue: Int
    var bodyVolume: Double
    var engine: Engine
    var windows: Windows
    var trunkCapasity: Double
    
// Уникальные свойства класса TrunkCar
    var trailer: Bool
    var airBag: Bool
    
    func age() -> Int {
        return Int(2020 - dateOfIssue)
    }
    
    init(color: ColorCar, carName: CarName, dateOfIssue: Int, bodyVolume: Double, engine: Engine, windows: Windows, trunkCapasity: Double, trailer: Bool, airBag: Bool) {
         
        self.color = color
        self.carName = carName
        self.dateOfIssue = dateOfIssue
        self.bodyVolume = bodyVolume
        self.engine = engine
        self.windows = windows
        self.trunkCapasity = trunkCapasity
        self.trailer = trailer
        self.airBag = airBag
        
     }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        ------------------SportCar------------------
        Цвет: \(color)
        Марка машины: \(carName)
        Год выпуска: \(dateOfIssue)
        Возраст машины: \(age()) лет / год(а)
        Объем кузова: \(bodyVolume)
        Объем багажника: \(trunkCapasity)
        Статус двигателя: \(engine.rawValue)
        Положение окон: \(windows.rawValue)
        Тип кузова: \(typeOfBody)
        Наличие кондиционера: \(airConditioner == true ? "да" : "нет")
        --------------------------------------------
        \n
        """
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
        -----------------TrunkCar-------------------
        Цвет: \(color)
        Марка машины: \(carName)
        Год выпуска: \(dateOfIssue)
        Возраст машины: \(age()) лет / год(а)
        Объем кузова: \(bodyVolume)
        Объем багажника: \(trunkCapasity)
        Статус двигателя: \(engine.rawValue)
        Положение окон: \(windows.rawValue)
        Наличие прицепа: \(trailer == true ? "да" : "нет")
        Наличие подушек безопасности: \(airBag == true ? "да" : "нет")
        --------------------------------------------
        \n
        """
    }
}

// Тачки
var car1 = SportCar(color: .green, carName: .Bugatti, dateOfIssue: 2011, bodyVolume: 78, engine: .stop, windows: .close, trunkCapasity: 324, typeOfBody: .sedan, airConditioner: true)
var car2 = SportCar(color: .white, carName: .Audi, dateOfIssue: 2015, bodyVolume: 88, engine: .start, windows: .open, trunkCapasity: 255, typeOfBody: .coupe, airConditioner: false)
var car3 = TrunkCar(color: .blue, carName: .Ford, dateOfIssue: 2009, bodyVolume: 120, engine: .start, windows: .close, trunkCapasity: 450, trailer: true, airBag: false)
var car4 = TrunkCar(color: .black, carName: .MercedesBenz, dateOfIssue: 2017, bodyVolume: 100, engine: .stop, windows: .close, trunkCapasity: 1450, trailer: false, airBag: true)

// Функция из тела протокола

/// Посчитаем возраст машины
print("--------------------------------------------")
print("Возраст машины: \(car1.age()) лет / год(а)")
print("Возраст машины: \(car3.age()) лет / год(а)")
print("--------------------------------------------\n")

// Функции из расширения протокола

/// Откроем / закроем окна
print("--------------------------------------------")
print("Текущий статус окон: \(car2.windows.rawValue)")
car2.changeWindowsStatus()
print("Текущий статус окон: \(car4.windows.rawValue)")
car4.changeWindowsStatus()
print("--------------------------------------------\n")

/// Запустил / заглушим двигатель
print("--------------------------------------------")
print("Текущий статус двигателя: \(car1.engine.rawValue)")
car1.changeEngineStatus()
print("Текущий статус двигателя: \(car3.engine.rawValue)")
car3.changeEngineStatus()
print("--------------------------------------------\n")
// Выввдем описание объектов в консоль

print(car1.description)
print(car2.description)
print(car3.description)
print(car4.description)
