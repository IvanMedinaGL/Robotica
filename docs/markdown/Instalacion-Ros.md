<- Para instalar Ubuntu, regresa a la [Instalación de Ubuntu](Instalacion-Ubuntu-WSL.md).
- [Instalación de ROS y Gazebo](#instalación-de-ros-y-gazebo)
  - [Actualiza los paquetes actuales](#actualiza-los-paquetes-actuales)
  - [Habilita los repositorios requeridos](#habilita-los-repositorios-requeridos)
  - [Instala ROS 2 y Gazebo](#instala-ros-2-y-gazebo)
  - [Configura el entorno de ROS 2](#configura-el-entorno-de-ros-2)
  - [Terminado](#terminado)

# Instalación de ROS y Gazebo
Para configurar ROS, puedes seguir los pasos que aparecen en la [página ofical de ROS](https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html), pero aquí lo explicaré para los fines de la clase. Recuerda observar bien si aparece un error.

## Actualiza los paquetes actuales

1. Busca paquetes nuevos. El comando `sudo` significa *super user do*, lo que le da permisos de super usuario para realizar acciones que pueden comprometer al equipo, por lo que no uses ese comando descuidadamente. Te pedirá la contraseña la primera vez que ejecutes `sudo` en terminal, así que cuano copies muchas lineas, tómalo en cuenta o saldrán varios errores.

    ```bash
    sudo apt update
    ```
2. Actualiza los paquetes (puede tardar varios minutos)
   
    ```bash
    sudo apt upgrade
    ```
## Habilita los repositorios requeridos

1. Habilita el repositorio de Ubuntu Universe, que permite instalar paquetes open source

    ```bash
    sudo apt install software-properties-common
    sudo add-apt-repository universe
    ```
Presiona la tecla ``Intro`` o ``Enter``.

2. Ahora añade la clave GPG de ROS 2 y Gazebo con apt.
    ```bash
    sudo apt update && sudo apt install curl -y
    sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
    sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
    ```
3. A continuación, añade los repositorios a tu lista de fuentes.
    ```bash
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
    ```
## Instala ROS 2 y Gazebo
El paquete completo de ROS 2 (Jazzy Jalisco), Gazebo (Ionic) y las herramientas de desarrollo tardarán bastante en instalarse, así que hazlo en un lugar donde tengas tiempo y buen internet.
```bash
sudo apt update && sudo apt install ros-dev-tools python3-colcon-common-extensions gedit ros-jazzy-desktop lsb-release gnupg ros-jazzy-ros-gz
```
## Configura el entorno de ROS 2
Normalmente se tiene que escribir `source /opt/ros/jazzy/setup.bash` cada vez que se quiera configirar el entorno de ROS, pero puedes añadir lo siguiente para que siempre se inicie.
```bash
echo "alias sb='source ~/.bashrc'" >> ~/.bashrc
echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc
echo "export LIBGL_ALWAYS_SOFTWARE=1" >> ~/.bashrc
echo "export LIBGL_ALWAYS_INDIRECT=0" >> ~/.bashrc
source ~/.bashrc
```
Si escribes `sb`, se actualizará la terminal, por lo que se recomienda usarlo si se cambia el archivo `.bashrc`, que es la configuración de la terminal.
## Terminado
Para probar que se instalaron los paquetes, ejecuta 
```bash
gz sim
```
Y debe abrirse la interfaz de gazebo
