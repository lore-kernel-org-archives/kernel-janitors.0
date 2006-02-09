From: walter harms <wharms@bfs.de>
Date: Thu, 09 Feb 2006 09:38:50 +0000
Subject: [KJ] net/hamradio/bpqether.c: check the return code of
Message-Id: <43EB0DAA.1060300@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

check the return code of register_netdevice_notifier.
fix for the last patch. now it removes the proc entry also.

Signed-off-by: walter harms <wharms@bfs.de>

--- linux/drivers/net/hamradio/bpqether.c.bak	2006-02-01 
22:13:07.000000000 +0100
+++ linux/drivers/net/hamradio/bpqether.c	2006-02-06 22:10:24.819769200 
+0100
@@ -595,6 +595,7 @@
   */
  static int __init bpq_init_driver(void)
  {
+	int ret;
  #ifdef CONFIG_PROC_FS
  	if (!proc_net_fops_create("bpqether", S_IRUGO, &bpq_info_fops)) {
  		printk(KERN_ERR
@@ -605,7 +606,13 @@

  	dev_add_pack(&bpq_packet_type);

-	register_netdevice_notifier(&bpq_dev_notifier);
+	ret = register_netdevice_notifier(&bpq_dev_notifier);
+	if (ret < 0) {
+		printk( KERN_ERR "register_netdevice_notifier failed in 
%s\n",__FUNCTION__);
+		dev_remove_pack(&bpq_packet_type);
+		proc_net_remove("bpqether");
+		return -1;
+	}

  	printk(banner);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
