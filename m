From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 16:33:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 27/38] net/orinoco_tmd: replace
Message-Id: <20040924163320.GC1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41676772693320735=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040923220302.GB5260@us.ibm.com>
In-Reply-To: <20040923220302.GB5260@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============41676772693320735==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wireless/orinoco_tmd.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wireless/orinoco_tmd.c	2004-09-24 09:32:29.000000000 -0700
@@ -72,6 +72,7 @@
 #include <linux/list.h>
 #include <linux/pci.h>
 #include <linux/fcntl.h>
+#include <linux/delay.h>
 
 #include <pcmcia/cisreg.h>
 
@@ -218,8 +219,7 @@ static int __init orinoco_tmd_init(void)
 static void __exit orinoco_tmd_exit(void)
 {
 	pci_unregister_driver(&orinoco_tmd_driver);
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	ssleep(1);
 }
 
 module_init(orinoco_tmd_init);

--===============41676772693320735==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41676772693320735==--
