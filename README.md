# 🏆 Competitive Programming

<p align="center">
  <img src="https://img.shields.io/badge/C%2B%2B-17-00599C?style=flat&logo=c%2B%2B">
  <img src="https://img.shields.io/badge/C-11-A8B9CC?style=flat&logo=c">
  <img src="https://img.shields.io/badge/CMake-3.10-064F8C?style=flat&logo=cmake">
  <img src="https://img.shields.io/badge/CLion-ready-21D789?style=flat&logo=clion">
  <img src="https://img.shields.io/badge/Codeforces-1F1F1F?style=flat&logo=codeforces">
  <img src="https://img.shields.io/badge/License-MIT-green">
</p>

<p align="center">
  <b>⚡ Crée → Teste → Soumets — le tout depuis CLion, en 1 clic</b><br>
  Environnement de compétition complet pour <b>Codeforces</b>, <b>AtCoder</b>, et toutes les plateformes de programmation compétitive.
</p>

---

## 📦 Quick Start

```bash
make new    LANG=cpp NAME=2050A              # Créer un nouveau problème
make run    LANG=cpp NAME=2050A              # Compiler + exécuter
make test   LANG=cpp NAME=2050A              # Vérifier le résultat
make submit LANG=cpp NAME=2050A CONTEST=2050 # ✅ Soumettre en 1 clic
```

> **Pas de make ?** Utilise directement les scripts : `./scripts/new.sh cpp 2050A`

---

## 📁 Structure du projet

```
📂 Competitive_Programming/
├── 📂 cpp/                    # Solutions C++17
│   └── 📂 2050A/              # Un problème = un dossier
│       ├── 📄 main.cpp        #    Solution
│       ├── 📄 Input.txt       #    Entrée de test
│       ├── 📄 Output.txt      #    Sortie générée
│       ├── 📄 Expected.txt    #    Sortie attendue
│       ├── 📄 Error.txt       #    Erreurs / debug
│       └── 📄 CMakeLists.txt  #    Build config
├── 📂 c/                      # Solutions C11
│   └── 📂 486A/
│       └── ...
├── 📂 templates/              # Templates prêts à l'emploi
│   ├── 📄 template.cpp
│   └── 📄 template.c
├── 📂 scripts/                # 🚀 Automatisation tout-en-un
│   ├── 📄 new.sh              #    Créer un problème
│   ├── 📄 run.sh              #    Compiler + exécuter
│   ├── 📄 debug.sh            #    Debug avec sanitizers
│   ├── 📄 test.sh             #    Comparer Output vs Expected
│   ├── 📄 stress.sh           #    Stress testing
│   ├── 📄 submit.sh           #    ✅ Soumettre (nouveau !)
│   └── 📄 cf_submit.py        #    Script de soumission
├── 📄 CMakeLists.txt          # CMake racine
├── 📄 Makefile                # Raccourcis make
├── 📄 .clang-format           # Style Google (indent 4)
└── 📄 README.md               # Ce fichier
```

---

## 🚀 Workflow complet

### ➕ Créer un problème

```bash
make new LANG=cpp NAME=2050A   # C++ → crée cpp/2050A/
make new LANG=c   NAME=4A      # C   → crée c/4A/
```

Le script copie le template (`template.cpp` ou `template.c`), génère le `CMakeLists.txt`, et crée les fichiers I/O vides.

### ▶️ Compiler & Exécuter

```bash
make run LANG=cpp NAME=2050A
```

| Action | Résultat |
|---|---|
| Compilation | `g++ -std=c++17 -O2 ...` |
| Exécution | Lit `Input.txt`, écrit dans `Output.txt` et `Error.txt` |
| Mesure | Temps d'exécution affiché en ms |

### 🐛 Debug

```bash
make debug LANG=cpp NAME=2050A
```

Compile avec **AddressSanitizer** + **UndefinedBehaviorSanitizer** + drapeau `-DDEBUG` pour les macros `dbg()` et `check()`.

### ✔️ Tester

```bash
make test LANG=cpp NAME=2050A
```

Compare `Output.txt` vs `Expected.txt` avec `diff --color`. Parfait pour vérifier ta solution avant de soumettre.

### 🔄 Stress Test

Place `gen.cpp` (générateur) et `brute.cpp` (force brute) dans le dossier du problème, puis :

```bash
make stress LANG=cpp NAME=2050A ITER=1000   # 1000 tests aléatoires
```

Compare ta solution optimisée (`main`) contre la brute force à chaque itération.

### 📤 Soumettre (1 clic)

```bash
make submit LANG=cpp NAME=2050A CONTEST=2050
```

Le script :
1. **Copie** `main.cpp` dans le presse-papier
2. **Ouvre** Chrome sur la page de soumission Codeforces
3. Tu n'as plus qu'à faire **Ctrl+V** et cliquer **Submit** ✅

> **Astuce :** Pour que la copie automatique marche, installe `xclip` :
> ```bash
> sudo apt install xclip
> ```

---



## 🔧 Configuration CLion

1. **Ouvrir le projet** : `File → Open → Competitive_Programming/`
2. **Ajouter un profil CMake Debug-Sanitizers** : `Settings → Build → CMake` :
   - Name : `Debug-Sanitizers`
   - Build type : `Debug`
   - CMake options : `-DENABLE_DEBUG=ON -DENABLE_SANITIZERS=ON`
3. **Working directory** : Dans chaque Run Configuration, mettre le working directory sur le dossier du problème (ex: `cpp/2050A/`)
4. **Recharger CMake** après avoir créé un nouveau problème avec `new.sh`

---

## 🛠 Scripts disponibles

| Commande make | Script équivalent | Description |
|---|---|---|
| `make new LANG=cpp NAME=X` | `./scripts/new.sh cpp X` | Créer un problème |
| `make run LANG=cpp NAME=X` | `./scripts/run.sh cpp X` | Compiler + exécuter |
| `make debug LANG=cpp NAME=X` | `./scripts/debug.sh cpp X` | Debug + sanitizers |
| `make test LANG=cpp NAME=X` | `./scripts/test.sh cpp X` | Tester Output vs Expected |
| `make stress LANG=cpp NAME=X ITER=N` | `./scripts/stress.sh cpp X N` | Stress test |
| `make submit LANG=cpp NAME=X CONTEST=C` | `./scripts/submit.sh cpp X C` | ✅ Soumettre |
| `make clean LANG=cpp NAME=X` | — | Nettoyer les builds |

---

## 📜 Détails techniques

| Info | Valeur |
|---|---|
| Standard C++ | **C++17** |
| Standard C | **C11** |
| Build system | **CMake ≥ 3.10** + **Make** |
| Compiler warnings | `-Wall -Wextra -Wshadow` |
| Sanitizers | AddressSanitizer + UBSan |
| Formatage | **Google style**, indent 4 espaces, 120 colonnes |
| Soumission | via navigateur (contourne Cloudflare) |

Les `freopen` dans `main()` sont automatiquement ignorés par Codeforces grâce à `#ifndef ONLINE_JUDGE`.

---

## 🤝 Contribution

Les problèmes et suggestions sont les bienvenus !  
Ouvre une **issue** ou soumets une **pull request**.

## 📜 Licence

Distribué sous licence **MIT**. Voir le fichier [`LICENSE`](LICENSE) pour plus d'informations.

---

<p align="center">
  <b>Happy Coding !</b> 🚀
</p>
