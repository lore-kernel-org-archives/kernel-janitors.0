From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:45:24 +0000
Subject: [Kernel-janitors] [PATCH] net/lanstreamer: replace
Message-Id: <20040727204524.GB3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21403447938736564=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============21403447938736564==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/tokenring/lanstreamer.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/net/tokenring/lanstreamer.c	2004-07-12 21:44:46.000000000 +0000
@@ -450,8 +450,7 @@ static int streamer_reset(struct net_dev
 	writew(readw(streamer_mmio + BCTL) | BCTL_SOFTRESET, streamer_mmio + BCTL);
 	t = jiffies;
 	/* Hold soft reset bit for a while */
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	msleep(1000);
 	
 	writew(readw(streamer_mmio + BCTL) & ~BCTL_SOFTRESET,
 	       streamer_mmio + BCTL);
@@ -507,8 +506,7 @@ static int streamer_reset(struct net_dev
 	writew(SISR_MI, streamer_mmio + SISR_MASK_SUM);
 
 	while (!((readw(streamer_mmio + SISR)) & SISR_SRB_REPLY)) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep(100);
 		if (jiffies - t > 40 * HZ) {
 			printk(KERN_ERR
 			       "IBM PCI tokenring card not responding\n");

--===============21403447938736564==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21403447938736564==--
