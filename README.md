# W-seminar24_26
## Überblick
Ziel dieser Arbeit ist die Entwicklung und Bewertung eines selbstgebauten Magnetfeldsensors als experimentelle Alternative zu in Smartphones integrierten und externen Magnetfeldsensoren. Dazu werden die Konzeption und Simulation eines Hall-Sensors auf Basis der X-Hall-Architektur vorgestellt. Im Einzelnen wurde mit Hilfe der Finite-Elemente-Methode (FEM) das elektrische Verhalten des Sensors in einer Computersimulation analysiert und die Auswirkungen von Geometrie, Materialwahl und Gestaltung der Kontakte untersucht. Die Simulationsergebnisse zeigen, dass der entworfene Sensor prinzipiell funktionsfähig sein sollte und eine Grundlage fur zukünftige Optimierungen bietet. Neben den technischen Ergebnissen unterstreicht die Arbeit den didaktischen Wert eines eigenständig entwickelten Sensors im schulischen oder experimentellen Kontext, da der Entwicklungsprozess sowohl ein tieferes Verständnis physikalischer Grundlagen als auch Kompetenzen im wissenschaftlichen Arbeiten und in der computergestutzten Modellierung physikalischer Probleme fördert.

Die vollständige Arbeit ist hier:

https://github.com/AkroSkxawng/W-Seminar24_26/blob/dev/seminararbeit/seminararbeit_Endstand.pdf

zu finden.
## Korrekte Verwendung
Jegliche für diese Arbeit verwendeten Quellen, die keine Websites und Links sind finden sich in https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/quellen.

Um mit allen gelisteten Dateien korrekt umgehen zu können, werden folgende Programme in mindestens folgender Version benötigt:

- Gmsh Version 4.13.1
  https://gmsh.info/#Download
  
- ElmerFEM Version 9.0
  https://www.elmerfem.org/blog/binaries/
  
- ParaView Version 6.0.0-RC1
  https://www.paraview.org/download/
  
- TeXStudio Version 4.8.7
  https://www.texstudio.org/#download
  
- MiKTeX Version vom 28.01.2024
  https://miktex.org/download

### Gmsh
In Gmsh werden **.geo** Dateien verarbeitet. Alle Modelle finden sich in https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/3D_Modelle, https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/2D_Beispiel und https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/3D_Beispiel.

### ElmerFEM
ElmerFEM arbeitet jeweils mit vollständigen Projektordnern. Diese sind jeweils in https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/simulationen zu finden und enthalten neben den Modellen und Meshes auch eine **.sif** Datei. Diese ist die Konfiguration der Simulation mit der man diese beeinflussen kann.

### ParaView
Paraview verwendet zwei verschiedene Dateitypen:
- **.vtu** Dateien sind der direkte Output aus ElmerFEM. Diese können direkt im Programm geöffnet und bearbeitet werden
- **.pvsm** Dateien speichern aktuelle Stände auch von bereits in ParaView bearbeiteten Daten. Man kann sie über **Datei -> Zustand laden** öffnen.
Die zugehörigen Dateien sind ebenfalls in https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/simulationen zu finden.

### TeXStudio
TeXStudio hat ebenso wie Elmer komplette Projektordner. Diese sind in https://github.com/AkroSkxawng/W-Seminar24_26/tree/dev/seminararbeit zu finden. Geöffnet werden die Projekte immer über die **.tex** Datei, die restlichen Dateien sind für das Programm automatisch generierte Informationen. Alle Bildquellen und optimalerweise auch jegliche anderen zu verarbeitenden Daten und Dateien, die in das Projekt integriert werden sollen, finden sich jeweils in den **Projekt/Image Sources** Ordnern.

Bei MiKTeX handelt es sich bloß um die TeX-Distribution, die zur Funktion von TeXStudio benötigt wird.







