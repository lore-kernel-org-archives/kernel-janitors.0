From: Reiner Herrmann <reiner@reiner-h.de>
Date: Wed, 20 Sep 2006 23:32:54 +0000
Subject: Re: [KJ] [PATCH] Documentation fixes in intel810.txt
Message-Id: <200609210132.54818.reiner@reiner-h.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200609210103.10768.reiner@reiner-h.de> <20060920161546.7d009c9e.rdunlap@xenotime.net>
In-Reply-To: <20060920161546.7d009c9e.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: adaplas@pol.net, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

> > =20
> > -   g. "hsync1/hsync2:<value>"=20
> > -	select the minimum and maximum Horizontal Sync Frequency of the=20
> > -	monitor in KHz.  If a using a fixed frequency monitor, hsync1 must=20
> > +   g. "hsync1/hsync2:<value>"
> > +	select the minimum and maximum Horizontal Sync Frequency of the
> > +	monitor in kHz.  If using a fixed frequency monitor, hsync1 must
>=20
> Why small 'k'?  Is that some standard?
> I prefer KHz but I'm flexible.

Those prefixes are case-sensitive (i.e. m =3D milli and M =3D Mega).
The abbreviation for kilo is a lowercase k.

So here is a corrected version of the patch (with some more fixes I just de=
tected).

Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
---
diff -uprN -X linux-2.6.18/Documentation/dontdiff linux-2.6.18/Documentatio=
n/fb/intel810.txt linux-work/Documentation/fb/intel810.txt
--- linux-2.6.18/Documentation/fb/intel810.txt	2006-09-20 05:42:06.00000000=
0 +0200
+++ linux-work/Documentation/fb/intel810.txt	2006-09-21 01:30:37.000000000 =
+0200
@@ -9,8 +9,9 @@ Intel 810/815 Framebuffer driver
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
=20
 A. Introduction
+
 	This is a framebuffer driver for various Intel 810/815 compatible
-graphics devices.  These would include:
+	graphics devices.  These include:
=20
 	Intel 810
 	Intel 810E
@@ -21,136 +22,136 @@ graphics devices.  These would include:
=20
 B.  Features
=20
-        - Choice of using Discrete Video Timings, VESA Generalized Timing
+	- Choice of using Discrete Video Timings, VESA Generalized Timing
 	  Formula, or a framebuffer specific database to set the video mode
=20
-	- Supports a variable range of horizontal and vertical resolution, and
-	  vertical refresh rates if the VESA Generalized Timing Formula is=20
+	- Supports a variable range of horizontal and vertical resolution and
+	  vertical refresh rates if the VESA Generalized Timing Formula is
 	  enabled.
=20
-        - Supports color depths of 8, 16, 24 and 32 bits per pixel
+	- Supports color depths of 8, 16, 24 and 32 bits per pixel
=20
 	- Supports pseudocolor, directcolor, or truecolor visuals
=20
-        - Full and optimized hardware acceleration at 8, 16 and 24 bpp
+	- Full and optimized hardware acceleration at 8, 16 and 24 bpp
=20
 	- Robust video state save and restore
=20
-        - MTRR support=20
+	- MTRR support
=20
 	- Utilizes user-entered monitor specifications to automatically
 	  calculate required video mode parameters.
=20
-	- Can concurrently run with xfree86 running with native i810 drivers=20
+	- Can concurrently run with xfree86 running with native i810 drivers
=20
 	- Hardware Cursor Support
 =20
 	- Supports EDID probing either by DDC/I2C or through the BIOS
=20
 C.  List of available options
-=09
-   a. "video=3Di810fb" =20
+
+   a. "video=3Di810fb"
 	enables the i810 driver
=20
 	Recommendation: required
-=20
-   b. "xres:<value>" =20
+
+   b. "xres:<value>"
 	select horizontal resolution in pixels. (This parameter will be
 	ignored if 'mode_option' is specified.  See 'o' below).
=20
-	Recommendation: user preference=20
+	Recommendation: user preference
 	(default =3D 640)
=20
    c. "yres:<value>"
 	select vertical resolution in scanlines. If Discrete Video Timings
 	is enabled, this will be ignored and computed as 3*xres/4.  (This
 	parameter will be ignored if 'mode_option' is specified.  See 'o'
-	below) =20
+	below)
=20
 	Recommendation: user preference
 	(default =3D 480)
-	=09
-   d. "vyres:<value>"=20
+
+   d. "vyres:<value>"
 	select virtual vertical resolution in scanlines. If (0) or none
-	is specified, this will be computed against maximum available memory.=20
+	is specified, this will be computed against maximum available memory.
=20
 	Recommendation: do not set
 	(default =3D 480)
