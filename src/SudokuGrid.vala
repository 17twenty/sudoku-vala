using Gtk;

public class SudokuGrid : Gtk.Window {
    public SudokuGrid() {
        // Setup our grid
        title = "Sudoku-Vala";
        set_default_size(640,480);
        window_position = WindowPosition.CENTER;
        
        // Add a toolbar
        
        // Create a 3x3 grid and put our custom widget into it
        add(new SudokuWidget());
        show_all();
    }
}

