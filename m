From: Douglas Schilling Landgraf <dougsland@gmail.com>
Date: Sun, 25 Feb 2007 16:57:41 +0000
Subject: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <20070225173528.GB3595@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use strncpy instead of strcpy.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

Index: linux-2.6.20.1/drivers/net/3c505.c
=================================--- linux-2.6.20.1.orig/drivers/net/3c505.c
+++ linux-2.6.20.1/drivers/net/3c505.c
@@ -1154,8 +1154,8 @@ static struct net_device_stats *elp_get_
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strcpy(info->driver, DRV_NAME);
-	strcpy(info->version, DRV_VERSION);
+	strncpy(info->driver, DRV_NAME, sizeof(info->driver)-1);
+	strncpy(info->version, DRV_VERSION, sizeof(info->driver)-1);
 	sprintf(info->bus_info, "ISA 0x%lx", dev->base_addr);
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
