From: Chuck Short <zulcss@gmail.com>
Date: Mon, 28 Mar 2005 21:16:20 +0000
Subject: [KJ] [Patch 2/3] Adds module version to 3c503.
Message-Id: <27c823430503281316e97de34@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description: This patch adds MODULE_VERSION to 3c503.

Signed-off-by: Chuck Short <zulcss@gmail.com>

diff -Naur linux-2.6.12-rc1.orig/drivers/net/3c503.c
linux-2.6.12-rc1/drivers/net/3c503.c
--- linux-2.6.12-rc1.orig/drivers/net/3c503.c   2005-03-27
09:44:51.000000000 -0500
+++ linux-2.6.12-rc1/drivers/net/3c503.c        2005-03-27
13:06:27.000000000 -0500
@@ -693,6 +693,7 @@
 MODULE_PARM_DESC(irq, "IRQ number(s) (assigned)");
 MODULE_PARM_DESC(xcvr, "transceiver(s) (0=internal, 1=external)");
 MODULE_DESCRIPTION("3Com ISA EtherLink II, II/16 (3c503, 3c503/16) driver");
+MODULE_VERSION(DRV_VERSION);
 MODULE_LICENSE("GPL");

 /* This is set up so that only a single autoprobe takes place per call.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
