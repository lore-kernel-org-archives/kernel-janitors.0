From: Ron Gage <ron@rongage.org>
Date: Sat, 04 Feb 2006 20:37:32 +0000
Subject: [KJ] [PATCH] request_region - arm/mach_footbridge/netwinder-hw.c
Message-Id: <200602041537.32255.ron@rongage.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This patch adds return value checking to request_region. =A0No other struct=
ural=20
changes included... =A0Using kmail->message->insert file to post patch.
diff -ur linux-2.6.15.orig/arch/arm/mach-footbridge/netwinder-hw.c=20
linux-2.6.15/arch/arm/mach-footbridge/netwinder-hw.c
--- linux-2.6.15.orig/arch/arm/mach-footbridge/netwinder-hw.c	2006-02-04=20
11:00:21.000000000 -0500
+++ linux-2.6.15/arch/arm/mach-footbridge/netwinder-hw.c	2006-02-04=20
15:33:37.000000000 -0500
@@ -333,7 +333,12 @@
  */
 static void __init wb977_init(void)
 {
-	request_region(0x370, 2, "W83977AF configuration");
+	struct resource *region;
+	region =3D request_region(0x370, 2, "W83977AF configuration");
+	if (!region) {
+		printk(KERN_ERR "Could not allocate region for W83977AF");
+		return;
+	}
=20
 	/*
 	 * Open up the SuperIO chip

--=20
Ron Gage=20
(LPIC1, MCP, A+, Net+)
Westland Michigan

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
