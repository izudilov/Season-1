import Foundation

// if let

class People {
    
    var person: Set = ["Alex", "Sam", "David", "Max"]
    
    func namePerson (NamePerson man: String) -> String? {
        return person.remove(man)
    }
}

var name = People()

if let firstPeson = name.namePerson(NamePerson: "Alex") {
    print("Был удален \(firstPeson)")
}

if let secondPerson = name.namePerson(NamePerson: "Max") { // Не сработает, т.к. такого имени нет в наборе
print("Был удален \(secondPerson)")
}
    
if let thirdPerson = name.namePerson(NamePerson: "Ilya") { // Не сработает, т.к. такого имени нет в наборе
    print("Был удален \(thirdPerson)")
}

name.person

// guard let


class Game {
    
    // Характеристики персонажа
    var lvlPerson = 1
    var expForNewLvl = 500
    var expPersonNow = 0
    var hpPersonTotal = 100
    var hpPersonNow = 40
    
    // Характеристики монстра
    var lvlmonster = 1
    var expForMonster = 57
    
}


extension Game {
    
    func newLvl () -> Int? {
        
        guard lvlPerson >= lvlmonster else {
            print("""
            -------------------------------------------------------------------------
            Вы не можете атаковать монстра, чей уровень больше вашего.
            -------------------------------------------------------------------------
            """)
            
            return nil
        }
        
        guard Double(hpPersonNow) > (Double(hpPersonTotal) * 0.5) else {
            print("""
            -------------------------------------------------------------------------
            Ваш уровень здоровья слишком маленький. Чтобы атаковать монстра - восстановите здоровье.
            -------------------------------------------------------------------------
            """)
            return nil
            
        }
        
        guard expPersonNow > expForNewLvl else {
        print("""
            -------------------------------------------------------------------------
            Вам недостаточно опыта для повышения уровня.
            Еще требуется \(expForNewLvl - expPersonNow) очков опыта.
            Для этого убейте \(Int(ceil(Double((expForNewLvl - expPersonNow) / expForMonster)))) монстра(ов)
            -------------------------------------------------------------------------
            """)
            return nil

        }

        lvlPerson += 1
        print("""
            -------------------------------------------------------------------------
            Поздравляем!
            Вы получили новый уровень!
            Ваш уровень: \(lvlPerson)
            -------------------------------------------------------------------------
            """)
        expPersonNow = 0
        return lvlPerson
    }
}

let game = Game()

game.lvlmonster = 2
game.newLvl() // уровень монстра больше нашего, сработала первая проверка
game.lvlmonster = 1
game.newLvl() // уровень монстра = нашему, сработала вторая проверка - мало здоровья
game.hpPersonNow = 70
game.newLvl() // недостаточно опыта для перехода на новый ровень, сработала третья проверка
game.expPersonNow = 578
game.newLvl() // все ок, получили новый уровень

// MARK: Do - Catch

enum GameError: Error {
    case bigMosterLvl
    case noHp
    case noExpForLvl
    
    var errorDescription: String {
         switch self {
            case .bigMosterLvl:
                return ("""
                -------------------------------------------------------------------------
                Вы не можете атаковать монстра, чей уровень больше вашего.
                -------------------------------------------------------------------------
                """)
            case .noHp:
                return ("""
                -------------------------------------------------------------------------
                Ваш уровень здоровья слишком маленький. Чтобы атаковать монстра - восстановите здоровье.
                -------------------------------------------------------------------------
                """)
            case .noExpForLvl:
                return ("""
                -------------------------------------------------------------------------
                Вам недостаточно опыта для повышения уровня.
                Еще требуется \(game.expForNewLvl - game.expPersonNow) очков опыта.
                Для этого убейте \(Int(ceil(Double((game.expForNewLvl - game.expPersonNow) / game.expForMonster)))) монстра(ов)
                -------------------------------------------------------------------------
                """)
            }
    }
}

extension Game {
    
    func superNewLvl () throws -> Int? {
        
        guard lvlPerson >= lvlmonster else {
            throw GameError.bigMosterLvl
        }
        
        guard Double(hpPersonNow) > (Double(hpPersonTotal) * 0.5) else {
            throw GameError.noHp
        }
        
        guard expPersonNow > expForNewLvl else {
            throw GameError.noExpForLvl
        }

        lvlPerson += 1
        expPersonNow = 0
        return lvlPerson
    }
}

let newGame = Game()

// Проверяем уровни персонажа и монстра

newGame.lvlmonster = 4

do {
    try newGame.superNewLvl()
    print("""
        -------------------------------------------------------------------------
        Поздравляем!
        Вы получили новый уровень!
        Ваш уровень: \(game.lvlPerson)
        -------------------------------------------------------------------------
        """)} catch let error as GameError {
    print(error.errorDescription)
}

// Проверяем здоровье

newGame.lvlmonster = 1

do {
    try newGame.superNewLvl()
    print("""
        -------------------------------------------------------------------------
        Поздравляем!
        Вы получили новый уровень!
        Ваш уровень: \(game.lvlPerson)
        -------------------------------------------------------------------------
        """)} catch let error as GameError {
    print(error.errorDescription)
}

// Проверяем наличие опыта

newGame.hpPersonNow = 65

do {
    try newGame.superNewLvl()
    print("""
        -------------------------------------------------------------------------
        Поздравляем!
        Вы получили новый уровень!
        Ваш уровень: \(game.lvlPerson)
        -------------------------------------------------------------------------
        """)} catch let error as GameError {
    print(error.errorDescription)
}

// Получаем уровень

newGame.expPersonNow = 533

do {
    try newGame.superNewLvl()
    print("""
        -------------------------------------------------------------------------
        Поздравляем!
        Вы получили новый уровень!
        Ваш уровень: \(game.lvlPerson)
        -------------------------------------------------------------------------
        """)} catch let error as GameError {
    print(error.errorDescription)
}
