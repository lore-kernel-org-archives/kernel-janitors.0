From: walter harms <wharms@bfs.de>
Date: Thu, 09 Feb 2006 09:35:09 +0000
Subject: [KJ] net/bonding/bond_main.c:check return code of
Message-Id: <43EB0CCD.7030904@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000903010504030204010605"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000903010504030204010605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

check return code of 'register_netdevice_notifier'
note that the  register_inetaddr_notifier is not checked.


Signed-off-by: walter harms <wharms@bfs.de>

--- linux/drivers/net/bonding/bond_main.c.bak	2006-02-01 
22:13:29.000000000 +0100
+++ linux/drivers/net/bonding/bond_main.c	2006-02-01 22:41:31.000000000 
+0100
@@ -4893,7 +4893,14 @@
  	}

  	rtnl_unlock();
-	register_netdevice_notifier(&bond_netdev_notifier);
+
+	res = register_netdevice_notifier(&bond_netdev_notifier);
+
+	if (res < 0) {
+		printk( KERN_WARNING DRV_NAME" register_netdevice_notifier failed\n");
+		goto out_err;
+	}
+
  	register_inetaddr_notifier(&bond_inetaddr_notifier);

  	return 0;

--------------000903010504030204010605
Content-Type: text/x-patch;
 name="bond_main.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="bond_main.c.diff"

--- linux/drivers/net/bonding/bond_main.c.bak	2006-02-01 22:13:29.000000000 +0100
+++ linux/drivers/net/bonding/bond_main.c	2006-02-01 22:41:31.000000000 +0100
@@ -4893,7 +4893,14 @@
 	}
 
 	rtnl_unlock();
-	register_netdevice_notifier(&bond_netdev_notifier);
+
+	res = register_netdevice_notifier(&bond_netdev_notifier);
+
+	if (res < 0) {
+		printk( KERN_WARNING DRV_NAME" register_netdevice_notifier failed\n");
+		goto out_err;
+	}
+
 	register_inetaddr_notifier(&bond_inetaddr_notifier);
 
 	return 0;

--------------000903010504030204010605
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000903010504030204010605--
