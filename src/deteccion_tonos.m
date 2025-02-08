function salida = deteccion_tonos(archivo, modo)

    % Funcion para detectar si una funcion tiene componentes tonales o no.

    % salida = deteccion_tonos(archivo)

    % Parámetros de entrada:
    %   archivo: nombre del archivo de audio a analizar.
    %   modo: entero, 1 para activar el afinador(analisis de una nota), 0 para
    %   el analisis de una señal.
    % Parámetros de salida:
    %   salida: "Verdadero" en caso de que la señal contenga componentes.
    %   tonales, "Falso" en caso contrario.

    [audio, fs] = audioread(archivo); % Leemos la señal de audio.

    x = sum(audio, 2) / size(audio, 2); % Pasamos la señal a mono.

    N = length(x); % Longitud de la señal.
    t = 0:1 / fs:(N - 1) / fs; % Eje temporal.

    [mfss, fHz] = calcular_espectro(x, fs, 1100); % Cálculo del espectro mediante la DFT.

    amplitud = findpeaks(mfss); % Obtención de los picos(todos).
    umbral = rms(amplitud); % Obtencion del umbral usando la media cudratica de la amplitud.
    amplitud = findpeaks(mfss, fs, 'Threshold', umbral); % Obtenemos los picos que nos interesan.

    [mx] = max(mfss); % Obtención del máximo de amplitud.

    if (isempty(amplitud)) % Comprobamos si hay componentes tonales
        fprintf('\nComponentes tonales: falso\n')
        salida = 'Falso';
    else
        fprintf('Amplitud: %d dB\n', 20 * log10(mx))
        fprintf('Componentes tonales: verdadero\n')
        salida = 'Verdadero';
    end

    % Segun el modo introducido usamos un if para decidir si utilizamos o no el
    % afinador.

    if (modo == 1)
        afinador_simple(x, fs);
    end

    % Gráficas:

    figure(1)
    subplot(211), plot(t, x), xlabel('t (s)'), ylabel('amplitud'), axis tight;
    subplot(212), plot(fHz, 20 * log10(mfss)), xlabel('f (Hz)'), ylabel('Magnitud (dB)'), axis([0 fs / 2 -60 10]);
    grid;

    %Espectrograma:

    figure(2)
    window = hamming(2048);
    overlap = 0;
    NFFT = 2048;
    spectrogram(x, window, overlap, NFFT, fs, 'yaxis');
end
