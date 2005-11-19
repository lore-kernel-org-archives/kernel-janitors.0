From: Witold Rugowski <rugowski@nhw.pl>
Date: Sat, 19 Nov 2005 01:33:59 +0000
Subject: [KJ] [PATCH] sound/oss/maestro3.c printk args concatenation
Message-Id: <437E8107.2000103@nhw.pl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93677508969046963=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93677508969046963==
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Removed string concatenation in printk args

Signed-off-by: Witold Rugowski <rugowski@nhw.pl>

diff -urpN  linux-2.6.14.2/sound/oss/maestro3.c linux-2.6.14.2-wr/sound/oss/maestro3.c
--- linux-2.6.14.2/sound/oss/maestro3.c	Fri Nov 11 06:33:12 2005
+++ linux-2.6.14.2-wr/sound/oss/maestro3.c	Fri Nov 18 23:56:37 2005
@@ -2935,7 +2935,7 @@ static struct pci_driver m3_pci_driver =
 
 static int __init m3_init_module(void)
 {
-    printk(KERN_INFO PFX "version " DRIVER_VERSION " built at " __TIME__ " " __DATE__ "\n");
+    printk(KERN_INFO "%sversion %s built at %s %s\n",PFX,DRIVER_VERSION,__TIME__, __DATE__);
 
     if (register_reboot_notifier(&m3_reboot_nb)) {
         printk(KERN_WARNING PFX "reboot notifier registration failed\n");


-- 
Witold Rugowski
rugowski _at_ nhw.pl http://nhw.pl/blg/

--===============93677508969046963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93677508969046963==--
