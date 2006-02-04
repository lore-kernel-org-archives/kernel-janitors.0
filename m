From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 20:50:20 +0000
Subject: [KJ] [PATCH] request_region - arm/mach-shark/leds.c
Message-Id: <200602041550.20845.ron@rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This patch adds return value checking to request_region. =A0No other struct=
ural=20
changes included...


diff -ur linux-2.6.15.orig/arch/arm/mach-shark/leds.c=20
linux-2.6.15/arch/arm/mach-shark/leds.c
--- linux-2.6.15.orig/arch/arm/mach-shark/leds.c	2006-02-04 11:00:23.000000=
000=20
-0500
+++ linux-2.6.15/arch/arm/mach-shark/leds.c	2006-02-04 15:44:32.000000000=20
-0500
@@ -148,11 +148,14 @@
 {
 	extern void (*leds_event)(led_event_t);
 	short temp;
+	struct resource *region;
 =09
 	leds_event =3D sequoia_leds_event;
=20
 	/* Make LEDs independent of power-state */
-	request_region(0x24,4,"sequoia");
+	region =3D request_region(0x24,4,"sequoia");
+	if (!region)
+		return -EBUSY;
 	temp =3D sequoia_read(0x09);
 	temp |=3D 1<<10;
 	sequoia_write(temp,0x09);


--=20
Ron Gage=20
(LPIC1, MCP, A+, Net+)
Westland Michigan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
