function [] = afinador_simple(x, fs)

    % Funcion para mostrar por pantalla la nota musical introducida como señal
    %   Afinador_simple(señal a analizar, frecuencia de muestreo)
    % Parametros de entrada:
    %   x = señal a analizar(muestreada).
    %   fs = frecuencia de muestreo.

    [mfss, fHz] = calcular_espectro(x, fs, 5000); % Cálculo del espectro mediante la DFT.
    amplitud = findpeaks(mfss); % Obtención de los picos (Todos).
    umbral = rms(amplitud); % Obtencion del umbral usando la media cudratica de la amplitud.
    amplitud = findpeaks(mfss, fs, 'Threshold', umbral); % Obtenemos los picos que nos interesan.
    valor = find(mfss == amplitud(1, 1));

    c = 9; % Margen de error razonable.
    do = 261; % Frecuencia de la nota do.
    re = 293; % Frecuencia de la nota re.
    mi = 329; % Frecuencia de la nota mi.
    fa = 349; % Frecuencia de la nota fa.
    sol = 392; % Frecuencia de la nota sol.
    la = 440; % Frecuencia de la nota la.
    si = 493; % Frecuancia de la nota si.

    indice = fHz(1, valor);

    %   Secuencia de ifs que comparan los valores ( con un margen de error de
    %   c) y muestra por pantalla la nota o un mensaje indicando que la nota no esta en la base de datos.

    if (((abs(indice - do)) < c) || (abs((do - indice)) < c))
        fprintf("Nota introducida: DO\n");
    elseif (((abs(indice - re)) < c) || ((abs(re - indice)) < c))
        fprintf("\nNota introducida: RE\n");
    elseif (((abs(indice - mi)) < c) || ((abs(mi - indice)) < c))
        fprintf("\nNota introducida: MI\n");
    elseif (((abs(indice - fa)) < c) || ((abs(fa - indice)) < c))
        fprintf("\nNota introducida: FA\n");
    elseif (((abs(indice - sol)) < c) || ((abs(sol - indice)) < c))
        fprintf("\nNota introducida: SOL\n");
    elseif (((abs(indice - la)) < c) || ((abs(la - indice)) < c))
        fprintf("\nNota introducida: LA\n");
    elseif (((abs(indice - si)) < c) || ((abs(si - indice)) < c))
        fprintf("\nNota introducida: SI\n");

    else
        fprintf("\nLa nota introducida no esta en la base de datos\n");

    end

end
