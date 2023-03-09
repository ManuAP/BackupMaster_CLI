<div>
  <h2>BackupMaster</h2>
  <p>El script BackupMaster.sh es una herramienta de línea de comandos que permite hacer respaldo de datos de un servidor y su transferencia a un sistema de almacenamiento externo de manera automatizada y programable.</p>

  <h3>Requisitos</h3>
  <ul>
    <li>Bash (versión 4 o superior)</li>
    <li>Rsync</li>
    <li>SSH (opcional)</li>
  </ul>

  <h3>Instalación</h3>
  <ol>
    <li>Descargar el archivo BackupMaster.sh</li>
    <li>Abrir la terminal en el directorio donde se encuentra el archivo.</li>
    <li>Ejecutar el siguiente comando: chmod +x BackupMaster.sh</li>
  </ol>

  <h3>Uso</h3>
  <p>El script admite los siguientes parámetros:</p>

  <pre>
    -s, --source       Ruta de la carpeta o archivo que se desea respaldar (obligatorio)
    -d, --destination  Ruta de la carpeta o archivo en el sistema de almacenamiento externo (obligatorio)
    -e, --exclude      Ruta del archivo de exclusión (opcional)
    -r, --remote       Realizar la transferencia a un sistema de almacenamiento externo a través de SSH (opcional)
    -k, --key          Ruta del archivo de clave SSH (opcional)
  </pre>

  <p>Ejemplo de uso:</p>
  <pre>
    ./BackupMaster.sh -s /ruta/a/mis/datos -d usuario@servidor:/ruta/de/destino -e /ruta/de/exclusiones.txt -r -k /ruta/a/clave_ssh
  </pre>
  <p>El comando anterior realizará un respaldo de la carpeta /ruta/a/mis/datos, excluirá los archivos y carpetas indicados en el archivo /ruta/de/exclusiones.txt, y lo transferirá al sistema de almacenamiento externo a través de SSH, utilizando la clave SSH ubicada en /ruta/a/clave_ssh.</p>

  <h3>Funcionamiento</h3>
  <ol>
    <li>Verifica si se han ingresado los parámetros obligatorios (source y destination).</li>
    <li>Verifica si el archivo de exclusión existe y lo utiliza en caso afirmativo.</li>
    <li>Si se ha indicado la transferencia a un sistema de almacenamiento externo a través de SSH, utiliza la clave SSH proporcionada para conectarse al servidor remoto.</li>
    <li>Ejecuta el comando rsync para realizar la transferencia del archivo o carpeta de origen a su destino.</li>
    <li>Muestra un mensaje de confirmación indicando que el respaldo se ha realizado correctamente.</li>
  </ol>

  <h3>Contribuir</h3>
  <p>Si deseas contribuir con el desarrollo del script, puedes hacerlo a través de Pull Requests en Github.</p>

</div>
