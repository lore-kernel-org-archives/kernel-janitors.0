From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 16 Jan 2004 23:24:18 +0000
Subject: [Kernel-janitors] [PATCH]  tc35815.c iomap/unmap audit
Message-Id: <1074295458.12959.101.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Patch to check if ioremap() failed.  If so, handle error accordingly. 
Was unable to test so feedback appreciated.

diffed against 2.6.1

Leann

=== drivers/net/tc35815.c 1.15 vs edited ==--- 1.15/drivers/net/tc35815.c	Thu Sep 11 15:46:11 2003
+++ edited/drivers/net/tc35815.c	Fri Jan 16 11:10:59 2004
@@ -554,6 +554,11 @@
 	dev->irq = irq;
 	dev->base_addr = (unsigned long)ioremap(base_addr,
 						sizeof(struct tc35815_regs));
+	if (!dev->base_addr) {
+		unregister_netdev(dev);
+		free_netdev(dev);
+		return -ENOMEM;
+	}
 	tr = (struct tc35815_regs*)dev->base_addr;
 
 	tc35815_chip_reset(dev);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
