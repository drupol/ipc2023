# Leveraging Nix in the PHP ecosystem

## Usage

Each directory in `src/` correspond to a unique document. All the Nix command
available will be derived for each directory, automatically.

If you have a directory named `ipc2023`, the available commands in this project
will be:

 - `build-ipc2023`: a command that will compile the source in a PDF document
   immediately at the root of the project.
 - `watch-ipc2023`: a command that will watch the source and compile the PDF
   document as soon as there's a change, at the root of the project.
 - `nix build .#ipc2023`: a command that will build the document once. The
   resulting file(s) will be in `result/` at the root of the project.
