From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:25:41 +0000
Subject: [KJ] [RFC][PATCH 2/5] char/tpqic02: use poll_event*() interface
Message-Id: <20050303182541.GE11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============019471175799578244=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============019471175799578244==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description: Use new poll_event*() interface to encapsulate sleep-loops.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/drivers/char/tpqic02.c	2005-03-01 23:38:09.000000000 -0800
+++ 2.6.11-kj/drivers/char/tpqic02.c	2005-03-03 10:23:59.000000000 -0800
@@ -527,18 +527,14 @@ static int wait_for_ready(time_t timeout
 		return TE_OK;	/* covers 99.99% of all calls */
 
 	/* Then use schedule() a few times */
-	spin_t = 3;		/* max 0.03 sec busy waiting */
+	spin_t = 3;		/* request max 0.003 sec busy waiting */
 	if (spin_t > timeout)
 		spin_t = timeout;
 	timeout -= spin_t;
 	spin_t += jiffies;
 
 	/* FIXME...*/
-	while (((stat = inb_p(QIC02_STAT_PORT) & QIC02_STAT_MASK) == QIC02_STAT_MASK)  && time_before(jiffies, spin_t))
-	{
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1);	/* don't waste all the CPU time */
-	}
+	poll_event_timeout(((stat = inb_p(QIC02_STAT_PORT) & QIC02_STAT_MASK) != QIC02_STAT_MASK), 1, spin_t);
 	if ((stat & QIC02_STAT_READY) == 0)
 		return TE_OK;
 
@@ -552,12 +548,8 @@ static int wait_for_ready(time_t timeout
 	TPQDEB({printk("wait_for_ready: additional timeout: %d\n", spin_t);})
 
 	    /* not ready and no exception && timeout not expired yet */
-	while (((stat = inb_p(QIC02_STAT_PORT) & QIC02_STAT_MASK) == QIC02_STAT_MASK) && time_before(jiffies, spin_t)) {
-		/* be `nice` to other processes on long operations... */
-		/* nap 0.30 sec between checks, */
-		/* but could be woken up earlier by signals... */
-		msleep_interruptible(300);
-	}
+	poll_event_interruptible_timeout(((stat = inb_p(QIC02_STAT_PORT) & QIC02_STAT_MASK) != QIC02_STAT_MASK),
+			300, spin_t);
 
 	/* don't use jiffies for this test because it may have changed by now */
 	if ((stat & QIC02_STAT_MASK) == QIC02_STAT_MASK) {

--===============019471175799578244==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============019471175799578244==--
