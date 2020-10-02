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


// Класс--------------------------------------------

class Cars {
    var color: ColorCar?
    var carName: CarName?
    var dateOfIssue: Int
    var bodyVolume: Double?
    var engine: Engine?
    var windows: Windows?
    var trunkCapasity: Double?
    var age: Int {
        get {
           return 2020 - dateOfIssue
        }
    }
    
    init(color: ColorCar, carName: CarName, dateOfIssue: Int, bodyVolume: Double, engine: Engine, windows: Windows, trunkCapasity: Double ) {
       
        self.color = color
        self.carName = carName
        self.dateOfIssue = dateOfIssue
        self.bodyVolume = bodyVolume
        self.engine = engine
        self.windows = windows
        self.trunkCapasity = trunkCapasity
    }
    
    init(dateOfIssue: Int) { // чтобы можно было использовать данный инициатор, сделал другие свойства опциональными
        
        self.dateOfIssue = dateOfIssue
    }
    
    func printCar() {
    print("\n-----------------------------------")
    print("Цвет: \(color!)")
    print("Марка машины: \(carName!)")
    print("Год выпуска: \(dateOfIssue)")
    print("Возраст машины: \(age) лет / год(а)")
    print("Объем кузова: \(bodyVolume!)")
    print("Объем багажника: \(trunkCapasity!)")
    print("Статус двигателя: \(engine!.rawValue)")
    print("Положение окон: \(windows!.rawValue)")
    }
}

class SportCar: Cars {
    var typeOfBody: TypeOfBody
    var airConditioner: Bool
    
    init(color: ColorCar, carName: CarName, dateOfIssue: Int, bodyVolume: Double, engine: Engine, windows: Windows, trunkCapasity: Double, typeOfBody: TypeOfBody , airConditioner: Bool)
        {
        
        self.typeOfBody = typeOfBody
        self.airConditioner = airConditioner
            super.init(color: color, carName: carName, dateOfIssue: dateOfIssue, bodyVolume: bodyVolume, engine: engine, windows: windows, trunkCapasity: trunkCapasity)
    }
    
    func changeTypeOfBody () { // выбираем рандомный тип кузова
        print("Старый кузов машины: \(typeOfBody)")
        typeOfBody = TypeOfBody.allCases.randomElement()!
        print("Новый кузов машины: \(typeOfBody)")
    }
    
    override func printCar() {
        super.printCar()
        print("Тип кузова: \(typeOfBody)")
        print("Наличие кондиционера: \(airConditioner == true ? "да" : "нет")")
        print("-----------------------------------")    }
}

class TrunkCar: Cars {
    var trailer: Bool
    var airBag: Bool
    
    init(color: ColorCar, carName: CarName, dateOfIssue: Int, bodyVolume: Double, engine: Engine, windows: Windows, trunkCapasity: Double, trailer: Bool, airBag: Bool) {
        
        self.trailer = trailer
        self.airBag = airBag
        super.init(color: color, carName: carName, dateOfIssue: dateOfIssue, bodyVolume: bodyVolume, engine: engine, windows: windows, trunkCapasity: trunkCapasity)
    }
    
    func changeTrailerOption () {
        switch trailer {
        case true: trailer = false; print("Прицеп отсоеденен")
        case false: trailer = true; print ("Прицеп присоединен")
        }
    }
    
    override func printCar () {
        super.printCar()
        print("Наличие прицепа: \(trailer == true ? "да" : "нет")")
        print("Наличие подушек безопасности: \(airBag == true ? "да" : "нет")")
        print("-----------------------------------")
    }
}


var car1 = SportCar(color: .white, carName: .Audi, dateOfIssue: 2017, bodyVolume: 274, engine: .stop, windows: .close, trunkCapasity: 69, typeOfBody: .coupe, airConditioner: true)
var car2 = TrunkCar(color: .red, carName: .Ford, dateOfIssue: 2019, bodyVolume: 1260, engine: .start, windows: .open, trunkCapasity: 2000, trailer: true, airBag: false)

print("Действие (считаем возраст машины)-----------------------------")
print("Возраст машины: \(car1.age) лет / года")
print("\nМетод (меняем кузов машины)---------------------------------")
car1.changeTypeOfBody()
print("\nМетод (присоединяем / отсоединяем прицеп)-------------------")
car2.changeTrailerOption()
car2.changeTrailerOption()
print("\nВыводим описание машин--------------------------------------")
car1.printCar()
car2.printCar()
