From: Daniele Bellucci <bellucda@tiscali.it>
Date: Sun, 25 Apr 2004 22:06:52 +0000
Subject: [Kernel-janitors] [PATCH] audits in usb_init() [2.6.6-rc2-bk3]
Message-Id: <20040425220652.GA32336@charlie.minidns.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83268143204799894=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83268143204799894==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


there were some missing audits in usb_init()

Please Apply ;)


--- drivers/usb/core/usb.c.old	2004-04-26 23:48:28.000000000 +0200
+++ drivers/usb/core/usb.c	2004-04-26 23:55:56.069128768 +0200
@@ -1577,20 +1577,40 @@
  */
 static int __init usb_init(void)
 {
+	int retval;
 	if (nousb) {
 		pr_info ("%s: USB support disabled\n", usbcore_name);
 		return 0;
 	}
 
-	bus_register(&usb_bus_type);
+	retval = bus_register(&usb_bus_type);
+	if (retval) 
+		goto out;
 	usb_host_init();
-	usb_major_init();
-	usbfs_init();
-	usb_hub_init();
+	retval = usb_major_init();
+	if (retval)
+		goto major_init_failed;
+	retval = usbfs_init();
+	if (retval)
+		goto fs_init_failed;
+	retval = usb_hub_init();
+	if (retval)
+		goto hub_init_failed;
+
+	retval = driver_register(&usb_generic_driver);
+	if (!retval)
+		goto out;
 
-	driver_register(&usb_generic_driver);
-
-	return 0;
+	usb_hub_cleanup();
+hub_init_failed:
+	usbfs_cleanup();
+fs_init_failed:
+	usb_major_cleanup();	
+major_init_failed:
+	usb_host_cleanup();
+	bus_unregister(&usb_bus_type);
+out:
+	return retval;
 }
 
 /*


-- 

[Daniele]

--===============83268143204799894==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83268143204799894==--
