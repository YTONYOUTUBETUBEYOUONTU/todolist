# 📝 TodoList Project - Haskell & Python

## 🌎 English

### 🚀 Installation

1️⃣ **Download & Install Haskell (GHCup):**

Run the following command in **PowerShell** (as Administrator):

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { & ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -Interactive -DisableCurl } catch { Write-Error $_ }
```

📌 **Install it in `C:/` for better compatibility.**

2️⃣ **Configure PostgreSQL in the system PATH:**

Ensure PostgreSQL libraries are accessible by adding them to the system's environment variables.

### 🛠 Running the Project

#### 🎯 Running the Haskell Backend

```sh
stack build
stack exec -- todolist-haskell-exe
```

#### 🐍 Running the Python Script

1️⃣ Install dependencies:

```sh
pip install -r requirements.txt
```

2️⃣ Run the script:

```sh
python list_tasks.py
```

### 🎉 Enjoy!
Your TodoList system should now be fully functional. ✅

---

## 🇪🇸 Español

### 🚀 Instalación

1️⃣ **Descargar e instalar Haskell (GHCup):**

Ejecuta el siguiente comando en **PowerShell** (como Administrador):

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { & ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -Interactive -DisableCurl } catch { Write-Error $_ }
```

📌 **Instalarlo en `C:/` para mejor compatibilidad.**

2️⃣ **Configurar PostgreSQL en el PATH:**

Asegúrate de que las librerías de PostgreSQL sean accesibles agregándolas a las variables de entorno del sistema.

### 🛠 Ejecutar el Proyecto

#### 🎯 Ejecutar el Backend en Haskell

```sh
stack build
stack exec -- todolist-haskell-exe
```

#### 🐍 Ejecutar el Script en Python

1️⃣ Instalar dependencias:

```sh
pip install -r requirements.txt
```

2️⃣ Ejecutar el script:

```sh
python list_tasks.py
```

### 🎉 ¡Disfruta!
Tu sistema TodoList ahora debería estar funcionando completamente. ✅