From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 18:10:03 +0000
Subject: [Kernel-janitors] [PATCH] paride: replace schedule_timeout() with
Message-Id: <20040720181003.GD2320@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55520412649429307=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720180441.GA2320@us.ibm.com>
In-Reply-To: <20040720180441.GA2320@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============55520412649429307==
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

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/block/paride/pt.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/block/paride/pt.c	2004-07-08 23:20:47.000000000 +0000
@@ -401,12 +401,6 @@ static int pt_atapi(struct pt_unit *tape
 	return r;
 }
 
-static void pt_sleep(int cs)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(cs);
-}
-
 static int pt_poll_dsc(struct pt_unit *tape, int pause, int tmo, char *msg)
 {
 	struct pi_adapter *pi = tape->pi;
@@ -416,7 +410,7 @@ static int pt_poll_dsc(struct pt_unit *t
 	e = 0;
 	s = 0;
 	while (k < tmo) {
-		pt_sleep(pause);
+		msleep(jiffies_to_msecs(pause));
 		k++;
 		pi_connect(pi);
 		write_reg(pi, 6, DRIVE(tape));
@@ -474,11 +468,11 @@ static int pt_reset(struct pt_unit *tape
 	write_reg(pi, 6, DRIVE(tape));
 	write_reg(pi, 7, 8);
 
-	pt_sleep(20 * HZ / 1000);
+	msleep(20);
 
 	k = 0;
 	while ((k++ < PT_RESET_TMO) && (status_reg(pi) & STAT_BUSY))
-		pt_sleep(HZ / 10);
+		msleep(100);
 
 	flg = 1;
 	for (i = 0; i < 5; i++)
@@ -512,7 +506,7 @@ static int pt_ready_wait(struct pt_unit 
 		if (!(((p & 0xffff) == 0x0402) || ((p & 0xff) == 6)))
 			return p;
 		k++;
-		pt_sleep(HZ);
+		msleep(1000);
 	}
 	return 0x000020;	/* timeout */
 }

--===============55520412649429307==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55520412649429307==--
