function [mfss, fHz] = calcular_espectro(senal, fs, Nfft)

    % Funcion para el calculo y representación del espectro
    %   ver_espectro(senal,ventana,Nfft,fs)
    % Parametros de entrada:
    %   senal = senal de la cual queremos ver el espectro
    %   Nfft = Numero de puntos de la fft, define tambien la longitud de la
    %   ventana
    %   fs = frecuencia de muestreo a utilizar para la representación
    % Parametros de salida:
    %   mfss = valores de la DFT de la señal.
    %   fHz = valores de las frecuencias asociadas a los valores de la DFT.

    Nsenal = length(senal); %Total de muestras de la señal
    fss = [];

    window = rectwin(Nfft);

    window = window / sum(window); %Normalización para que W(f=0)=1

    %reordenamos el vector de datos en una matriz de
    columnas = ceil(Nsenal / Nfft);
    totals = columnas * Nfft;

    if totals > Nsenal
        s0 = [senal; zeros(totals - Nsenal, 1)];
    else
        s0 = senal;
    end

    ss = reshape(s0, Nfft, columnas);

    %enventanamos y calculamos la fft de cada columna de la matriz de datos
    for indc = 1:columnas
        wseg1 = ss(:, indc) .* window;
        fss = [fss abs(fft(wseg1, Nfft))]; %normalizada la amplitud de la fft??
    end

    %nos quedamos con las frecuencias entre 0 y pi
    nfss = fss(1:Nfft / 2 + 1, :);

    %calculamos la media
    mfss = mean(nfss, 2);
    fHz = 0:fs / Nfft:fs / 2;

end
