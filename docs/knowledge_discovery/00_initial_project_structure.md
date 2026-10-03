# Docs 00 - Initial Project Structure

## 1. Overview
- The project repository is designed with research in mind.
- The repository is organized in such a way that later we can separate: code, experiments, data, documentation, results and paper materials.
- The result must be reproducible.

## 2. Project Repository
```
persistent-spatial-memory/
├── configs/
├── data/
├── docs/
├── experiments/
├── logs/
├── luanti/
├── paper/
├── scripts/
├── src/
└── tests/
```

## 3. Current Decision
- The repository is initially created using a series of `mkdir` and `touch` commands.
- A file `empty` is created in each directory so that the directory is not empty when pushed to GitHub.
- A GitHub repository is created and the initial structure is pushed.
```
https://github.com/aveeyan/persistent-spatial-memory
```

## 4. Outcomes
- The repository is initialized with a clear structure.
```

~/Projects/persistent-spatial-memory main*
❯ tree
.
├── configs
│   ├── agents
│   │   └── empty
│   ├── empty
│   ├── environments
│   │   └── empty
│   └── experiments
│       └── empty
├── data
│   ├── empty
│   ├── processed
│   │   └── empty
│   └── raw
│       └── empty
├── docs
│   ├── decisions.md
│   ├── experiment_plan.md
│   ├── knowledge_discovery
│   │   ├── 00_initial_project_structure.md
│   │   ├── 01_luanti_connection_plan.md
│   │   ├── 02_mintest_mod_init.md
│   │   ├── 03_luanti_api.md
│   │   └── 04_luanti_pos_and_obs.md
│   ├── literature_review.md
│   └── research_question.md
├── experiments
│   ├── empty
│   ├── plots
│   │   └── empty
│   ├── results
│   │   └── empty
│   └── runs
│       └── empty
├── LICENSE
├── logs
│   └── empty
├── luanti
│   ├── empty
│   ├── mods
│   │   └── spatial_memory
│   │       ├── init.lua
│   │       └── mod.conf
│   └── worlds
│       └── empty
├── paper
│   ├── empty
│   ├── figures
│   │   └── empty
│   └── tables
│       └── empty
├── pyproject.toml
├── README.md
├── requirements.txt
├── scripts
│   └── empty
├── src
│   ├── agent
│   │   └── empty
│   ├── empty
│   ├── environment
│   │   └── empty
│   ├── memory
│   │   └── empty
│   ├── metrics
│   │   └── empty
│   ├── navigation
│   │   └── empty
│   └── observation
│       └── empty
└── tests
    ├── empty
    ├── integration
    │   └── empty
    └── unit
        └── empty

33 directories, 43 files
```

- Someone should eventually be able to look at the repository and understand:

What did you do?
What experiment did you run?
What data did you collect?
What result did you get?
