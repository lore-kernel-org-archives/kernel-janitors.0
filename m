From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:01:10 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 26/38] net/orinoco_plx: replace
Message-Id: <20040923220110.GA5260@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35207117388812792=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35207117388812792==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wireless/orinoco_plx.c	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wireless/orinoco_plx.c	2004-09-23 14:59:42.000000000 -0700
@@ -136,6 +136,7 @@
 #include <linux/list.h>
 #include <linux/pci.h>
 #include <linux/fcntl.h>
+#include <linux/delay.h>
 
 #include <pcmcia/cisreg.h>
 
@@ -352,8 +353,7 @@ static int __init orinoco_plx_init(void)
 static void __exit orinoco_plx_exit(void)
 {
 	pci_unregister_driver(&orinoco_plx_driver);
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	ssleep(1);
 }
 
 module_init(orinoco_plx_init);

--===============35207117388812792==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35207117388812792==--
