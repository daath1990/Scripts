#!/usr/bin/python3

import os
import subprocess
import multiprocessing

ruta_de_documentos = os.getcwd() 
rutes_de_makefile = str(subprocess.check_output(['find',ruta_de_documentos,'-type','d'])).rsplit('\\n')
pid = os.getpid()
numFork = 0

def compiling(ruta):
    os.chdir(str(ruta))
    print (str(os.getcwd())+": ")
    if os.path.exists('Makefile')==True:
        print("Limpiando")
        os.system("make distclean")            
    print("Precompilando")
    os.system("qmake")
    print("Compilando")
    os.system("make")

for ruta in rutes_de_makefile:
    print (str(ruta))
    if ruta != rutes_de_makefile[0] and ruta != rutes_de_makefile[-1]:
        if pid == 0: 
            compiling(ruta)
            quit()
        else:
            print("Soy el padre y genero hijos para que compile programas")
            pid = os.fork()
            numFork += 1
            if pid != 0 and numFork > (multiprocessing.cpu_count()*2):
                os.waitpid(pid,0)
                numFork = 0