=20
    e. "vram:<value>"
-	select amount of system RAM in MB to allocate for the video memory=20
+	select amount of system RAM in MB to allocate for the video memory
=20
 	Recommendation: 1 - 4 MB.
 	(default =3D 4)
=20
-   f. "bpp:<value>"  =20
-	select desired pixel depth=20
+   f. "bpp:<value>"
+	select desired pixel depth
=20
 	Recommendation: 8
 	(default =3D 8)
=20
-   g. "hsync1/hsync2:<value>"=20
-	select the minimum and maximum Horizontal Sync Frequency of the=20
-	monitor in KHz.  If a using a fixed frequency monitor, hsync1 must=20
+   g. "hsync1/hsync2:<value>"
+	select the minimum and maximum Horizontal Sync Frequency of the
+	monitor in kHz.  If using a fixed frequency monitor, hsync1 must
 	be equal to hsync2. If EDID probing is successful, these will be
 	ignored and values will be taken from the EDID block.
=20
 	Recommendation: check monitor manual for correct values
-	default (29/30)
+	(default =3D 29/30)
=20
-   h. "vsync1/vsync2:<value>"=20
+   h. "vsync1/vsync2:<value>"
 	select the minimum and maximum Vertical Sync Frequency of the monitor
-	in Hz. You can also use this option to lock your monitor's refresh=20
+	in Hz. You can also use this option to lock your monitor's refresh
 	rate. If EDID probing is successful, these will be ignored and values
 	will be taken from the EDID block.
=20
 	Recommendation: check monitor manual for correct values
 	(default =3D 60/60)
=20
-	IMPORTANT:  If you need to clamp your timings, try to give some=20
-	leeway for computational errors (over/underflows).  Example: if=20
+	IMPORTANT:  If you need to clamp your timings, try to give some
+	leeway for computational errors (over/underflows).  Example: if
 	using vsync1/vsync2 =3D 60/60, make sure hsync1/hsync2 has at least
 	a 1 unit difference, and vice versa.
=20
-   i. "voffset:<value>"=09
-        select at what offset in MB of the logical memory to allocate the =

+   i. "voffset:<value>"
+	select at what offset in MB of the logical memory to allocate the
 	framebuffer memory.  The intent is to avoid the memory blocks
 	used by standard graphics applications (XFree86).  The default
-        offset (16 MB for a 64MB aperture, 8 MB for a 32MB aperture) will
-        avoid XFree86's usage and allows up to 7MB/15MB of framebuffer
-        memory.  Depending on your usage, adjust the value up or down,=20
-	(0 for maximum usage, 31/63 MB for the least amount).  Note, an=20
+	offset (16 MB for a 64MB aperture, 8 MB for a 32MB aperture) will
+	avoid XFree86's usage and allows up to 7MB/15MB of framebuffer
+	memory.  Depending on your usage, adjust the value up or down,
+	(0 for maximum usage, 31/63 MB for the least amount).  Note, an
 	arbitrary setting may conflict with XFree86.
=20
 	Recommendation: do not set
 	(default =3D 8 or 16 MB)
-     =20
-   j. "accel"=20
-	enable text acceleration.  This can be enabled/reenabled anytime=20
-	by using 'fbset -accel true/false'.=20
+
+   j. "accel"
+	enable text acceleration.  This can be enabled/reenabled anytime
+	by using 'fbset -accel true/false'.
=20
 	Recommendation: enable
-	(default =3D not set)=20
+	(default =3D not set)
=20
-   k. "mtrr"=20
+   k. "mtrr"
 	enable MTRR.  This allows data transfers to the framebuffer memory
 	to occur in bursts which can significantly increase performance.
-	Not very helpful with the i810/i815 because of 'shared memory'.=20
+	Not very helpful with the i810/i815 because of 'shared memory'.
=20
 	Recommendation: do not set
-	(default =3D not set)=20
+	(default =3D not set)
=20
    l. "extvga"
 	if specified, secondary/external VGA output will always be enabled.
 	Useful if the BIOS turns off the VGA port when no monitor is attached.
-	The external VGA monitor can then be attached without rebooting.=20
+	The external VGA monitor can then be attached without rebooting.
=20
 	Recommendation: do not set
 	(default =3D not set)
-=09
-   m. "sync"=20
+
+   m. "sync"
 	Forces the hardware engine to do a "sync" or wait for the hardware
-	to finish before starting another instruction. This will produce a=20
+	to finish before starting another instruction. This will produce a
 	more stable setup, but will be slower.
=20
 	Recommendation: do not set
