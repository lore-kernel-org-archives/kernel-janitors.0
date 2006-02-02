From: walter harms <wharms@bfs.de>
Date: Thu, 02 Feb 2006 13:35:22 +0000
Subject: [KJ] hamradio/bpqether.c: check return value of
Message-Id: <43E20A9A.2070007@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050409020603070105050000"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050409020603070105050000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

check the return value of register_netdevice_notifier()


also as attachment if something mangels the layout.
compile tested
Signed-off-by: walter harms <wharms@bfs.de>

--- linux/drivers/net/hamradio/bpqether.c.bak	2006-02-01 
22:13:07.000000000 +0100
+++ linux/drivers/net/hamradio/bpqether.c	2006-02-01 22:30:16.000000000 
+0100
@@ -595,6 +595,7 @@
   */
  static int __init bpq_init_driver(void)
  {
+	int ret;
  #ifdef CONFIG_PROC_FS
  	if (!proc_net_fops_create("bpqether", S_IRUGO, &bpq_info_fops)) {
  		printk(KERN_ERR
@@ -605,7 +606,12 @@

  	dev_add_pack(&bpq_packet_type);

-	register_netdevice_notifier(&bpq_dev_notifier);
+	ret = register_netdevice_notifier(&bpq_dev_notifier);
+	if (ret < 0) {
+		printk( KERN_WARNING "register_netdevice_notifier failed in 
%s\n",__FUNCTION__);
+		dev_remove_pack(&bpq_packet_type);
+		return -1;
+	}

  	printk(banner);


--------------050409020603070105050000
Content-Type: text/x-patch;
 name="bpqether.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bpqether.c.diff"

--- linux/drivers/net/hamradio/bpqether.c.bak	2006-02-01 22:13:07.000000000 +0100
+++ linux/drivers/net/hamradio/bpqether.c	2006-02-01 22:30:16.000000000 +0100
@@ -595,6 +595,7 @@
  */
 static int __init bpq_init_driver(void)
 {
+	int ret;
 #ifdef CONFIG_PROC_FS
 	if (!proc_net_fops_create("bpqether", S_IRUGO, &bpq_info_fops)) {
 		printk(KERN_ERR
@@ -605,7 +606,12 @@
 
 	dev_add_pack(&bpq_packet_type);
 
-	register_netdevice_notifier(&bpq_dev_notifier);
+	ret = register_netdevice_notifier(&bpq_dev_notifier);
+	if (ret < 0) {
+		printk( KERN_WARNING "register_netdevice_notifier failed in %s\n",__FUNCTION__);
+		dev_remove_pack(&bpq_packet_type);
+		return -1;
+	}
 
 	printk(banner);
 

--------------050409020603070105050000
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050409020603070105050000--
