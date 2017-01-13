;;; Editor written in hy

(import gi)
(import [gi.repository [Gtk]])
(.require-version gi "Gtk" "3.0")

(defclass EditorWindow [Gtk.Window]
  (defn --init-- [self]
    (.--init--
      (super EditorWindow self)
      :title "Hydeous"
      :default-width 500
      :default-height 500)

    ;; The box containing all other widgets
    (setv self.window-box (.Box Gtk :orientation Gtk.Orientation.VERTICAL))
    (.add self self.window-box)

    ;; Other boxes
    (setv self.menu-box (.Box Gtk :spacing 6)
          self.text-box (.Box Gtk))

    ;; Create the buttons at the top
    (setv self.file-button (.ToggleButton Gtk :label "File") 
          self.edit-button (.ToggleButton Gtk :label "Edit"))

    ;; Pack
    (.pack-start self.window-box self.menu-box True True 0)
    (.pack-start self.window-box self.text-box True True 0)

    (.pack-start self.menu-box self.file-button True True 0)
    (.pack-start self.menu-box self.edit-button True True 0)))

(setv *win* (EditorWindow))
(.connect *win* "delete-event" (. Gtk main-quit))
(.show-all *win*)
(.main Gtk)
