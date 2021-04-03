/* xrdesktop-0.15.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Xrd", gir_namespace = "Xrd", gir_version = "0.15", lower_case_cprefix = "xrd_")]
namespace Xrd {
	[CCode (cheader_filename = "xrd.h", type_id = "xrd_client_get_type ()")]
	public class Client : GLib.Object {
		[CCode (has_construct_function = false)]
		public Client ();
		public Xrd.Window? lookup_window (Meta.Window meta_win);
		public void add_container (Xrd.Container container);
		public void add_window (Xrd.Window window, bool draggable, void* lookup_key);
		public Gulkan.Client get_gulkan ();
		public Vk.ImageLayout get_upload_layout ();
		public bool poll_input_events ();
		public bool poll_runtime_events ();
		public void remove_container (Xrd.Container container);
		public void remove_window (Xrd.Window window);
		public void set_pin (Xrd.Window win, bool pin);
		public void show_pinned_only (bool pinned_only);
		public void* switch_mode ();
		[CCode (has_construct_function = false)]
		public Client.with_mode (Xrd.ClientMode mode);
		public signal void click_event (Gdk.Event object);
		public signal void keyboard_press_event (Gdk.Event object);
		public signal void move_cursor_event (Gdk.Event object);
		public signal void request_quit_event (Gdk.Event object);
	}
	[CCode (cheader_filename = "xrd.h", type_id = "xrd_container_get_type ()")]
	public class Container : GLib.Object {
		[CCode (has_construct_function = false)]
		public Container ();
		public float get_distance ();
		public void hide ();
		public bool is_visible ();
		public void remove_window (Xrd.Window window);
		public void set_distance (float distance);
		public void set_layout (Xrd.ContainerLayout layout);
		public void show ();
	}
	[CCode (cheader_filename = "xrd.h", type_id = "xrd_input_synth_get_type ()")]
	public class InputSynth : GLib.Object {
		[CCode (has_construct_function = false)]
		public InputSynth ();
		public void reset_press_state ();
		public void reset_scroll ();
		public signal void click_event (Gdk.Event object);
		public signal void move_cursor_event (Gdk.Event object);
	}
	[CCode (cheader_filename = "xrd.h", type_id = "xrd_shake_compensator_get_type ()")]
	public class ShakeCompensator : GLib.Object {
		[CCode (has_construct_function = false)]
		public ShakeCompensator ();
		public bool is_recording ();
		public void replay_move_queue (Xrd.InputSynth synth, uint move_cursor_event_signal, Xrd.Window hover_window);
		public void reset ();
	}
	[CCode (cheader_filename = "xrd.h", type_id = "xrd_window_manager_get_type ()")]
	public class WindowManager : GLib.Object {
		[CCode (has_construct_function = false)]
		public WindowManager ();
		public void add_container (Xrd.Container container);
		public void add_window (Xrd.Window window, Xrd.WindowFlags flags);
		public void arrange_reset ();
		public Xrd.HoverMode get_hover_mode ();
		public void remove_container (Xrd.Container container);
		public void remove_window (Xrd.Window window);
		public void set_hover_mode (Xrd.HoverMode mode);
		public signal void no_hover_event (Gdk.Event object);
	}
	[CCode (cheader_filename = "xrd.h", type_cname = "XrdDesktopCursorInterface", type_id = "xrd_desktop_cursor_get_type ()")]
	public interface DesktopCursor : GLib.Object {
		public abstract void hide ();
		public void init_settings ();
		public void set_hotspot (int hotspot_x, int hotspot_y);
		public abstract void set_width_meters (float meters);
		public abstract void show ();
		public abstract void submit_texture ();
	}
	[CCode (cheader_filename = "xrd.h", type_cname = "XrdWindowInterface", type_id = "xrd_window_get_type ()")]
	public interface Window : GLib.Object {
		public static Xrd.Window new_from_pixels (Xrd.Client client, string title, int width, int height, float ppm);
		public void add_child (Xrd.Window window, Graphene.Point offset);
		public void close ();
		public void deselect ();
		public abstract void emit_grab (Xrd.GrabEvent event);
		public abstract void emit_hover (Xrd.HoverEvent event);
		public void end_selection ();
		public float get_aspect_ratio ();
		public float get_current_height_meters ();
		public float get_current_ppm ();
		public float get_current_width_meters ();
		public Xrd.WindowData? get_data ();
		public float get_initial_ppm ();
		public Gulkan.Texture get_texture ();
		public abstract void hide ();
		public bool is_pinned ();
		public bool is_selected ();
		public abstract bool is_visible ();
		public abstract void poll_event ();
		public void save_reset_transformation ();
		public void select ();
		public void set_and_submit_texture (Gulkan.Texture texture);
		public abstract void set_flip_y (bool flip_y);
		public void set_pin (bool pinned, bool hide_unpinned);
		public void set_transformation (Graphene.Matrix transform);
		public abstract void submit_texture ();
		public void update_child ();
		[NoAccessorMethod]
		public abstract float initial_height_meters { get; set construct; }
		[NoAccessorMethod]
		public abstract float initial_width_meters { get; set construct; }
		[NoAccessorMethod]
		public abstract void* native { get; set construct; }
		[NoAccessorMethod]
		public abstract float scale { get; set construct; }
		[NoAccessorMethod]
		public abstract uint texture_height { get; set construct; }
		[NoAccessorMethod]
		public abstract uint texture_width { get; set construct; }
		[NoAccessorMethod]
		public abstract string title { owned get; construct; }
		public signal void button_press_event (Gdk.Event object);
		public signal void button_release_event (Gdk.Event object);
		public signal void destroy ();
		public signal void grab_event (Gdk.Event object);
		public signal void grab_start_event (Gdk.Event object);
		public signal void hover_end_event (Gdk.Event object);
		public signal void hover_event (Gdk.Event object);
		public signal void hover_start_event (Gdk.Event object);
		public signal void keyboard_close_event ();
		public signal void keyboard_press_event (Gdk.Event object);
		public signal void motion_notify_event (Gdk.Event object);
		public signal void release_event (Gdk.Event object);
		public signal void scroll_event (Gdk.Event object);
		[HasEmitter]
		public virtual signal void show ();
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct ClickEvent {
		public weak Xrd.Window window;
		public bool state;
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct DesktopCursorData {
		public weak Xrd.DesktopCursor cursor;
		public bool keep_apparent_size;
		public float width_meters;
		public float cached_width_meters;
		public int hotspot_x;
		public int hotspot_y;
		public uint32 texture_width;
		public uint32 texture_height;
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct GrabEvent {
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct HoverEvent {
		public float distance;
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct MoveCursorEvent {
		public weak Xrd.Window window;
		public bool ignore;
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct NoHoverEvent {
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct TransformTransition {
		public weak Xrd.Window window;
		public float from_scaling;
		public float to_scaling;
		public float interpolate;
		public int64 last_timestamp;
	}
	[CCode (cheader_filename = "xrd.h", has_type_id = false)]
	public struct WindowData {
		public weak Gala.Plugins.XRDesktop.XRWindow? native;
		public uint32 texture_width;
		public uint32 texture_height;
		public weak GLib.StringBuilder title;
		public float scale;
		public void* child_window;
		public weak Xrd.Window? parent_window;
		public bool pinned;
		public weak Xrd.Window xrd_window;
		public bool owned_by_window;
	}
	[CCode (cheader_filename = "xrd.h", cprefix = "XRD_CLIENT_MODE_", has_type_id = false)]
	public enum ClientMode {
		OVERLAY,
		SCENE
	}
	[CCode (cheader_filename = "xrd.h", cprefix = "XRD_CONTAINER_ATTACHMENT_", has_type_id = false)]
	public enum ContainerAttachment {
		NONE,
		HEAD,
		HAND
	}
	[CCode (cheader_filename = "xrd.h", cprefix = "XRD_CONTAINER_", has_type_id = false)]
	public enum ContainerLayout {
		NO_LAYOUT,
		HORIZONTAL,
		VERTICAL,
		RELATIVE
	}
	[CCode (cheader_filename = "xrd.h", cprefix = "XRD_HOVER_MODE_", has_type_id = false)]
	public enum HoverMode {
		EVERYTHING,
		BUTTONS
	}
	[CCode (cheader_filename = "xrd.h", cprefix = "XRD_WINDOW_", has_type_id = false)]
	[Flags]
	public enum WindowFlags {
		HOVERABLE,
		DRAGGABLE,
		MANAGED,
		DESTROY_WITH_PARENT,
		BUTTON
	}
	[CCode (cheader_filename = "xrd.h", cname = "XRD_TIP_APPARENT_SIZE_DISTANCE")]
	public const double TIP_APPARENT_SIZE_DISTANCE;
	[CCode (cheader_filename = "xrd.h", cname = "XRD_TIP_VIEWPORT_SCALE")]
	public const int TIP_VIEWPORT_SCALE;
	[CCode (cheader_filename = "xrd.h")]
	public static void render_lock ();
	[CCode (cheader_filename = "xrd.h")]
	public static void render_lock_destroy ();
	[CCode (cheader_filename = "xrd.h")]
	public static void render_lock_init ();
	[CCode (cheader_filename = "xrd.h")]
	public static void render_unlock ();
	[CCode (cheader_filename = "xrd.h")]
	public static void settings_destroy_instance ();
	[CCode (cheader_filename = "xrd.h")]
	public static bool settings_is_schema_installed ();
	[CCode (cheader_filename = "xrd.h")]
	public static void settings_update_double_val (GLib.Settings settings, string key, double val);
	[CCode (cheader_filename = "xrd.h")]
	public static void settings_update_gboolean_val (GLib.Settings settings, string key, bool val);
	[CCode (cheader_filename = "xrd.h")]
	public static void settings_update_int_val (GLib.Settings settings, string key, int val);
}
