// Learn more about F# at http://fsharp.org

open System

[<EntryPoint>]
let main argv =
    let mutable result = 0;
    let mutable resultSolutions = 0;
    
    let russkoyeRadioVseBudetHorosho =
        for p in 2 .. 2 .. 1000 do
               let mutable numberOfSolutions = 0;
               for a in 2 .. 1 .. ((p/3)-1) do
                   if(p*(p-2*a) % (2*(p-a)) = 0) then 
                       numberOfSolutions <- numberOfSolutions + 1; 
                   if(numberOfSolutions > resultSolutions) then
                       resultSolutions <- numberOfSolutions;
                       result <- p;
    
    //let b = System.Convert.ToInt32(System.Console.ReadLine())
    let rec fiboRec n =
      match n with
      | 0 -> 0
      | 1 -> 1
      | n -> fiboRec (n-1) + fiboRec (n-2)


    printfn "%d" (fiboRec 3)
    russkoyeRadioVseBudetHorosho
    printfn "Ответ: p = %d" result
    let z = System.Console.ReadKey()
    0 // return an integer exit code
