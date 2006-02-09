From: walter harms <wharms@bfs.de>
Date: Thu, 09 Feb 2006 09:41:30 +0000
Subject: [KJ] net/wan/dlci.c:check return code of
Message-Id: <43EB0E4A.5080302@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

check return code of 'register_netdevice_notifier'

Signed-off-by: walter harms <wharms@bfs.de>


--- linux/drivers/net/wan/dlci.c.bak	2006-02-01 22:12:53.000000000 +0100
+++ linux/drivers/net/wan/dlci.c	2006-02-01 23:25:40.776811592 +0100
@@ -535,8 +535,14 @@

  static int __init init_dlci(void)
  {
+	int ret;
  	dlci_ioctl_set(dlci_ioctl);
-	register_netdevice_notifier(&dlci_notifier);
+	ret=register_netdevice_notifier(&dlci_notifier);
+	if (ret < 0) {
+		printk( KERN_WARNING "register_netdevice_notifier failed in 
%s\n",__FUNCTION__);
+		dlci_ioctl_set(NULL);
+		return -1;
+	}

  	printk("%s.\n", version);



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
