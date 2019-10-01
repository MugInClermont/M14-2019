## Dev without MS ? 

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

Angel est un framework backend écrit en dart

+++

## Pourquoi MongoDB ? 

MongoDB est une base de données orienté documents et open source

+++

## Qu'est ce que GraphQL ? 

GraphQL un de langage de requetage d'API

+++?image=assets/graphQL.png&size=60%

+++?image=assets/graphqlvsrest.png&size=60%

+++

## Demo

+++




---

### And the Cloud? 

- Docker Cloud |
- Amazon Elastic Kubernetes Service (aka: Amazon EKS) |
- Alibaba Container Services for Kubernetes (aka: CSK) |
- Azure Kubernetes Service (aka: AKS) | 

---

## Question?

Note: 15 min

---

<img src="assets/Unitag_QRCode_1537289038135.png" class="qr_code">

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
16.3 requis poir .Net Core 3.0

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

## WPF et .Net Core

blabla

+++

## WPF et .Net Core

blabla

+++

## Xamarin

blabla Hot Reload

+++

## Model Builder pour ML.Net

blabla 

+++

## Microsoft Ignite
November 13–14, 2019
https://www.microsoft.com/fr-fr/ignite-the-tour/paris

+++
