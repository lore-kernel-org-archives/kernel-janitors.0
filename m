From: Steve Longerbeam <stevel@mvista.com>
Date: Tue, 05 Oct 2004 16:51:48 +0000
Subject: [Kernel-janitors] Re: [PATCH] net/gt96100eth: replace
Message-Id: <4162D124.4020403@mvista.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24064601283485176=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============24064601283485176==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nishanth,

I was away from this email address for about 3 months, so sorry
for the very late reply. The patch to replace with msleep() should
work fine in this driver. As for the 1 vs. 20 msec discrepancy in
code and comment, it's been so long since I wrote this driver that
I can't quite remember, but I do believe it was tested as is, so the
code is correct, and the comment is in error. Hope that helps.

Steve


Nishanth Aravamudan wrote:

>I would appreciate any comments from the janitors list. This is one (of
>many) cases where I made a decision about replacing
>
>set_current_state(TASK_INTERRUPTIBLE);
>schedule_timeout(some_time);
>
>with
>
>msleep(jiffies_to_msecs(some_time));
>
>msleep() is not exactly the same as the previous code, but I only did
>this replacement where I thought long delays were *desired*. If this is
>not the case here, then just disregard this patch. 
>
>Thanks,
>Nish
>
>PS. In this patch, the last delay is a bit confusing. It, in code,
>delayed for 1 msec, but the comment said 20 msecs, does anyone know
>which it should be?
>
>
>
>Applys-to: 2.6.7
>
>Description: Replace gt96100_delay() with msleep() to guarantee the
>task delays for the desired time. Remove the definition of
>gt96100_delay().
>
>Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
>
>--- linux-vanilla/drivers/net/gt96100eth.c	2004-06-15 22:19:44.000000000 -0700
>+++ linux-dev/drivers/net/gt96100eth.c	2004-07-27 10:03:08.000000000 -0700
>@@ -60,7 +60,6 @@
> // prototypes
> static void* dmaalloc(size_t size, dma_addr_t *dma_handle);
> static void dmafree(size_t size, void *vaddr);
>-static void gt96100_delay(int msec);
> static int gt96100_add_hash_entry(struct net_device *dev,
> 				  unsigned char* addr);
> static void read_mib_counters(struct gt96100_private *gp);
>@@ -193,17 +192,6 @@ dmafree(size_t size, void *vaddr)
> 
> 
> 
>-static void
>-gt96100_delay(int ms)
>-{
>-	if (in_interrupt())
>-		return;
>-	else {
>-		current->state = TASK_INTERRUPTIBLE;
>-		schedule_timeout(ms*HZ/1000);
>-	}
>-}
>-
> static int
> parse_mac_addr(struct net_device *dev, char* macstr)
> {
>@@ -249,7 +237,7 @@ read_MII(int phy_addr, u32 reg)
> 	// wait for last operation to complete
> 	while (GT96100_READ(GT96100_ETH_SMI_REG) & smirBusy) {
> 		// snooze for 1 msec and check again
>-		gt96100_delay(1);
>+		msleep(1);
> 
> 		if (--timedout == 0) {
> 			printk(KERN_ERR "%s: busy timeout!!\n", __FUNCTION__);
>@@ -263,7 +251,7 @@ read_MII(int phy_addr, u32 reg)
> 	// wait for read to complete
> 	while (!((smir = GT96100_READ(GT96100_ETH_SMI_REG)) & smirReadValid)) {
> 		// snooze for 1 msec and check again
>-		gt96100_delay(1);
>+		msleep(1);
> 	
> 		if (--timedout == 0) {
> 			printk(KERN_ERR "%s: timeout!!\n", __FUNCTION__);
>@@ -315,7 +303,7 @@ write_MII(int phy_addr, u32 reg, u16 dat
> 	// wait for last operation to complete
> 	while (GT96100_READ(GT96100_ETH_SMI_REG) & smirBusy) {
> 		// snooze for 1 msec and check again
>-		gt96100_delay(1);
>+		msleep(1);
> 	
> 		if (--timedout == 0) {
> 			printk(KERN_ERR "%s: busy timeout!!\n", __FUNCTION__);
>@@ -567,7 +555,7 @@ abort(struct net_device *dev, u32 abort_
> 	// wait for abort to complete
> 	while (GT96100ETH_READ(gp, GT96100_ETH_SDMA_COMM) & abort_bits) {
> 		// snooze for 20 msec and check again
>-		gt96100_delay(1);
>+		msleep(20); // was gt96100_delay(1) -> should it be 20 or 1?
> 	
> 		if (--timedout == 0) {
> 			err("%s: timeout!!\n", __FUNCTION__);
>  
>


--===============24064601283485176==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24064601283485176==--
