# Gestionnaire de Contacts

Application Flutter moderne de gestion de contacts avec architecture MVVM.

## Fonctionnalités

- Liste de contacts temps réel (API RandomUser)
- Défilement infini optimisé avec préchargement
- Animations et transitions fluides
- Design moderne Material Design
- Recherche de contacts réactive

## Captures d'écran

![Capture d’écran 2025-01-06 à 19 33 39](https://github.com/user-attachments/assets/c47a4dcd-6a84-44f3-95d4-ef90a0de7c91)
![Capture d’écran 2025-01-06 à 19 33 32](https://github.com/user-attachments/assets/df485812-0529-4a63-9caa-31000a61a810)


## Architecture

Structure MVVM :
```
lib/
  ├── core/
  │   ├── constants/      # Constantes et configuration
  │   └── services/       # Services (HTTP, etc.)
  ├── models/            # Modèles de données
  ├── viewmodels/        # Logique métier
  ├── views/
  │   ├── contacts/      # Écrans principaux
  │   └── widgets/       # Composants réutilisables
  └── repositories/      # Couche d'accès aux données
```

## Dépendances

```yaml
dependencies:
  provider: ^6.1.1  # Gestion d'état
  http: ^1.1.2      # Requêtes HTTP
```

## Installation

1. Cloner le dépôt
```bash
git clone https://github.com/votrenom/contact_manager.git
```

2. Installer les dépendances
```bash
flutter pub get
```

3. Lancer l'application
```bash
flutter run
```

## Configuration Android

Ajouter dans AndroidManifest.xml :
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```

## Aspects Techniques

- Chargement initial avec appels API parallèles
- Défilement optimisé avec seuil à 80%
- Animations Hero pour les photos de profil
- Transitions de page personnalisées
- Gestion des erreurs et états de chargement

## Inspirations pour le design

![71824062ede8ff0098896e2909edda2e](https://github.com/user-attachments/assets/1fe5f138-77f6-40fd-857f-2d89af77446d)

https://dribbble.com/shots/5676730-Team-Section-Qonto/attachments


[Ajoutez vos informations de licence ici]
