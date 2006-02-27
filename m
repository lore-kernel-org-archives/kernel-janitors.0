From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 27 Feb 2006 08:40:53 +0000
Subject: [KJ][Patch] check return value of request_region in matroxfb_base.c
Message-Id: <1141029654.7765.6.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8419001488576634=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8419001488576634==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

matroxfb_base.c calles 'request_region' @ 1737 without checking the
return value.

The patch below adds a check for this and plugs into the existing error
path.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc4/drivers/video/matrox/matroxfb_base.c.orig	2006-02-24 23:44:10.000000000 +1100
+++ linux-2.6.16-rc4/drivers/video/matrox/matroxfb_base.c	2006-02-27 19:26:26.000000000 +1100
@@ -1734,7 +1734,11 @@ static int initMatrox2(WPMINFO struct bo
 #endif	/* CONFIG_MTRR */
 
 	if (!ACCESS_FBINFO(devflags.novga))
-		request_region(0x3C0, 32, "matrox");
+		if (!request_region(0x3C0, 32, "matrox")) {
+			printk(KERN_ERR "matroxfb: failed to request_region");
+			err = -EBUSY;
+			goto failVideoIO;
+		}
 	matroxfb_g450_connect(PMINFO2);
 	ACCESS_FBINFO(hw_switch->reset(PMINFO2));
 



--===============8419001488576634==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8419001488576634==--
