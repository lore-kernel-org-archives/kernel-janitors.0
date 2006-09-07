From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Thu, 07 Sep 2006 07:27:39 +0000
Subject: [KJ] [Patch] remove dead code in bcm43xx_sysfs.c
Message-Id: <1157614059.22555.19.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: mb@bu3sch.de, NetDev <netdev@vger.kernel.org>

G'day people,

Coverity CID 1161

This is probably fixed in some external tree, but in case it isn't, here is a patch


Compile tested with allyesconfig


Remove some dead code from bcm43xx_sysfs.c in 2.6.18-rc6

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- drivers/net/wireless/bcm43xx/bcm43xx_sysfs.c.orig	2006-09-07 15:40:33.000000000 +1000
+++ drivers/net/wireless/bcm43xx/bcm43xx_sysfs.c	2006-09-07 15:42:02.000000000 +1000
@@ -276,7 +276,6 @@ static ssize_t bcm43xx_attr_preamble_sto
 {
 	struct bcm43xx_private *bcm = dev_to_bcm(dev);
 	unsigned long flags;
-	int err;
 	int value;
 
 	if (!capable(CAP_NET_ADMIN))
@@ -289,10 +288,9 @@ static ssize_t bcm43xx_attr_preamble_sto
 
 	bcm->short_preamble = !!value;
 
-	err = 0;
 	bcm43xx_unlock_irqsafe(bcm, flags);
 
-	return err ? err : count;
+	return count;
 }
 
 static DEVICE_ATTR(shortpreamble, 0644,


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
