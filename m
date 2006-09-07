From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Thu, 07 Sep 2006 10:07:34 +0000
Subject: [KJ] [Patch][update] remove dead code in bcm43xx_sysfs.c
Message-Id: <1157623654.22555.27.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1157614059.22555.19.camel@localhost.localdomain>
In-Reply-To: <1157614059.22555.19.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: mb@bu3sch.de, NetDev <netdev@vger.kernel.org>

G'day people

Coverity CID 1160 & 1161

These are probably fixed in some external tree, but in case they are
not, here is a patch

Compile tested with allyesconfig

Remove some dead cose from bcm43xx_sysfs.c in 2.6.18-rc6

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
--- drivers/net/wireless/bcm43xx/bcm43xx_sysfs.c.orig	2006-09-07 15:40:33.000000000 +1000
+++ drivers/net/wireless/bcm43xx/bcm43xx_sysfs.c	2006-09-07 17:35:18.000000000 +1000
@@ -251,7 +251,6 @@ static ssize_t bcm43xx_attr_preamble_sho
 					  char *buf)
 {
 	struct bcm43xx_private *bcm = dev_to_bcm(dev);
-	int err;
 	ssize_t count;
 
 	if (!capable(CAP_NET_ADMIN))
@@ -264,10 +263,9 @@ static ssize_t bcm43xx_attr_preamble_sho
 	else
 		count = snprintf(buf, PAGE_SIZE, "0 (Short Preamble disabled)\n");
 
-	err = 0;
 	bcm43xx_unlock_noirq(bcm);
 
-	return err ? err : count;
+	return count;
 }
 
 static ssize_t bcm43xx_attr_preamble_store(struct device *dev,
@@ -276,7 +274,6 @@ static ssize_t bcm43xx_attr_preamble_sto
 {
 	struct bcm43xx_private *bcm = dev_to_bcm(dev);
 	unsigned long flags;
-	int err;
 	int value;
 
 	if (!capable(CAP_NET_ADMIN))
@@ -289,10 +286,9 @@ static ssize_t bcm43xx_attr_preamble_sto
 
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
