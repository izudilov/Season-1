import Foundation

// Задание 1. Решить квадратное уравнение 2x2 + 8x + 3 = 0

let a: Double = 2
let b: Double = 8
let c: Double = 3
var root1: Double = 0
var root2: Double = 0

// Ищем дискриминант
let d = b*b-4*a*c

// Ищем корни в зависисмости от значения дискриминанта
if d > 0 {
    root1 = (-b-sqrt(d))/(2*a);
    root2 = (-b+sqrt(d))/(2*a);
    print("Задание 1.\nДискриминант больше 0, корень №1 = \(root1), корень №2 = \(root2)\n")
} else if d == 0 {
    root1 = -b/(2*a);
    root2 = root1;
    print("Задание 1.\nДискриминант равен 0, поэтому поэтому оба корня равны \(root1)\n")
} else {
    print("Задание 1.\nДискриминант меньше 0, поэтому уравнение не имеет решения\n")
}

// Задание 2. Найти площадь, периметр и гипотенузу треугольника. Катет А = 14, катет В = 6, катет С = 12

let cathetusA: Int = 14
let cathetusB: Int = 6
let cathetusC: Int = 12

// Ищем площадь
let area = cathetusA * cathetusB / 2

// Ищем периметр
let perimetr = cathetusA + cathetusB + cathetusC

// Ищем гипотенузу
let hypotenuse = sqrt(Float(cathetusA*cathetusA+cathetusB*cathetusB))

// Выводим ответ
print("Задание 2.\nПлощадь треугольника = \(area), периметр = \(perimetr), гипотенуза = \(hypotenuse)\n")

// Задание 3. Найти сумму вклада через 5 лет, если сумма равна 100 000 р. и процентная ставка 6,3%

var year: Int = 0
let percent: Float = 6.3 / 100 // переводим целое число 6,3 в %
let deposit: Int = 100000

// Массив для хранения сумм дохода
var sumTotal: [Float] = []

// Считаем и выводим денюшки за каждый год
while year < 5 {
    year += 1
    if year == 1 {
        var sum = Float(deposit) + (Float(deposit) * percent)
        sumTotal.append(sum)
        print("Задание 3.\nСумма вклада за \(year) год составит: \(sumTotal.first!)")
    } else {
        var sum = sumTotal.last! + (sumTotal.last! * percent)
        sumTotal.append(sum)
        print("Сумма вклада за \(year) года составит: \(sumTotal.last!)")
    }
}

// Считаем и выводим денюшки за весь срок
print("Общая сумма дохода за 5 лет составит \(sumTotal.last! - Float(deposit))")




