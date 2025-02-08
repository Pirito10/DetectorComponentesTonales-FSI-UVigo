# Detector de Componentes Tonales
*Detector de Componentes Tonales* is an **Audio Analysis Tool** developed as part of the course "[Fundamentos de Sonido e Imagen](https://secretaria.uvigo.gal/docnet-nuevo/guia_docent/?centre=305&ensenyament=V05G301V01&assignatura=V05G301V01209&any_academic=2021_22)" in the Telecommunications Engineering Degree at the Universidad de Vigo (2021 - 2022).

## About The Project
This project implements a MATLAB-based system for detecting tonal components in an audio signal by analyzing it, identifying frequency peaks, and determining whether the signal contains significant tonal components.

The project features:
- Detection of tonal components in an audio signal.
- Frequency spectrum analysis using DFT.
- Peak detection to identify dominant frequency components.
- Optional tuner mode for analyzing single musical notes.
- Graphical visualization of the signal waveform, frequency spectrum, and spectrogram.

## How To Run
### Requirements
Make sure you have [MATLAB](https://www.mathworks.com/products/matlab.html) installed on your system.

### Usage
1. Open MATLAB.
2. Navigate to the project's directory.
3. Run the following function:
```matlab
deteccion_tonos(<file>, <mode>);
```
| Option | Description |
|--------|-------------|
| `file` | Specifies the file to analyze |
| `mode` | Enables (`1`) or disables (`0`) the tuner |

#### Example
```matlab
deteccion_tonos(sounds/tonal/dial.wav, 0);
```

## About The Code
Refer to [`Especificaciones.pdf`](docs/Memoria.pdf) and [`Memoria.pdf`](docs/Memoria.pdf) for an in-depth explanation of the project, how to run it, how the system and algorithm works, results and performace, and more.
