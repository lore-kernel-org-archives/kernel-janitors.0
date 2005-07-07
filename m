From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:36 +0000
Subject: [KJ] [patch 2.6.13-rc1 02/23] Audit return code of create_proc_*
Message-Id: <20050707154518.886592000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62238803146911925=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============62238803146911925==
Content-Disposition: inline;
	filename=proc_create_drivers_net_wireless_atmel.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/drivers/net/wireless/atmel.c 2.6.13-rc1/drivers/net/wireless/atmel.c
--- 2.6.13-rc1.orig/drivers/net/wireless/atmel.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/drivers/net/wireless/atmel.c	2005-07-05 11:25:03.189441296 +0200
@@ -1507,6 +1507,7 @@ static int atmel_read_proc(char *page, c
 struct net_device *init_atmel_card( unsigned short irq, int port, const AtmelFWType fw_type,  
 				    struct device *sys_dev, int (*card_present)(void *), void *card)
 {
+	struct proc_dir_entry* ent;
 	struct net_device *dev;
 	struct atmel_private *priv;
 	int rc;
@@ -1621,7 +1622,9 @@ struct net_device *init_atmel_card( unsi
 	
 	netif_carrier_off(dev);
 	
-	create_proc_read_entry ("driver/atmel", 0, NULL, atmel_read_proc, priv);	
+	ent = create_proc_read_entry ("driver/atmel", 0, NULL, atmel_read_proc, priv);	
+	if (!ent)
+		printk(KERN_WARNING "atmel: Unable to create /proc entry.\n");
 	
 	printk(KERN_INFO "%s: Atmel at76c50x wireless. Version %d.%d simon@thekelleys.org.uk\n",
 	       dev->name, DRIVER_MAJOR, DRIVER_MINOR);

--

--===============62238803146911925==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62238803146911925==--
