# MolecularViewer

一个用于查看分子结构的 SwiftUI 应用程序。

## 项目结构

```
MolecularViewer/
├── BioViewerPackages/
│   ├── PDBParser/
│   │   └── Sources/
│   │       └── PDBParser/
│   │           └── PDBParser.swift
│   ├── XYZParser/
│   │   └── Sources/
│   │       └── XYZParser/
│   │           └── XYZParser.swift
├── MolecularViewerApp/
│   ├── MolecularViewerApp.swift
│   ├── MolecularViewerView.swift
│   ├── MolecularModelView.swift
│   └── MolecularModelManager.swift
├── Resources/
└── Assets/
```

## 目录说明

- `BioViewerPackages/`: 包含分子文件解析器包
  - `PDBParser/`: PDB 文件解析器
  - `XYZParser/`: XYZ 文件解析器
- `MolecularViewerApp/`: 主应用程序代码
  - `MolecularViewerApp.swift`: 应用程序入口
  - `MolecularViewerView.swift`: 主视图
  - `MolecularModelView.swift`: 分子模型视图
  - `MolecularModelManager.swift`: 分子模型管理器
- `Resources/`: 资源文件目录
- `Assets/`: 资源文件目录
