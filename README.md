# 🏆 Competitive Programming

Environnement de compétition configuré pour **CLion** avec support **C** et **C++**.

## 📁 Structure

```
Competitive_Programming/
├── cpp/                    # Solutions C++
│   └── <problem>/
│       ├── main.cpp        # Solution
│       ├── Input.txt       # Entrée test
│       ├── Output.txt      # Sortie programme
│       ├── Expected.txt    # Sortie attendue
│       ├── Error.txt       # Stderr / debug
│       └── CMakeLists.txt
├── c/                      # Solutions C
│   └── <problem>/
│       ├── main.c
│       ├── Input.txt
│       ├── Output.txt
│       ├── Expected.txt
│       ├── Error.txt
│       └── CMakeLists.txt
├── templates/              # Templates pro
│   ├── template.cpp
│   └── template.c
├── scripts/                # Scripts d'automatisation
│   ├── new.sh              # Créer un problème
│   ├── run.sh              # Compiler + exécuter
│   ├── debug.sh            # Debug + sanitizers
│   ├── test.sh             # Comparer output/expected
│   └── stress.sh           # Stress test
├── CMakeLists.txt          # CMake racine (CLion)
├── Makefile                # Alternative make
└── .clang-format           # Formatage code
```

## 🚀 Workflow

### Nouveau problème
```bash
./scripts/new.sh cpp 2050A    # Crée cpp/2050A/
./scripts/new.sh c   2050A    # Crée c/2050A/
# Ou:
make new LANG=cpp NAME=2050A
```

### Compiler & Exécuter
```bash
./scripts/run.sh cpp 2050A
# Ou:
make run LANG=cpp NAME=2050A
```

### Debug avec Sanitizers
```bash
./scripts/debug.sh cpp 2050A
# Ou:
make debug LANG=cpp NAME=2050A
```

### Tester (comparer Output vs Expected)
```bash
./scripts/test.sh cpp 2050A
make test LANG=cpp NAME=2050A
```

### Stress Test
1. Créer `gen.cpp` (générateur) et `brute.cpp` (brute force) dans le dossier du problème
2. ```bash
   ./scripts/stress.sh cpp 2050A 1000
   make stress LANG=cpp NAME=2050A ITER=1000
   ```

## 🔧 CLion

1. **Ouvrir** : `File → Open → Competitive_Programming/`
2. **CMake Profile Debug** : Settings → Build → CMake → ajouter profil :
   - Name: `Debug-Sanitizers`
   - Build type: `Debug`
   - CMake options: `-DENABLE_DEBUG=ON -DENABLE_SANITIZERS=ON`
3. **Working Directory** : Pour chaque Run Config, mettre le working directory sur le dossier du problème (ex: `cpp/2050A/`)
4. **Recharger CMake** : après `new.sh`, cliquer sur "Reload CMake Project" dans CLion

## 📋 Soumettre sur Codeforces

Copier le contenu de `main.cpp` → Ctrl+C → Ctrl+V sur Codeforces.
Les `freopen` sont ignorés automatiquement grâce à `#ifndef ONLINE_JUDGE`.
