From: Christophe Lucas <c.lucas@ifrance.com>
Date: Thu, 03 Feb 2005 08:12:44 +0000
Subject: [KJ] [PATCH] media/video/cx88*: convert pci_module_init to
Message-Id: <20050203081244.GB3185@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mxv5cy4qt+RJ9ypb"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="media_video_cx88.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/video/cx88/cx88-blackbird.c linux-2.6.11-rc2/drivers/media/video/cx88/cx88-blackbird.c
--- linux-2.6.11-rc2-vanilla/drivers/media/video/cx88/cx88-blackbird.c	2005-01-24 17:07:55.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/video/cx88/cx88-blackbird.c	2005-01-26 10:01:46.000000000 +0100
@@ -885,7 +885,7 @@ static int blackbird_init(void)
 	printk(KERN_INFO "cx2388x: snapshot date %04d-%02d-%02d\n",
 	       SNAPSHOT/10000, (SNAPSHOT/100)%100, SNAPSHOT%100);
 #endif
-	return pci_module_init(&blackbird_pci_driver);
+	return pci_register_driver(&blackbird_pci_driver);
 }
 
 static void blackbird_fini(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/video/cx88/cx88-dvb.c linux-2.6.11-rc2/drivers/media/video/cx88/cx88-dvb.c
--- linux-2.6.11-rc2-vanilla/drivers/media/video/cx88/cx88-dvb.c	2005-01-24 17:07:55.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/video/cx88/cx88-dvb.c	2005-01-26 10:01:54.000000000 +0100
@@ -319,7 +319,7 @@ static int dvb_init(void)
 	printk(KERN_INFO "cx2388x: snapshot date %04d-%02d-%02d\n",
 	       SNAPSHOT/10000, (SNAPSHOT/100)%100, SNAPSHOT%100);
 #endif
-	return pci_module_init(&dvb_pci_driver);
+	return pci_register_driver(&dvb_pci_driver);
 }
 
 static void dvb_fini(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/video/cx88/cx88-video.c linux-2.6.11-rc2/drivers/media/video/cx88/cx88-video.c
--- linux-2.6.11-rc2-vanilla/drivers/media/video/cx88/cx88-video.c	2005-01-26 08:31:14.000000000 +0100
+++ linux-2.6.11-rc2/drivers/media/video/cx88/cx88-video.c	2005-01-26 10:02:03.000000000 +0100
@@ -2254,7 +2254,7 @@ static int cx8800_init(void)
 	printk(KERN_INFO "cx2388x: snapshot date %04d-%02d-%02d\n",
 	       SNAPSHOT/10000, (SNAPSHOT/100)%100, SNAPSHOT%100);
 #endif
-	return pci_module_init(&cx8800_pci_driver);
+	return pci_register_driver(&cx8800_pci_driver);
 }
 
 static void cx8800_fini(void)

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--mxv5cy4qt+RJ9ypb--
