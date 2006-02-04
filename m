From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 21:10:24 +0000
Subject: [KJ] [PATCH] request_region - ppc/platforms/prep_setup.c - Please
Message-Id: <200602041610.24772.ron@rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Is this a good way to handle this problem?  Original code was (in essence) =
5=20
request_region calls in a row with no return checking.


This patch adds return value checking to request_region. =A0No other struct=
ural=20
changes included...


diff -ur linux-2.6.15.orig/arch/ppc/platforms/prep_setup.c=20
linux-2.6.15/arch/ppc/platforms/prep_setup.c
--- linux-2.6.15.orig/arch/ppc/platforms/prep_setup.c	2006-02-04=20
11:00:29.000000000 -0500
+++ linux-2.6.15/arch/ppc/platforms/prep_setup.c	2006-02-04 16:04:58.000000=
000=20
-0500
@@ -1071,16 +1071,43 @@
 static int __init
 prep_request_io(void)
 {
+	struct resource *region;
+	unsigned char ret=3D0;
+
+	/* if ret =3D 0, everything worked and we return normally.
+	   if ret !=3D 0, then something failed and we return -EBUSY. */
+	  =20
 	if (_machine =3D _MACH_prep) {
 #ifdef CONFIG_NVRAM
-		request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+		region =3D request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+		if (!region) {
+			printk (KERN_INFO "Could not allocate nvram region");
+			ret =3D 1;
+			}
 #endif
-		request_region(0x00,0x20,"dma1");
-		request_region(0x40,0x20,"timer");
-		request_region(0x80,0x10,"dma page reg");
-		request_region(0xc0,0x20,"dma2");
+		region =3D request_region(0x00,0x20,"dma1");
+		if (!region) {
+			printk (KERN_INFO "Could not allocate dma1 region");
+			ret =3D 1;
+			}
+		region =3D request_region(0x40,0x20,"timer");
+		if (!region) {
+			printk (KERN_INFO "Could not allocate timer region");
+			ret =3D 1;
+			}
+		region =3D request_region(0x80,0x10,"dma page reg");
+		if (!region) {
+			printk (KERN_INFO "Could not allocate dma page region");
+			ret =3D 1;
+			}
+		region =3D request_region(0xc0,0x20,"dma2");
+		if (!region) {
+			printk (KERN_INFO "Could not allocate dma2 region");
+			ret =3D 1;
+			}
 	}
-
+	if (ret !=3D 0)
+		return -EBUSY;
 	return 0;
 }
=20

--=20
Ron Gage=20
(LPIC1, MCP, A+, Net+)
Westland Michigan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
