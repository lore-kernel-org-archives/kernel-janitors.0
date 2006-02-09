From: walter harms <wharms@bfs.de>
Date: Thu, 09 Feb 2006 09:46:11 +0000
Subject: [KJ] net/wan/lapbether.c:check return code of
Message-Id: <43EB0F63.1090706@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi all,
if the patches for bond_main.c,bpqether.c,dlci.c,lapbether.c and
pppoe.c are applied no more uncecked register_netdevice_notifier()
should be exist. i did a test compile with all patches and found no
ill effects.

check return code of register_netdevice_notifier.

Signed-off-by: walter harms <wharms@bfs.de>

--- linux/drivers/net/wan/lapbether.c.bak	2006-02-01 22:09:28.000000000 
+0100
+++ linux/drivers/net/wan/lapbether.c	2006-02-01 22:14:41.000000000 +0100
@@ -432,9 +432,15 @@

  static int __init lapbeth_init_driver(void)
  {
+	int ret;
  	dev_add_pack(&lapbeth_packet_type);

-	register_netdevice_notifier(&lapbeth_dev_notifier);
+	ret = register_netdevice_notifier(&lapbeth_dev_notifier);
+	if (ret < 0) {
+		printk( KERN_WARNING "register_netdevice_notifier failed in 
%s\n",__FUNCTION__);
+		dev_remove_pack(&lapbeth_packet_type);
+		return -1;
+	}

  	printk(banner);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
