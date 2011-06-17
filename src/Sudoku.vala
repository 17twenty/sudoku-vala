using Gtk;

class Sudoku : GLib.Object {
    public static int main(string[] args) {
        Gtk.init(ref args);
        
        var gameGrid = new SudokuGrid();
        gameGrid.destroy.connect(Gtk.main_quit);
        gameGrid.show();
        Gtk.main();
        return 0;
    }
}

