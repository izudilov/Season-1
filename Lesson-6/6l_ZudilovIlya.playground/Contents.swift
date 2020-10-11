import Foundation


protocol Age {
    var age: Int {get set}
}

class Men: Age {
    var age: Int
    var height: Double
    var beard: Bool
    
    init(age: Int, heihgt: Double, beard: Bool) {
        self.age = age
        self.height = heihgt
        self.beard = beard
    }
}

class Women: Age {
    var age: Int
    var weight: Double
    var makeup: Bool
    
    init(age: Int, weight: Double, makeup: Bool) {
        self.age = age
        self.weight = weight
        self.makeup = makeup
    }
}

struct Queue <T: Age> {
    var array: [T] = []
       
    mutating func push(_ element: T) {
        array.append(element)
       }
    
    mutating func pop() -> T? {
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
    
    func filter(predicate: (Age) -> Bool ) -> [T] {
        var tmpArray = [T]()
        for element in array {
            if predicate(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
}

enum People: Age {
    case men(Men)
    case women(Women)
    var age: Int {
        get {
            switch self {
            case .men(let men):
                return men.age
            case .women(let women):
                return women.age
            }
        }
         set {
            switch self {
            case .men(let men):
               men.age = newValue
            case .women(let women):
               women.age = newValue
                   }
        }
    }
}

extension Queue {
    
subscript(elements: Int ...) -> Int? { // Выводим возраст или nill
    var age = 0
    
    for index in elements where index >= 0 {
        guard index >= self.array.count else {
        age = self.array[index].age
        return age
        }
    }
    return nil
  }
}

// Добавляем людей в очередь
var people = Queue<People>()
people.push(.men(Men(age: 32, heihgt: 187, beard: true)))
people.push(.men(Men(age: 18, heihgt: 193, beard: false)))
people.push(.women(Women(age: 24, weight: 66, makeup: true)))
people.push(.women(Women(age: 30, weight: 87.3, makeup: true)))


// Замыкания

people.array.sort(by: {$0.age < $1.age} ) // Отсортировали от самого младшего к самому старшему

let filteredPeople = people.filter(){ return $0.age > 20} // Отображает тех, кто старше 20 лет
for person in filteredPeople {
    print(person.age)
}

people[5]
