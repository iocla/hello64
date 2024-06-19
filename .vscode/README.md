
### Configurare vscode cu gdb

#### Configurare

1. extensii de instalat: Makefile tools (by Microsoft), x86 and x86_64 Assembly(by 13xforever), GDB Debug (by DamianKoper)
2. Terminal/Configure Default Build Task - se editează .vscode/tasks.json, la commandă se trece make all
``` json
     "command": "make",
			"args": [
				"all",
				""
			],
			"options": {
				"cwd": "${fileDirname}"
			},
			"group": {
				"kind": "build",
				"isDefault": true
			},
``` 
3. la tastele Ctrl-Shift-B se lansează comanda make all, îar în terminal se poate da Ctrl-Click pe numele fișierului cu eroare

4. Fie se tastează F5 pentru a demara debug, fie se editează direct .vscode/launch.json; trebuie să conțină
```json
      "stopAtEntry": true,
      "cwd": "/tmp/01-hello-world",
      "program": "/tmp/01-hello-world/hello",
      "miDebuggerPath": "gdb",
      "args": ["<", "1.in"], //Dacă la debug vrem stdin dintr-un fișier 1.in  
``` 
> [!NOTE]  
> Atenție la fișierul ~/.gdbinit, să nu conțină comenzi care să interfereze cu vscode 

5. la comanda F5, debuggerul trebuie să pornească și să se oprească pe prima instrucțiune; cu Ctrl-Shift-D activăm fereastra de debug
6. dacă avem module C, în acele module la buton dreapta apare opțiunea 'Disasembly window'

#### Operare
- Se pot pune breakpointuri cu click dreapta în coloana din stânga numărului de line
- în debug window (Ctrl-Shift-D), se recomandă activarea VAriables, Watch, și Call Stack
- Variables/Locals - apar variabilele din funcțiile C
- Variables/Rergisters/CPU - registrele pe 32 biți
- Watch/+ se adaugă `print $eflags pentru a vedea flagurile actualizate
- În modul debug, cu click dreapta în sursă, se poate deschide 'Open disassembly view'
- În disasembly mode se pot pune breakpointuri în coloana din stânga adreselor; F10, F11 și Shift-F11 merg
- În fereastra Terminal apar stdio+stdin ale progamului
- În fereastra Debug Console apare promptul gdb; toate comenzile trebuie precedate de backquote '`'

#### Hot Keys
- Ctrl-Shift-D debug window
- F5 start debugging, și continuă
- F10 step over - execută toată funcția
- F11 step into - intră în funcții
- Shift-F11 step out - iese din apelul curent
