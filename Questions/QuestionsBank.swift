//
//  QuestionsBank.swift
//  Questions
//
//  Created by Руслан on 02.10.2024.
//

import Foundation

class QuestionsBank {
    static let shared = QuestionsBank(); private init () { }
    
    let swiftUI: [QuestionModel] =
    [
        QuestionModel(question: "Что такое декларативный синтаксис?", answer: "Декларативный синтаксис — это современная парадигма программирования, помогающая разработчиками писать код процедурно т.е. это способ описания того, что нужно сделать, а не как это сделать."),
        QuestionModel(question: "Что такое View в SwiftUI?", answer: "View(вью) — это основной строительный блок UI. Вью наследуется от протокола View"),
        QuestionModel(question: "Перечислите все ленивые (lazy) контейнеры/вью?", answer: "Называются ленивыми (lazy), потому что вью не создает все элементы сразу. Элементы выводятся на экран по мере необходимости. List, LazyVStack, LazyHStack, LazyHGrid, LazyVGrid, Table."),
        QuestionModel(question: "Что такое модификаторы в SwiftUI?", answer: "С помощью Modifiers(модификатора) можно добавить определенное изменение вью. SwiftUI предоставляет около 100-та собственных/встроенных модификаторов, таких как: .padding(), .background() и .offset(). Так же вы можете создать собственный модификатор, который делает что-либо с вашей вью."),
        QuestionModel(question: "Что будет если применить модификатор к вью?", answer: "Применив модификатор к вью, добавляется определенное поведение, которое вы ожидаете и возвращается новая вью."),
        QuestionModel(
            question: "Какие категории View вы знаете?",
            answer: """
                Lazy вью, как List подгружают элементы UI, когда они находятся или будут находиться внутри области прокрутки. Таким образом, не все данные из вью хранятся в текущей вью. Попробуем назвать элементы UI, которые генерируются во вью, displayables. Вью SwiftUI может иметь 0 или > 0 displayables.
                Когда дело доходит до сравнения, можем выделить 4-ре основных категории:
                1. Unary: Вью с единственным displayable, таким как shapes, colors, controls и labels.
                2. Structural: Вью, которая принимает 0 или > 0 и комбинирует их в некоторое подмножество: ForEach, EmptyView и вью, которые строятся с ViewBuilder, такие как TupleView и _ConditionalView.
                3. Container: Вью, которые принимают другие вью и управляют их расположением: HStack, VStack, List, LazyVStack.
                4. Modifiers: Вью, которое добавляет и изменяет внешний вид и/или поведение.
                """
        ),
        QuestionModel(
            question: "Что такое ViewModifier?",
            answer: """
                ViewModifier - это протокол, с помощью которого можно кастомизировать другой модификатор (modifier) или вью. Вы можете объединить несколько модификаторов, которые в конце вернут вью. Чтобы изменить UIView в UIKit, вы используете проперти вью. В UIKit вы, вероятно, используете YourView.backgroudColor = .red, чтобы настроить UIView. Такой подход называется императивным. Для кастомизации в декларативном стиле в SwiftUI мы просто описываем, как вью должна выглядеть, используя ViewModifier.
                """
        ),
        QuestionModel(
            question: "Что такое property wrapper?",
            answer: """
                Проперти враппер (property wrapper) добавляет слой разделения между кодом, отвечающим за хранение свойств, и кодом, отвечающим за объявление этого property wrapper.
                
                @Published - обертка, которая говорит, что при изменении будет перерисовка вью, на которой используется обернутое значение.
                
                @State - property wrapper, используется внутри View объекта и позволяет вашей вью реагировать на любые изменения.
                
                @Binding - property wrapper, используется для передачи значений в дочернюю (child) вью. Вью, принимающая биндинг, может читать проперти, реагировать на изменения от родительской вью и имеет доступ на запись проперти.
                
                @StateObject - наблюдение и изменение, можно использовать только 1 раз для каждого объекта, так как он создает и хранится в памяти.
                
                @ObservedObject - схож с @StateObject, за исключением того, что в нем не упоминается создание или хранение инстанса. ObservedObject используется для отслеживания изменений уже созданного объекта с использованием @StateObject.
                
                @EnvironmentObject - похож на @ObservedObject. Основное различие в том, что @EnvironmentObject доступен в большем диапазоне, во множестве вложенных вью.
                
                @Environment - считывает значение окружения ОС и перерисовывает вью, если что-то меняется.
                """
        ),
        QuestionModel(
            question: "Назовите property wrapper, которые объявляют reference семантику?",
            answer: """
                SwiftUI предоставляет property wrappers, которые объявляют reference type в качестве источника истины (source of truth): @ObservedObject, @StateObject и @EnvironmentObject. Для использования этих врапперов необходимо, чтобы класс стал наблюдаемым (observable).
                """
        ),
        QuestionModel(
            question: "Как сделать класс наблюдаемым?",
            answer: """
                До iOS 17 нужно было объект подписать под ObservableObject, @Published для значений. После iOS 17 используется @Observable.
                """
        ),
        QuestionModel(
            question: "Состояние сцены и переход (Scene phases and transitions)?",
            answer: """
                • активная — сцена активна и пользователь может взаимодействовать с ней.
                • неактивная — сцена видна, но взаимодействие с ней отключено системой. Например, в режиме мультизадачности, вы можете увидеть список приложений, но эта панель не является активной.
                • фон — Приложение работает, но сцена не видна в UI. Сцена переходит в это состояние перед завершением работы приложения.
                
                Узнать текущую сцену можно из значения среды scenePhase.
                """
        ),
        QuestionModel(
            question: "Какие модификаторы изменяют View life cycle events?",
            answer: """
                • onAppear(perform:) выполняет действие при каждом появлении вью, даже если вью появилась не первый раз.
                • onDisappear(perform:) выполняет действие при уходе с вью.
                • task(priority:_:) выполняет действие в асинхронной среде при появлении вью и перестает выполнять при уходе с вью.
                ⚠️ Ключевая разница между onAppear и task в том, что покидая вью, onAppear не останавливает выполнение задачи, а task наоборот автоматически запускает и останавливает.
                """
        )
        
        
    ]
    let mainQuestions: [QuestionModel] = [
        
        QuestionModel(
            question: "Что такое вывод типов (type inference)?",
            answer: "Возможность компилятора самому логически вывести тип значения у выражения."
        ),
        QuestionModel(
            question: "Для чего используется ключевое слово fallthrough?",
            answer: "Ключевое слово fallthrough позволяет оператору switch не прерывать выполнение после case и перейти к следующему блоку."
        ),
        QuestionModel(
            question: "Что такое autoclosure?",
            answer: "Автозамыкания — это замыкания, которые автоматически создаются из выражений и позволяют отложить вычисление до фактического использования."
        ),
        QuestionModel(
            question: "Что такое escaping closure?",
            answer: "Escaping замыкания позволяют выйти за пределы области видимости функции, используя атрибут @escaping."
        ),
        QuestionModel(
            question: "В чем разница между Int и UInt?",
            answer: "Int — знаковый целочисленный тип, а UInt — беззнаковый, который не может содержать отрицательные значения."
        ),
        QuestionModel(
            question: "Что такое Generics?",
            answer: "Generics позволяют создавать код, который работает с разными типами данных, избегая дублирования."
        ),
        QuestionModel(
            question: "Что такое Протоколы (protocols)?",
            answer: "Протоколы — это набор требований к методам и свойствам, которые могут быть реализованы классами, структурами или перечислениями."
        ),
        QuestionModel(
            question: "Что такое Tuples (тупл, кортёж)?",
            answer: "Кортежи позволяют группировать несколько значений различных типов в одно составное значение."
        ),
        QuestionModel(
            question: "Расскажите о коллекциях (collection)?",
            answer: """
                Коллекции — это структуры данных, которые хранят несколько элементов. Основные типы: массивы, множества и словари.
                1. Массивы (Array) хранят элементы в упорядоченном списке.
                2. Множества (Set) содержат уникальные элементы в любом порядке.
                3. Словари (Dictionary) хранят пары ключ-значение.
                """
        ),
        QuestionModel(
            question: "Что такое Optional? (опциональное значение)",
            answer: "Опционал — это тип данных, который может содержать значение или быть пустым, реализован через enum с случаями none и some."
        ),
        QuestionModel(
            question: "Что такое Inout и как его использовать?",
            answer: "Inout позволяет изменять параметры функции внутри её тела и сохранять изменения после выхода из функции."
        ),
        QuestionModel(
            question: "Разница между Self и self?",
            answer: "Self указывает на тип, self указывает на конкретный экземпляр."
        ),
        QuestionModel(
            question: "Что такое lazy?",
            answer: "Lazy — это свойства, значения которых вычисляются только при первом использовании."
        ),
        QuestionModel(
            question: "Что такое defer?",
            answer: "Defer откладывает выполнение блока кода до завершения текущей области видимости."
        ),
        QuestionModel(
            question: "В чем разница между guard let и if let?",
            answer: "Guard let используется для раннего выхода из функции, а if let — для работы внутри блока."
        ),
        QuestionModel(
            question: "Преимущества использования guard let?",
            answer: "Guard let позволяет избежать вложенных if-блоков и упрощает код за счет раннего выхода."
        ),
        QuestionModel(
            question: "Что такое final перед class?",
            answer: "Final запрещает наследование от класса или переопределение его методов."
        ),
        QuestionModel(
            question: "Что происходит с классом при компиляции?",
            answer: "Класс проходит несколько этапов: разбор, построение таблиц, оптимизация и компиляция в машинный код."
        ),
        QuestionModel(
            question: "Разница между static и final?",
            answer: "Static используется для свойств и методов, которые можно вызвать без экземпляра класса, final запрещает наследование и переопределение."
        ),
        QuestionModel(
            question: "Разница между open и public?",
            answer: "Open позволяет наследоваться и переопределять класс в других модулях, public — только использовать, но не наследоваться."
        ),
        QuestionModel(
            question: "Разница между операторами == и ===?",
            answer: "== сравнивает значения, а === проверяет, указывают ли переменные на один и тот же экземпляр."
        ),
        QuestionModel(
            question: "Почему нельзя объявить open struct?",
            answer: "Наследование структур невозможно, поэтому они не могут быть open."
        ),
        QuestionModel(
            question: "Разница между fileprivate, private и public private(set)?",
            answer: "Fileprivate доступен внутри файла, private — внутри типа, а public private(set) — публичный getter и приватный setter."
        ),
        QuestionModel(
            question: "Что такое внутренний уровень доступа?",
            answer: "Internal доступен внутри модуля, но скрыт от других модулей."
        ),
        QuestionModel(
            question: "Разница между struct и class?",
            answer: "Struct — это value type, который копируется, class — reference type, передающийся по ссылке."
        ),
        QuestionModel(
            question: "Что такое value/refrence type?",
            answer: "Value type копирует данные, reference type передает ссылку на данные. Пример: struct (value type), class (reference type)."
        ),
        QuestionModel(
            question: "Почему Apple предпочитает использовать value type?",
            answer: "Value type потокобезопасны, предотвращают утечки памяти и позволяют локализовать изменения."
        ),
        QuestionModel(
            question: "Каким простым способом можно реализовать абстракцию в проекте?",
            answer: "Используя протоколы и модули, например, Swift Package Manager (SPM)."
        ),
        QuestionModel(
            question: "Разница между assign и retain?",
            answer: "Assign выделяет память для данных, retain удерживает ссылку на объект."
        ),
        QuestionModel(
            question: "Поддерживает ли Swift функции первого класса?",
            answer: "Да, функции можно передавать как аргументы и возвращать как значения."
        ),
        QuestionModel(
            question: "Что такое Copy on Write (COW)?",
            answer: "COW оптимизирует память, копируя данные только при их изменении, а не при каждом вызове."
        ),
        QuestionModel(
            question: "Что такое trailing closure syntax?",
            answer: "Trailing closure синтаксис позволяет передавать замыкание как последний аргумент функции вне её круглых скобок."
        )
        
        
    ]
    let gcdQuestions: [QuestionModel] = [
        QuestionModel(question: "Что такое Grand Central Dispatch (GCD)?", answer: "GCD — библиотека для конкурентного выполнения задач, которая управляет потоками на системном уровне."),
        QuestionModel(question: "Что такое dispatch queue?", answer: "Очередь, выполняющая задачи по принципу FIFO, либо последовательно, либо параллельно."),
        QuestionModel(question: "Существует 2 типа queue. Перечислите и расскажите.", answer: "Serial — выполняет задачи последовательно. Concurrent — выполняет задачи параллельно."),
        QuestionModel(question: "Объясните 3 GCD queues?", answer: "Main queue — работает на main thread (Serial). Global queue — Concurrent с разным приоритетом. Custom queue — может быть Serial или Concurrent."),
        QuestionModel(question: "Что такое main thread и его использование?", answer: "Главный поток используется для всех задач, связанных с UI. Не рекомендуется загружать данные или выполнять задачи, которые могут блокировать интерфейс."),
        QuestionModel(question: "Что такое Quality of Service?", answer: "Quality of Service определяет приоритет задачи: User Interactive, User Initiated, Utility, Background."),
        QuestionModel(question: "Объясните data race?", answer: "Ситуация, когда два потока пытаются одновременно получить доступ к одной области памяти, при этом один поток выполняет запись, что может вызвать ошибки."),
        QuestionModel(question: "Объясните race condition?", answer: "Семантическая ошибка, вызванная неправильной последовательностью событий. Она может быть вызвана Data Race и может быть решена с помощью синхронизации, например, NSLock."),
        QuestionModel(question: "Объясните deadlock?", answer: "Deadlock возникает, когда несколько задач ждут завершения друг друга, но ни одна не может завершиться, что приводит к тупиковой ситуации."),
        QuestionModel(question: "Что такое priority inversion?", answer: "Ситуация, когда поток с низким приоритетом блокирует выполнение потока с высоким приоритетом, делая назначенные приоритеты бессмысленными."),
        QuestionModel(question: "Объясните NSOperation?", answer: "NSOperation — это надстройка над GCD, которая упрощает работу с многопоточностью, поддерживая зависимости между операциями и их отмену."),
        QuestionModel(question: "Что такое ThreadPool?", answer: "Пул потоков — это фиксированное количество потоков, которые используются повторно для выполнения задач."),
        QuestionModel(question: "Что такое Semaphore?", answer: "Семафор контролирует доступ нескольких потоков к общему ресурсу с помощью методов wait() и signal()."),
        QuestionModel(question: "Что такое Task?", answer: "Task — это юнит асинхронной работы, который выполняется немедленно после объявления и может быть структурированным или неструктурированным."),
        QuestionModel(question: "Расскажите о Task priority.", answer: "TaskPriority включает значения: high, medium, low, userInitiated, background, utility. Дочерние таски наследуют приоритет от родительских, а detach — нет."),
        QuestionModel(question: "Расскажите о TaskGroup.", answer: "TaskGroup используется для создания группы дочерних задач. Метод withTaskGroup позволяет создавать и управлять групповыми задачами."),
        QuestionModel(question: "Что такое actor?", answer: "Actor — это reference type, который защищает доступ к своему состоянию, обеспечивая безопасную работу в конкурентной среде."),
        QuestionModel(question: "Расскажите о ключевом слове await.", answer: "Await отмечает точку приостановки выполнения задачи. Это потенциальные suspension points, где выполнение задачи может быть временно приостановлено.")
    ]
    let memoryQuestions = [
        QuestionModel(
            question: "Что такое ARC?",
            answer: "ARC (Automatic Reference Counting) — это механизм автоматического подсчета ссылок, который освобождает память объекта, когда на него больше не остается сильных ссылок."
        ),
        QuestionModel(
            question: "Как iOS управляет памятью?",
            answer: "iOS использует ARC для управления памятью. Объекты освобождаются, когда на них больше нет сильных ссылок."
        ),
        QuestionModel(
            question: "Как работает ARC?",
            answer: "ARC отслеживает количество сильных ссылок на объект. Когда количество ссылок становится нулевым, объект освобождается."
        ),
        QuestionModel(
            question: "Перечислите и расскажите о счетчиках ссылок.",
            answer: "Существуют три типа ссылок: Strong, Weak, и Unowned. Strong удерживает объект, Weak не удерживает и является optional, Unowned не удерживает, но не является optional."
        ),
        QuestionModel(
            question: "Что такое strong reference?",
            answer: "Strong reference — это сильная ссылка на объект, которая удерживает его в памяти до тех пор, пока ссылка существует."
        ),
        QuestionModel(
            question: "Что такое retain cycle?",
            answer: "Retain cycle возникает, когда два объекта удерживают друг друга через сильные ссылки, что препятствует освобождению памяти."
        ),
        QuestionModel(
            question: "Что такое capture list?",
            answer: "Capture list — это механизм контроля ссылок внутри замыканий. Используя weak или unowned, можно предотвратить создание сильных ссылок."
        ),
        QuestionModel(
            question: "В чем разница между unowned и unowned(unsafe)?",
            answer: "Unowned гарантирует безопасное управление памятью через ARC, в то время как unowned(unsafe) не использует ARC и может приводить к ошибкам, если объект был освобожден."
        ),
        QuestionModel(
            question: "Что такое memory leak?",
            answer: "Утечка памяти — это ситуация, когда память остается выделенной, но больше не используется и не освобождается."
        ),
        QuestionModel(
            question: "Может ли value type передаваться по ссылке?",
            answer: "Замыкания всегда захватывают значения по ссылке, даже если это value type, что может привести к удержанию объекта в памяти."
        ),
        QuestionModel(
            question: "Что такое circular dependencies?",
            answer: "Circular dependencies — это ошибка проектирования, когда два или более модуля зависят друг от друга, прямо или косвенно."
        ),
        QuestionModel(
            question: "Объясните механизм COW?",
            answer: "COW (Copy-On-Write) позволяет создавать копии объекта только при записи, что улучшает производительность за счет уменьшения ненужных копирований."
        ),
        QuestionModel(
            question: "Что такое method dispatch?",
            answer: "Method dispatch — это процесс выбора конкретной реализации метода при его вызове. Существуют разные виды диспетчеризации: Direct, Virtual-table, Witness-table и Message."
        ),
        QuestionModel(
            question: "В чем разница между garbage collector и ARC?",
            answer: "ARC — это форма детерминированного управления памятью, тогда как garbage collector работает недетерминированно и управляется внешним процессом."
        ),
        QuestionModel(
            question: "Что такое MemoryLayout и как посчитать размер протокола?",
            answer: "MemoryLayout — это enum, с помощью которого можно узнать размер, выравнивание и шаг типа данных. Размер протокола зависит от его структуры и используемых ссылок."
        )
    ]
    let archPatterns = [
        QuestionModel(
            question: "Что такое MVVM?",
            answer: """
            MVVM (Model–View–ViewModel) — это архитектурный паттерн, который разделяет логику приложения на три компонента:
            1. **Model** — отвечает за данные и бизнес-логику.
            2. **View** — графический интерфейс, взаимодействующий с пользователем.
            3. **ViewModel** — промежуточное звено между View и Model, которое обрабатывает данные и команды.
            """
        ),
        QuestionModel(
            question: "Что такое Singleton pattern?",
            answer: """
            Singleton — это паттерн, который гарантирует, что у класса будет только один инстанс, доступный глобально.
            Примеры: Calendar.current, UserDefaults.standard.
            В Swift легко реализовать с помощью статического свойства и приватного инициализатора.
            """
        ),
        QuestionModel(
            question: "Какой подход лучше Singleton?",
            answer: """
            Inversion of control (IoC) и Dependency injection (DI) считаются лучшими подходами, так как они уменьшают связанность кода и делают его более тестируемым.
            """
        ),
        QuestionModel(
            question: "Что такое Dependency Injection?",
            answer: """
            Dependency Injection (DI) — это паттерн внедрения зависимостей, при котором объект получает свои зависимости извне, что облегчает тестирование и модификацию программы. Зависимости могут быть внедрены через конструктор, сеттеры или интерфейсы.
            """
        ),
        QuestionModel(
            question: "Что такое Decorator pattern?",
            answer: """
            Decorator — это структурный паттерн, который позволяет динамически добавлять поведение объектам. В отличие от наследования, декораторы могут применять дополнительное поведение к объектам без изменения их структуры. В Swift можно реализовать с помощью протоколов.
            """
        ),
        QuestionModel(
            question: "Что такое Anti-pattern?",
            answer: """
            Anti-pattern (антипаттерн) — это популярное решение, которое приводит к отрицательным последствиям. Примером является Singleton, который иногда считается антипаттерном из-за его негативных эффектов, таких как трудность тестирования и скрытые зависимости.
            """
        ),
        QuestionModel(
            question: "Что такое Observer pattern?",
            answer: """
            Observer pattern — это поведенческий паттерн, который позволяет объекту подписаться на изменения состояния другого объекта. В Swift это реализуется с помощью NotificationCenter или KVO (Key-Value Observing).
            """
        ),
        QuestionModel(
            question: "Что такое SOLID?",
            answer: """
            SOLID — это пять принципов объектно-ориентированного проектирования, которые делают код более гибким и поддерживаемым:
            1. **S**ingle responsibility — каждый класс должен решать одну задачу.
            2. **O**pen-closed — классы должны быть открыты для расширения, но закрыты для модификации.
            3. **L**iskov substitution — объекты должны заменяться их подтипами без нарушения работы программы.
            4. **I**nterface segregation — интерфейсы должны быть узкоспециализированными, чтобы не заставлять пользователей реализовывать методы, которые они не используют.
            5. **D**ependency inversion — модули высокого уровня не должны зависеть от модулей низкого уровня; оба должны зависеть от абстракций.
            """
        )
    ]


    func getRandonQuestion(_ theme: String) -> QuestionModel {
        var question: QuestionModel? = nil
        switch theme {
        case "SwiftUI" : question = swiftUI.randomElement()
        case "Main" : question = mainQuestions.randomElement()
        case "GCD" : question = gcdQuestions.randomElement()
        case "Memory" : question = memoryQuestions.randomElement()
        case "Arch" : question = archPatterns.randomElement()
        case "All" : question = (self.swiftUI + self.mainQuestions + self.gcdQuestions + self.memoryQuestions + self.archPatterns).randomElement()
        default:
            print("any")
        }
        
        if let quest = question { return quest }
        return swiftUI[0]
    }
    
    func get3Quest () -> [QuestionModel] {
        var array: [QuestionModel]  = []
        for i in 1...3 {
            let quest = getRandonQuestion ("All")
            array.append(quest)
        }
        return array
    }
}
