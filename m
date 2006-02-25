From: walter harms <wharms@bfs.de>
Date: Sat, 25 Feb 2006 12:40:30 +0000
Subject: [KJ] bonding/bond_main.c: check return value of
Message-Id: <4400503E.3020305@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43E20B2F.8050109@bfs.de>
In-Reply-To: <43E20B2F.8050109@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 >hi list,
 > my next improved patch. please note
 > * struct net_device *bond_dev=NULL; to prevend gcc from complaining
 > * max_bonds is atleast 1 so i should be initialised always
 > * better error handling (freeing ALL resources in case of error now)
 > * KERN_ERR instead of KERN_WARNING
* less lines more space :)

 >
 > The driver does no unregister_netdevice() i did not understand why so i
 > left it in this state. The two labels are not a mistake they simply
 > illustrate that this is an error exit for two different errors.
 > alexey, if you realy do not like it, simple remove them.
 >
 > re,
 >   walter
ps:
	i admit i did not test-compile it since it is only a fmt issue.


Signed-off-by: walter harms <wharms@bfs.de>

--- linux-2.6.15.4/drivers/net/bonding/bond_main.c.bak	2006-02-10 
08:22:48.000000000 +0100
+++ linux-2.6.15.4/drivers/net/bonding/bond_main.c	2006-02-25 
13:36:10.000000000 +0100
@@ -4884,6 +4884,7 @@
  static int __init bonding_init(void)
  {
  	struct bond_params params;
+	struct net_device *bond_dev = NULL;
  	int i;
  	int res;

@@ -4901,8 +4902,6 @@
  #endif

  	for (i = 0; i < max_bonds; i++) {
-		struct net_device *bond_dev;
-
  		bond_dev = alloc_netdev(sizeof(struct bonding), "", ether_setup);
  		if (!bond_dev) {
  			res = -ENOMEM;
@@ -4929,18 +4928,29 @@

  		res = register_netdevice(bond_dev);
  		if (res < 0) {
-			bond_deinit(bond_dev);
-			free_netdev(bond_dev);
-			goto out_err;
+			goto out_no_netdevice;
  		}
  	}

  	rtnl_unlock();
-	register_netdevice_notifier(&bond_netdev_notifier);
+	res = register_netdevice_notifier(&bond_netdev_notifier);
+	if (res < 0) {
+		printk( KERN_ERR DRV_NAME" register_netdevice_notifier failed\n");
+		
+		goto out_no_nd_notifier;
+	}
+
+
  	register_inetaddr_notifier(&bond_inetaddr_notifier);

  	return 0;

+out_no_nd_notifier:
+
+out_no_netdevice:
+	bond_deinit(bond_dev);
+	free_netdev(bond_dev);
+
  out_err:
  	/*
  	 * rtnl_unlock() will run netdev_run_todo(), putting the
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
