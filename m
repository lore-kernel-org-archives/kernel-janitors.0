From: Chuck Short <zulcss@gmail.com>
Date: Mon, 28 Mar 2005 21:17:39 +0000
Subject: [KJ] [Patch 3/3] Add module version to amd8111e.c
Message-Id: <27c8234305032813171ca5eb86@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: This patch adds MODULE_VERSION to amd8111e

Signed-off-by: Chuck Short <zulcss@gmail.com>

diff -Naur linux-2.6.12-rc1.orig/drivers/net/amd8111e.c
linux-2.6.12-rc1/drivers/net/amd8111e.c
--- linux-2.6.12-rc1.orig/drivers/net/amd8111e.c        2005-03-27
09:44:51.000000000 -0500
+++ linux-2.6.12-rc1/drivers/net/amd8111e.c     2005-03-27
13:12:29.000000000 -0500
@@ -105,6 +105,7 @@
 MODULE_AUTHOR("Advanced Micro Devices, Inc.");
 MODULE_DESCRIPTION ("AMD8111 based 10/100 Ethernet Controller. Driver
Version 3.0.3");
 MODULE_LICENSE("GPL");
+MODULE_VERSION(MODULE_VERS);
 MODULE_DEVICE_TABLE(pci, amd8111e_pci_tbl);
 module_param_array(speed_duplex, int, NULL, 0);
 MODULE_PARM_DESC(speed_duplex, "Set device speed and duplex modes, 0:
Auto Negotitate, 1: 10Mbps Half Duplex, 2: 10Mbps Full Duplex, 3:
100Mbps Half Duplex, 4: 100Mbps Full Duplex");
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
