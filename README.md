# Redes 2

Material de la cursada de Redes y Comunicación de Datos 2 (Ingeniería en Informática, FICH–UNL).

```
Teoria/       apuntes y material de cátedra, por unidad
Practicas/    guías prácticas, ejercicios de enrutamiento y el lab de Docker que las acompaña
Proyectos/    trabajos expositivos más grandes, con su propio README
```

## Temario

Continuación de Redes 1, subiendo por la pila de protocolos:

1. **Arquitectura de la capa de Red** — el protocolo IP (estructura del datagrama), direcciones IP y subnetting, enrutamiento interdominios sin clases (CIDR), algoritmos de enrutamiento y control de congestión, protocolos de control de Internet, BGP.
2. **La capa de Transporte.**
3. **Redes Públicas.**
4. **La capa de Aplicación.**
5. **Seguridad en las redes** — ver [`Proyectos/SSH`](Proyectos/SSH).

## Teoria/

- **Unidad1/** — la capa de red en Internet: cabecera IPv4, direccionamiento IP.
- Apuntes sueltos de la capa de Red (IP, CIDR, enrutamiento) y una presentación sobre BGP.

> Quedan dos PDFs de bibliografía en la raíz del repo (`CapaDeRed.pdf`, `LibroReferencia.pdf` — este último es el libro de Tanenbaum). Convendría moverlos a `Teoria/` para no romper la convención; no los toqué porque no sé si preferís mantenerlos donde están.

## Practicas/

- Prácticas 1 a 3: modelo de capas, enrutamiento y su continuación.
- `ejer10AyB.pkt` — ejercicio de Packet Tracer.
- `compose.yaml` — laboratorio de enrutamiento con Docker (dos segmentos de red conectados por un router Alpine con `ip_forward` habilitado). Se levanta con `docker compose up`.

## Proyectos/

- **[SSH/](Proyectos/SSH)** — exposición sobre el protocolo SSH (tema 5, seguridad en las redes): slides interactivas (Quarto + reveal.js) más un entorno Docker para la demo en vivo. Ver el README de la carpeta para correrlo.
