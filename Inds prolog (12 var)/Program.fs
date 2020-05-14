// Learn more about F# at http://fsharp.org

open System

[<EntryPoint>]
let main argv =
    let mutable result = 0;
    let mutable resultSolutions = 0;

 

   // let rec loop1000 curr =
   //     if curr <= 1000 then
   //         let mutable numberOfSolutions = 0;
   //         for a in 2 .. 1 .. ((curr/3)-1) do
   //             if(curr*(curr-2*a) % (2*(curr-a)) = 0) then 
    //                numberOfSolutions <- numberOfSolutions + 1; 
   //             if(numberOfSolutions > resultSolutions) then
    //                resultSolutions <- numberOfSolutions;
    //                result <- curr;
    //        loop1000 (curr + 2)


    let rec loopP curr a numberOfSolutions =
        if a <= ((curr/3)-1) then
            if(curr*(curr-2*a) % (2*(curr-a)) = 0 && numberOfSolutions > resultSolutions) then 
                resultSolutions <- numberOfSolutions+1;
                result <- curr;
                loopP curr (a+1) (numberOfSolutions+1)
            if(numberOfSolutions > resultSolutions) then
                resultSolutions <- numberOfSolutions;
                result <- curr;
                loopP curr (a+1) numberOfSolutions
            if(curr*(curr-2*a) % (2*(curr-a)) = 0) then 
                loopP curr (a+1) (numberOfSolutions+1)
            loopP curr (a+1) numberOfSolutions


    let rec loop1000 curr =
        if curr <= 1000 then
            loopP curr 2 0
            loop1000 (curr + 2)


            
    
    let russkoyeRadioVseBudetHorosho =
        loop1000 2
    
    //let b = System.Convert.ToInt32(System.Console.ReadLine())
    let rec fiboRec n =
      match n with
      | 0 -> 0
      | 1 -> 1
      | n -> fiboRec (n-1) + fiboRec (n-2)


    //printfn "%d" (fiboRec 3)
    russkoyeRadioVseBudetHorosho
    printfn "Ответ: p = %d" result
    let z = System.Console.ReadKey()
    0 // return an integer exit code