@@ -162,6 +163,7 @@ C.  List of available options
=20
 	Recommendation: do not set
 	(default =3D not set)
+
    o. <xres>x<yres>[-<bpp>][@<refresh>]
 	The driver will now accept specification of boot mode option.  If this
 	is specified, the options 'xres' and 'yres' will be ignored. See
@@ -183,8 +185,8 @@ append=3D"video=3Di810fb:vram:2,xres:1024,yr
         vsync1:50,vsync2:85,accel,mtrr"
=20
 This will initialize the framebuffer to 1024x768 at 8bpp.  The framebuffer
-will use 2 MB of System RAM. MTRR support will be enabled. The refresh rat=
e=20
-will be computed based on the hsync1/hsync2 and vsync1/vsync2 values. =20
+will use 2 MB of System RAM. MTRR support will be enabled. The refresh rate
+will be computed based on the hsync1/hsync2 and vsync1/vsync2 values.
=20
 IMPORTANT:
 You must include hsync1, hsync2, vsync1 and vsync2 to enable video modes
@@ -194,10 +196,10 @@ vsync1 and vsync2 parameters.  These par
 block.
=20
 E.  Module options
-=09
-	The module parameters are essentially similar to the kernel=20
-parameters. The main difference is that you need to include a Boolean valu=
e=20
-(1 for TRUE, and 0 for FALSE) for those options which don't need a value. =

+
+The module parameters are essentially similar to the kernel
+parameters. The main difference is that you need to include a Boolean value
+(1 for TRUE, and 0 for FALSE) for those options which don't need a value.
=20
 Example, to enable MTRR, include "mtrr=3D1".
=20
@@ -214,62 +216,62 @@ Or just add the following to /etc/modpro
 	options i810fb vram=3D2 xres=1024 bpp=16 hsync10 hsync2U vsync1P \
 	vsync2=85 accel=3D1 mtrr=3D1
=20
-and just do a=20
+and just do a
=20
 	modprobe i810fb
=20
=20
 F.  Setup
=20
-	a. Do your usual method of configuring the kernel.=20
-=09
+	a. Do your usual method of configuring the kernel.
+
 	make menuconfig/xconfig/config
=20
-	b. Under "Code Maturity Options", enable "Prompt for experimental/
-	   incomplete code/drivers".
+	b. Under "Code maturity level options" enable "Prompt for development
+	   and/or incomplete code/drivers".
=20
  	c. Enable agpgart support for the Intel 810/815 on-board graphics.
-	   This is required.  The option is under "Character Devices"
+	   This is required.  The option is under "Character Devices".
=20
 	d. Under "Graphics Support", select "Intel 810/815" either statically
 	   or as a module.  Choose "use VESA Generalized Timing Formula" if
-	   you need to maximize the capability of your display.  To be on the=20
-	   safe side, you can leave this unselected. =20
- =20
+	   you need to maximize the capability of your display.  To be on the
+	   safe side, you can leave this unselected.
+
 	e. If you want support for DDC/I2C probing (Plug and Play Displays),
 	   set 'Enable DDC Support' to 'y'. To make this option appear, set
 	   'use VESA Generalized Timing Formula' to 'y'.
=20
-        f. If you want a framebuffer console, enable it under "Console=20
-	   Drivers"
+        f. If you want a framebuffer console, enable it under "Console
+	   Drivers".
+
+	g. Compile your kernel.
+
+	h. Load the driver as described in sections D and E.
=20
-	g. Compile your kernel.=20
-	  =09
-	h. Load the driver as described in section D and E.
-=09
 	i.  Try the DirectFB (http://www.directfb.org) + the i810 gfxdriver
 	    patch to see the chipset in action (or inaction :-).
=20
 G.  Acknowledgment:
-=09
+
 	1.  Geert Uytterhoeven - his excellent howto and the virtual
-                                 framebuffer driver code made this possibl=
e.
+	    framebuffer driver code made this possible.
=20
-	2.  Jeff Hartmann for his agpgart code. =20
+	2.  Jeff Hartmann for his agpgart code.
=20
 	3.  The X developers.  Insights were provided just by reading the
 	    XFree86 source code.
=20
 	4.  Intel(c).  For this value-oriented chipset driver and for
-            providing documentation.
+	    providing documentation.
=20
 	5. Matt Sottek.  His inputs and ideas  helped in making some
-	optimizations possible.
+	   optimizations possible.
=20
 H.  Home Page:
=20
 	A more complete, and probably updated information is provided at
-http://i810fb.sourceforge.net.
+	http://i810fb.sourceforge.net.
=20
 ###########################
 Tony
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
