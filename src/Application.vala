// -*- Mode: vala; indent-tabs-mode: nil; tab-width: 4 -*-
/*-
 * Copyright (c) 2016 elementary LLC. (https://elementary.io)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Corentin Noël <corentin@elementary.io>
 */

public class Onboarding.App : Gtk.Application {
    construct {
        application_id = "io.elementary.installer";
        flags = ApplicationFlags.FLAGS_NONE;
        Intl.setlocale (LocaleCategory.ALL, "");
        Intl.bindtextdomain (Onboarding.GETTEXT_PACKAGE, Onboarding.LOCALEDIR);
        Intl.bind_textdomain_codeset (Onboarding.GETTEXT_PACKAGE, "UTF-8");
        Intl.textdomain (Onboarding.GETTEXT_PACKAGE);
    }

    public override void activate () {
        if (Posix.getuid () < MIN_UID) {
            quit ();
        }

        var window = new MainWindow ();
        window.application = this;
        window.show_all ();
    }
}

public static int main (string[] args) {
    var application = new Onboarding.App ();
    return application.run (args);
}
