--proyecto A Haskell
    
    -- Separa o obtiene los primeros 3 digitos
    obtenerPeriodo :: Integer -> Integer
    obtenerPeriodo codigo = div codigo 100000
    
    -- Separa o obtiene los 2 digitos siguientes
    obtenerNumeroCategoria :: Integer -> Integer
    obtenerNumeroCategoria codigo = mod (div codigo 1000) 100
    
    -- Separa o obtiene los ultimos 3 digitos
    obtenerConsecutivo :: Integer -> Integernmn
    obtenerConsecutivo codigo = mod codigo 1000
    
    estaEnrango :: Integer -> Integer -> Integer -> Bool
    estaEnrango minimo maximo valor = valor >= minimo && valor <= maximo
    
    periodoValido :: Integer -> Bool
    periodoValido periodo =
        estaEnrango 262 292 periodo &&
        (mod periodo 10 == 1 || mod periodo 10 == 2)
    
    codigoValido :: Integer  ->  Bool
    codigoValido codigo =
        let periodo = obtenerPeriodo codigo
            numeroCategoria = obtenerNumeroCategoria codigo
            consecutivo = obtenerConsecutivo codigo
        in estaEnrango 10000000 99999999 codigo &&
            periodoValido periodo &&
            estaEnrango 1 99 numeroCategoria &&
            estaEnrango 1 999 consecutivo

    divisorPropios :: Integer -> [Integer]
    divisorPropios numero =
        filter (\divisor -> mod numero divisor == 0) [1..numero - 1]
    
    sumaAli :: Integer -> Integer
    sumaAli = sum . divisorPropios
    
    clasificarCategoria :: Integer -> String
    clasificarCategoria numero =
        if sumaAli numero > numero
            then "Administracion"
        else if sumaAli numero == numero
            then "Ingenieria"
        else
            "Humanidades"

    mostrarPeriodo :: Integer -> String
    mostrarPeriodo periodo =
        show (2000 + div periodo 10) ++ "-" ++ show (mod periodo 10)
    
    mostarPar :: Integer -> String
    mostarPar codigo =
        if mod codigo 2 == 0
            then "Par"
        else
            "Impar"

    caracteristicas :: Integer -> String
    caracteristicas codigo =
        if codigoValido codigo 
            then mostrarPeriodo (obtenerPeriodo codigo) ++ " " ++ 
            clasificarCategoria (obtenerNumeroCategoria codigo) ++ " " ++
            "num" ++ show (obtenerConsecutivo codigo) ++ " " ++
            mostarPar codigo
        else
            "Codigo Invalido"
            
    main :: IO ()
    main = do 
        entrada <- getLine
        let codigo = read entrada :: Integer
        putStrLn (caracteristicas codigo)
    