import Foundation

// Задание 1. Написать функцию, которая определяет, четное число или нет.

func oddOrEven(_ a: Int) -> Bool {
    var b = true
    if (a % 2) == 0 {
      b = false
    }
return b
}

// Задаем число
let num = 10

// Вызываем функцию и выводим результат
print("Задание1.\nЧисло \(num) - \(oddOrEven(num) ? "нечетное" : "четное")\n")


// Задание 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func withoutResidue(_ a: Int) -> Bool {
    var b = true
    if (a % 3) == 0 {
      b = false
    }
return b
}

// Задаем число
let num2 = 3

// Вызываем функцию и выводим результат
print("Задание2.\nЧисло \(num2) - \(withoutResidue(num2) ? "делится на 3 без остатка" : "не делится на 3 без остатка")\n")


// Задание 3. Создать возрастающий массив из 100 чисел.

// Варант 1
var myFirstArray: [Int] = Array(1...100)

// Вариант 2
var mySecondArray: [Int] = [1]

while mySecondArray.count <= 99 {
    mySecondArray.append(mySecondArray.last! + 1)
}

print("Задание3.\nМассив из 100 последовательных чисел: \(myFirstArray)\n")

// Задание 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var finalArray = myFirstArray
                    .filter (oddOrEven)
                    .filter (withoutResidue)
 
print("Задание4.\nМассив, в котором отфильтрованны все четные числа и числа, которые делятся на 3: \(finalArray)\n")

// Задание 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.

func fibonacchi (numbers: Int) -> [Int] {
    var a: [Int] = [-55, 34]
    var b: Int = 2
    while a.count < numbers {
            a.append(a[b-1] + a[b-2])
            b += 1
            }
    return a
  }

print("Задание5.\nМассив из чисел Фибоначчи: \(fibonacchi(numbers: 100))\n")

// Задание 6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

// Создаем массив из 100 уникальных чисел, который всегда будет начинаться с 2. Сортируем его возрастанию.

func getRandomNumbers(listSize: Int) -> [Int] {
    var randomNumbers = Set<Int> () // добавим Set, чтобы избавиться от дублей рандомных чисел
    while randomNumbers.count < listSize {
        let randomNumber = Int.random(in: 3...200) // генерируем числа от 3 до 200, чтобы потом добавить в Set
        randomNumbers.insert(randomNumber)
    }
    let randomNumberFinal = Array(randomNumbers) // переведем в массив. Без этой строчки выдавал ошибку(не может вернуть Set в [Int]). Почему не получилось вернуть randomNumbers?
    return randomNumberFinal
    }
var eratosfenFirst = [2] + getRandomNumbers(listSize: 99) // 2 есть, получаем ещее 99 рандомных чисел
                          .sorted(by: <) // a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n). Готово, отсортировано по возрастанию
                 

/* c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/

func newNumbers (array: [Int]) -> [Int] {
    var newArray = array
    var eratosfenSecond = [Int]() // создаем пустой массив, куда будут записываться итоговые числа
    while let newPosition = newArray.first { // вводим константу, которая при повторяющемся цикле будет ровняться первому числу в массиве
        eratosfenSecond.append(newPosition) // добавляем в словарь простое число, от которого будем отталкиваться и "зачеркивать другие числа"
        newArray = newArray.filter { $0 % newPosition != 0 } // прячем в словаре-исходнике все числа, которые делятся на наше число
    }
    return eratosfenSecond
}

print("Задание6.\nМассив рандомных чисел от 2 до 200: \(eratosfenFirst)\n\nОставшиеся числа, прошедшие через решето Эратосфена: \(newNumbers(array: eratosfenFirst))\n")
