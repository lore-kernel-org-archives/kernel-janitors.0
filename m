From: walter harms <wharms@bfs.de>
Date: Thu, 09 Feb 2006 09:29:53 +0000
Subject: [KJ] net/pppoe.c: check return code of register_netdevice_notifier
Message-Id: <43EB0B91.5060205@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

check return code of register_netdevice_notifier.
do propper cleanup and say goodbye

Signed-off-by: walter harms <wharms@bfs.de>

--- linux/drivers/net/pppoe.c.bak	2006-02-01 22:13:41.000000000 +0100
+++ linux/drivers/net/pppoe.c	2006-02-01 22:16:56.000000000 +0100
@@ -1126,7 +1126,16 @@
  	
  	dev_add_pack(&pppoes_ptype);
  	dev_add_pack(&pppoed_ptype);
-	register_netdevice_notifier(&pppoe_notifier);
+
+	err = register_netdevice_notifier(&pppoe_notifier);
+	if (err < 0) {
+		printk( KERN_WARNING "register_netdevice_notifier failed in 
%s\n",__FUNCTION__);
+		dev_remove_pack(&pppoed_ptype);
+		dev_remove_pack(&pppoes_ptype);
+		goto out_unregister_pppox_proto;
+	}
+	
+
  out:
  	return err;
  out_unregister_pppox_proto:
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
