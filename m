From: Clemens Buchacher <drizzd@aon.at>
Date: Sun, 19 Sep 2004 15:14:54 +0000
Subject: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <20040920150512.GA12577@kzelldran>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46184215924237582=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============46184215924237582==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description: __FUNCTION__ string concatenation is deprecated

Diff against linux-2.6 up to ChangeSet@1.1938 (04/09/18 20:30:01)

 arch/mips/au1000/common/usbdev.c |    4 ++--
 drivers/net/gt96100eth.c         |   10 +++++-----
 sound/oss/au1000.c               |    2 +-
 sound/oss/ite8172.c              |    2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

Status: untested

Signed-off-by: Clemens Buchacher <drizzd@aon.at>

# sound/oss/ite8172.c
#   2004/09/20 14:52:26+02:00 drizzd@aon.at +1 -1
#   __FUNCTION__ string concatenation is deprecated
# 
# sound/oss/au1000.c
#   2004/09/20 14:52:26+02:00 drizzd@aon.at +1 -1
#   __FUNCTION__ string concatenation is deprecated
# 
# drivers/net/gt96100eth.c
#   2004/09/20 14:52:26+02:00 drizzd@aon.at +5 -5
#   __FUNCTION__ string concatenation is deprecated
# 
# arch/mips/au1000/common/usbdev.c
#   2004/09/20 14:52:26+02:00 drizzd@aon.at +2 -2
#   __FUNCTION__ string concatenation is deprecated
# 
diff -Nru a/arch/mips/au1000/common/usbdev.c b/arch/mips/au1000/common/usbdev.c
--- a/arch/mips/au1000/common/usbdev.c	2004-09-20 15:14:54 +02:00
+++ b/arch/mips/au1000/common/usbdev.c	2004-09-20 15:14:54 +02:00
@@ -351,7 +351,7 @@
 {
 	u32 cs;
 
-	warn(__FUNCTION__);
+	warn("%s", __FUNCTION__);
 
 	cs = au_readl(ep->reg->ctrl_stat) | USBDEV_CS_STALL;
 	au_writel(cs, ep->reg->ctrl_stat);
@@ -363,7 +363,7 @@
 {
 	u32 cs;
 
-	warn(__FUNCTION__);
+	warn("%s", __FUNCTION__);
 
 	cs = au_readl(ep->reg->ctrl_stat) & ~USBDEV_CS_STALL;
 	au_writel(cs, ep->reg->ctrl_stat);
diff -Nru a/drivers/net/gt96100eth.c b/drivers/net/gt96100eth.c
--- a/drivers/net/gt96100eth.c	2004-09-20 15:14:54 +02:00
+++ b/drivers/net/gt96100eth.c	2004-09-20 15:14:54 +02:00
@@ -73,7 +73,7 @@
 static void dump_skb(int dbg_lvl, struct net_device *dev,
 		     struct sk_buff *skb);
 static void dump_hw_addr(int dbg_lvl, struct net_device *dev,
-			 const char* pfx, unsigned char* addr_str);
+			 const char* pfx, const char* func, unsigned char* addr_str);
 static void update_stats(struct gt96100_private *gp);
 static void abort(struct net_device *dev, u32 abort_bits);
 static void hard_stop(struct net_device *dev);
@@ -336,13 +336,13 @@
 
 static void
 dump_hw_addr(int dbg_lvl, struct net_device *dev, const char* pfx,
-	     unsigned char* addr_str)
+	     const char* func, unsigned char* addr_str)
 {
 	int i;
 	char buf[100], octet[5];
     
 	if (dbg_lvl <= GT96100_DEBUG) {
-		strcpy(buf, pfx);
+		sprintf(buf, pfx, func);
 		for (i = 0; i < 6; i++) {
 			sprintf(octet, "%2.2x%s",
 				addr_str[i], i<5 ? ":" : "\n");
@@ -710,7 +710,7 @@
 
 	info("%s found at 0x%x, irq %d\n",
 	     chip_name(gp->chip_rev), gtif->iobase, gtif->irq);
-	dump_hw_addr(0, dev, "HW Address ", dev->dev_addr);
+	dump_hw_addr(0, dev, "%s: HW Address ", __FUNCTION__, dev->dev_addr);
 	info("%s chip revision=%d\n", chip_name(gp->chip_rev), gp->chip_rev);
 	info("%s ethernet port %d\n", chip_name(gp->chip_rev), gp->port_num);
 	info("external PHY ID1=0x%04x, ID2=0x%04x\n", phy_id1, phy_id2);
@@ -1490,7 +1490,7 @@
 		gt96100_add_hash_entry(dev, dev->dev_addr);
 
 		for (mcptr = dev->mc_list; mcptr; mcptr = mcptr->next) {
-			dump_hw_addr(2, dev, __FUNCTION__ ": addr=",
+			dump_hw_addr(2, dev, "%s: addr=", __FUNCTION__,
 				     mcptr->dmi_addr);
 			gt96100_add_hash_entry(dev, mcptr->dmi_addr);
 		}
diff -Nru a/sound/oss/au1000.c b/sound/oss/au1000.c
--- a/sound/oss/au1000.c	2004-09-20 15:14:54 +02:00
+++ b/sound/oss/au1000.c	2004-09-20 15:14:54 +02:00
@@ -1317,7 +1317,7 @@
 	unsigned long   size;
 	int ret = 0;
 
-	dbg(__FUNCTION__);
+	dbg("%s", __FUNCTION__);
     
 	lock_kernel();
 	down(&s->sem);
diff -Nru a/sound/oss/ite8172.c b/sound/oss/ite8172.c
--- a/sound/oss/ite8172.c	2004-09-20 15:14:54 +02:00
+++ b/sound/oss/ite8172.c	2004-09-20 15:14:54 +02:00
@@ -1847,7 +1847,7 @@
 	struct it8172_state *s = (struct it8172_state *)file->private_data;
 
 #ifdef IT8172_VERBOSE_DEBUG
-	dbg(__FUNCTION__);
+	dbg("%s", __FUNCTION__);
 #endif
 	lock_kernel();
 	if (file->f_mode & FMODE_WRITE)

--===============46184215924237582==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46184215924237582==--
