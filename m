From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 19:15:16 +0000
Subject: [KJ] [PATCH 3/22] block/cciss: replace schedule_timeout() with
Message-Id: <20050117191516.GC24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68428295854191035=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68428295854191035==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

I used msleep(10) here under the presumption that the schedule_timeout(1) was
written assuming that HZ=100 (as it used to be), which is
equivalent to 10 milliseconds. If the desire is actually for 1 ms or the minimal
sleep interval, then the patch can be changed appropriately. A similar assumption
as to the constant delay value was made in the other replacement, which can also
be appropriately adjusted.

Description: Change the delay logic in pollcomplete() to use msleep() and
time_before(). Instead of assuming schedule_timeout() will sleep exactly as
requested, use msleep(10) to guarantee minimally 10 millisecond increments and
time_before() to guarantee stopping the loop as close to 20 seconds as possible.
Also changes another occurrence of schedule_timeout() to msleep().
TASK_INTERRUPTIBLE is used in this case, but signals are not handled. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/block/cciss.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/block/cciss.c	2005-01-17 10:33:44.000000000 -0800
@@ -1729,17 +1729,15 @@ static int cciss_revalidate(struct gendi
 static unsigned long pollcomplete(int ctlr)
 {
 	unsigned long done;
-	int i;
+	unsigned long end_jiffies = jiffies + 20 * HZ;
 
 	/* Wait (up to 20 seconds) for a command to complete */
-
-	for (i = 20 * HZ; i > 0; i--) {
+	while (time_before(jiffies,end_jiffies)) {
 		done = hba[ctlr]->access.command_completed(hba[ctlr]);
-		if (done == FIFO_EMPTY) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(1);
-		} else
-			return (done);
+		if (done == FIFO_EMPTY)
+			msleep(10);
+		else
+			return done;
 	}
 	/* Invalid address to tell caller we ran out of time */
 	return 1;
@@ -2512,8 +2510,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		if (!(readl(c->vaddr + SA5_DOORBELL) & CFGTBL_ChangeReq))
 			break;
 		/* delay and try again */
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(10);
+		msleep(100);
 	}	
 
 #ifdef CCISS_DEBUG

--===============68428295854191035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68428295854191035==--
