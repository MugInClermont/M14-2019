## Dev sans MS ? 

---
## Backend

+++
## Pourquoi dart ? 

un langage moderne (v1 en 2011)

+++
## La stack technique ? 

+++?image=assets/archi.png&size=60%

+++

## Pourquoi Angel ? 

- une idée folle 
- Angel est un framework backend écrit en dart
- quelques commit dont un du MUG ! 
- 1 seul contributeur 

+++

## Pourquoi MongoDB ? 

MongoDB est une base de données orientée documents et open source

+++

## Qu'est ce que GraphQL ? 

GraphQL un de langage de requetage d'API

+++?image=assets/graphQL.png&size=60%

+++?image=assets/graphqlvsrest.png&size=80%

+++

## Demo

+++

## Les chiffres 

 - 1 pull request  
 - 50 bières 
 - 100 tentatives de déploiement sur Google App Engine
  
+++

## Enseignement 

- Attention au framework jeune 
- Difficulté d'avoir une stack complètement nouvelle 
- GraphQL c'est cool 
- faire des pub get et prévoir un bon forfait 
- WebSocket 

---

## Et pendant ce temps chez MS ...

+++

## .Net Conf

https://www.dotnetconf.net/

75 live sessions

https://www.youtube.com/watch?v=MetcuX1OHD0&list=PLReL099Y5nRd04p81Q7p5TtyjCrj9tz1t

+++

## .Net Core 3.0

Disponible depuis le 23 Septembre
* Windows Form 
* Json API
* Async Stream
* Amélioration de performance
* ...

+++

## Visual Studio 2019
* 16.3 requis pour .Net Core 3.0
* Visual Studio for Mac 8.3
+++

## C# 8 - Les types références Nullables
Par défaut les types seront Non-Nullable
````
string s = null; // Warning: Assignment of null to non-nullable reference type
````

````
string? s = null; // Ok
````

+++

## C# 8 - Flux asynchrone

````
async IAsyncEnumerable<int> GetBigResultsAsync() 
{ 
    await foreach (var result in GetResultsAsync()) 
    { 
        if (result > 20) yield return result;  
    } 
}
````
+++

## C# 8 - Les types Range et Index

````
Index i1 = 3;  // number 3 from beginning 
Index i2 = ^4; // number 4 from end 
int[] a = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }; 
Console.WriteLine($"{a[i1]}, {a[i2]}"); // "3, 6"
````
````
var slice = a[i1..i2]; // { 3, 4, 5 }
````
+++

## ASP.Net Core 3.0


+++

## gRPC

gRPC est disponible !

* Performant
* approche contract First
* compatible avec de nombreux langages
* streaming

+++

## WPF et .Net Core

Support de Winforms et WPF !!

+++

## Xamarin
XAML Hot Reload for Xamarin.Forms

+++
## Model Builder pour ML.Net
Designer graphique dans Visual studio pour définir les modèles et les entrainer
+++

## Microsoft Ignite
November 13–14, 2019
https://www.microsoft.com/fr-fr/ignite-the-tour/paris

+++
FIN
