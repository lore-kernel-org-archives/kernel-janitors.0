From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 05 Oct 2004 17:09:38 +0000
Subject: [Kernel-janitors] Re: [PATCH] net/gt96100eth: replace
Message-Id: <20041005170938.GB1825@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13851141106281273=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4162D124.4020403@mvista.com>
In-Reply-To: <4162D124.4020403@mvista.com>
To: kernel-janitors@vger.kernel.org

--===============13851141106281273==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Steve,

> I was away from this email address for about 3 months, so sorry
> for the very late reply. The patch to replace with msleep() should
> work fine in this driver. As for the 1 vs. 20 msec discrepancy in
> code and comment, it's been so long since I wrote this driver that
> I can't quite remember, but I do believe it was tested as is, so the
> code is correct, and the comment is in error. Hope that helps.

Thanks for replying period :) I went ahead and sent another patch more
recently (as the first hadn't been merged upstream yet) which used
msleep_interruptible() instead of msleep() [closer to original code];
however, if it really is ok (I just want excessive confirmation, I
guess), to use msleep() in those places, then I will go back to the
original patch.

Taking into account your statement regarding the comment, I went ahead
and changed the comment and code to match in the following patch, which
should be the only one applied. Thanks again!

-Nish

Description: Uses msleep_interruptible() instead of gt96100_delay() to
guarantee the task delays as expected. According to Steve Longerbeam,
the comment in abort() is incorrect and the task should be sleeping for
1 msec; the code and comment both reflect this now.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/gt96100eth.c	2004-09-13 17:15:45.000000000 -0700
+++ 2.6.9-rc2/drivers/net/gt96100eth.c	2004-10-05 10:04:22.000000000 -0700
@@ -59,7 +59,6 @@
 // prototypes
 static void* dmaalloc(size_t size, dma_addr_t *dma_handle);
 static void dmafree(size_t size, void *vaddr);
-static void gt96100_delay(int msec);
 static int gt96100_add_hash_entry(struct net_device *dev,
 				  unsigned char* addr);
 static void read_mib_counters(struct gt96100_private *gp);
@@ -183,16 +182,6 @@ static void dmafree(size_t size, void *v
 	free_pages((unsigned long)vaddr, get_order(size));
 }
 
-static void gt96100_delay(int ms)
-{
-	if (in_interrupt())
-		return;
-	else {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(ms*HZ/1000);
-	}
-}
-
 static int
 parse_mac_addr(struct net_device *dev, char* macstr)
 {
@@ -238,7 +227,7 @@ read_MII(int phy_addr, u32 reg)
 	// wait for last operation to complete
 	while (GT96100_READ(GT96100_ETH_SMI_REG) & smirBusy) {
 		// snooze for 1 msec and check again
-		gt96100_delay(1);
+		msleep_interruptible(1);
 
 		if (--timedout == 0) {
 			printk(KERN_ERR "%s: busy timeout!!\n", __FUNCTION__);
@@ -252,7 +241,7 @@ read_MII(int phy_addr, u32 reg)
 	// wait for read to complete
 	while (!((smir = GT96100_READ(GT96100_ETH_SMI_REG)) & smirReadValid)) {
 		// snooze for 1 msec and check again
-		gt96100_delay(1);
+		msleep_interruptible(1);
 	
 		if (--timedout == 0) {
 			printk(KERN_ERR "%s: timeout!!\n", __FUNCTION__);
@@ -304,7 +293,7 @@ write_MII(int phy_addr, u32 reg, u16 dat
 	// wait for last operation to complete
 	while (GT96100_READ(GT96100_ETH_SMI_REG) & smirBusy) {
 		// snooze for 1 msec and check again
-		gt96100_delay(1);
+		msleep_interruptible(1);
 	
 		if (--timedout == 0) {
 			printk(KERN_ERR "%s: busy timeout!!\n", __FUNCTION__);
@@ -527,8 +516,8 @@ abort(struct net_device *dev, u32 abort_
 
 	// wait for abort to complete
 	while (GT96100ETH_READ(gp, GT96100_ETH_SDMA_COMM) & abort_bits) {
-		// snooze for 20 msec and check again
-		gt96100_delay(1);
+		// snooze for 1 msec and check again
+		msleep_interruptible(1);
 	
 		if (--timedout == 0) {
 			err("%s: timeout!!\n", __FUNCTION__);

--===============13851141106281273==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13851141106281273==--
