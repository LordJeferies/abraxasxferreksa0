# FerreKsa — reorganización del 20 de octubre de 2026

## Qué corresponde a cada URL
- abraxasxferreksa: landing actualizada, sin nuevas subpáginas propias. Incluye hero, catálogo orientativo, cotización, sedes, presentación, ofertas por consultar, guías y RRSS. Los enlaces institucionales completos llevan a la versión 2.
- abraxasxferreksa2: sitio completo con inicio, nosotros, servicios, cotizaciones, marcas, ofertas, preguntas, sucursales, responsabilidad social, blog, contacto y catálogo; URLs HTML independientes y navegación compartida.
- abraxasxferreksa9: tienda de demostración, backend local de ejemplo y cotizador con geometrías 3D opcionales.
- abraxasxferreksa0: página temporal con WhatsApp y sedes.

## Cotización
Se comparten seis plantillas (pintura, sala, cocina, lavado, obra y selección libre), buscador por nombre/necesidad, categorías, cantidades, unidades y detalles editables. La búsqueda es local, basada en texto y algunas equivalencias; no es un chatbot ni consulta inventario en tiempo real. Al buscar una medida, se conserva la descripción en la referencia. Las consultas sin coincidencia pueden enviarse como descripción libre. El borrador se guarda en el navegador si está permitido.

La versión 9 vincula referencias de tornillos/pernos, tubos y láminas con el configurador. El tornillo tiene cabeza hexagonal y rosca ilustrativas; cambia con largo bajo cabeza y diámetro nominal. No identifica una norma, paso real de rosca, grado, resistencia o stock. Las medidas configuradas se incluyen en el mismo resumen de WhatsApp. No se calculan peso ni volumen técnico del tornillo.

## Interfaz
Las cuatro versiones tienen tema claro/oscuro persistente, con preferencia inicial del sistema si no hay elección guardada. La preferencia se comparte entre rutas del mismo origen. Se redondearon controles y tarjetas; se mantuvieron imágenes completas, marca, fotografías de sedes y los recursos de Luka. Los formularios antiguos quedan como herramientas opcionales, no como primer paso.

## Verificación
- Compilación TypeScript/Vite y siete pruebas de cálculo, validación, API de ejemplo y medidas.
- 14 rutas locales de la landing, temporal y sitio completo devuelven HTTP 200; referencias HTML sin archivos locales inexistentes.
- Prueba de plantilla cocina: cambiar a dos neveras se refleja en el resumen.
- Prueba móvil 390 px: buscar tornillos para madera de 40 mm, añadir referencia, bloquear cantidad 0 y revisar con cantidad 12 conservando la medida.
- Prueba 3D: configurar 20 tornillos de Ø8 × 60 mm y verificar cantidad, largo y diámetro en la consulta común.
- Sucursales, landing y temporal conservan tema entre rutas; comprobación móvil sin desbordamiento horizontal en las vistas representativas.
- No se enviaron mensajes de WhatsApp ni se hicieron pagos. No se declaran métricas Lighthouse o pruebas en teléfonos físicos.

## Pendientes comerciales
Catálogo e inventario reales por sede, modelos, precios oficiales, condiciones de promociones, lista de marcas aliadas, testimonios autorizados y acciones sociales documentadas. Checkout y Cashea reales requieren integración autorizada. La base local de backend no se publica como servidor en GitHub Pages.

## Respaldos
Antes de esta reorganización se guardaron cuatro archivos tar.gz en work/backups, terminados en antes-reorganizacion-20261020. Las historias Git anteriores se conservan.
