# 🔧 SimpleOS

Un sistema operativo minimalista creado desde cero utilizando ensamblador (NASM) y lenguaje C.  
Este proyecto tiene como objetivo **entender cómo funciona un sistema operativo a bajo nivel**, desde el bootloader hasta la ejecución de código en modo real y protegido.

---

## 📁 Estructura del proyecto

SO/
  ├── bootloader/ # Bootloader en ensamblador NASM (512 bytes)
    └── bootloader.asm 
  ├── kernel/ # Código del kernel en lenguaje C │ 
    └── kernel.c 
  ├── linker/ # Script de linker para posicionar el kernel en memoria │ 
    └── linker.ld 
  ├── Makefile # Script de compilación y ejecución 
  ├── README.md


---

## 🚀 ¿Qué hace?

Actualmente, el sistema operativo:

- Muestra el mensaje `"BOOT OK"` desde el bootloader
- Intenta cargar un kernel en C que imprime `"Hello from kernel!"` en la memoria de video VGA (`0xB8000`)

---

## 🔧 Cómo compilar y correr

### Requisitos:

- `nasm`
- `i686-linux-gnu-gcc` y `i686-linux-gnu-ld` (o `gcc -m32`)
- `qemu-system-i386` o `qemu-system-x86_64`

### Comandos:

```bash
make           # Compila todo
make run       # Ejecuta en QEMU
make clean     # Elimina archivos binarios
