using Gtk;
using Cairo;

public class SudokuWidget : DrawingArea {
    public SudokuWidget() {
        add_events (Gdk.EventMask.BUTTON_PRESS_MASK
                  | Gdk.EventMask.BUTTON_RELEASE_MASK
                  | Gdk.EventMask.POINTER_MOTION_MASK);

        // Set favored widget size
        set_size_request (640, 480);
    }
    
    private static const string TEXT   = "BRAP";
    private static const int BORDER_WIDTH = 10;
    private Pango.Layout layout;
    construct {
        this.layout = create_pango_layout (TEXT);
				set_has_window (false);		//need this for some reason, don't know why.
				set_size_request (100, 100);
    }
    
    public override bool draw(Cairo.Context cr) {
    	int width  = this.get_allocated_width();
		int height  = this.get_allocated_height();
		// In this example, draw a rectangle in the foreground color
		//Gdk.cairo_set_source_color (cr, this.style.fg[this.state]);
		cr.set_source_rgba (0.5,0.5,0.5, 1);
		cr.rectangle (BORDER_WIDTH, BORDER_WIDTH,
				width - 2 * BORDER_WIDTH,
				height - 2 * BORDER_WIDTH);
		cr.set_line_width (5.0);
		cr.set_line_join (LineJoin.ROUND);
		cr.stroke ();

		// And draw the text in the middle of the allocated space
		int fontw, fonth;
		this.layout.get_pixel_size (out fontw, out fonth);
		cr.move_to ((width - fontw) / 2,
				(height - fonth) / 2);
		Pango.cairo_update_layout (cr, this.layout);
		Pango.cairo_show_layout (cr, this.layout);
		return true;
    }

    /* Mouse button got pressed over widget */
    public override bool button_press_event(Gdk.EventButton event) {
        // ...
        stdout.printf("Clicked");
        return false;
    }

    /* Mouse button got released */
    public override bool button_release_event(Gdk.EventButton event) {
        // ...
        
        stdout.printf("Release");
        return false;
    }

    /* Mouse pointer moved over widget */
    public override bool motion_notify_event(Gdk.EventMotion event) {
        // ...
        
        stdout.printf("Motion");
        return false;
    }
}
