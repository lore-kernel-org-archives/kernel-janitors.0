From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:51:35 +0000
Subject: [Kernel-janitors] [PATCH 5/8] block/pt: replace pt_sleep() with
Message-Id: <20040915185135.GM4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69018637975464303=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69018637975464303==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I
submitted 20 July which hasn't been merged as of
2.6.9-rc1-mm5/2.6.9-rc2. 

Description: msleep_interruptible() is used instead of pt_sleep()
to guarantee the task delays as expected. The definition of pt_sleep()
is also removed.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/block/paride/pt.c	2004-09-13 17:16:05.000000000 -0700
+++ 2.6.9-rc2/drivers/block/paride/pt.c	2004-09-14 11:52:21.000000000 -0700
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
+		msleep_interruptible(jiffies_to_msecs(pause));
 		k++;
 		pi_connect(pi);
 		write_reg(pi, 6, DRIVE(tape));
@@ -474,11 +468,11 @@ static int pt_reset(struct pt_unit *tape
 	write_reg(pi, 6, DRIVE(tape));
 	write_reg(pi, 7, 8);
 
-	pt_sleep(20 * HZ / 1000);
+	msleep_interruptible(20);
 
 	k = 0;
 	while ((k++ < PT_RESET_TMO) && (status_reg(pi) & STAT_BUSY))
-		pt_sleep(HZ / 10);
+		msleep_interruptible(100);
 
 	flg = 1;
 	for (i = 0; i < 5; i++)
@@ -512,7 +506,7 @@ static int pt_ready_wait(struct pt_unit 
 		if (!(((p & 0xffff) == 0x0402) || ((p & 0xff) == 6)))
 			return p;
 		k++;
-		pt_sleep(HZ);
+		msleep_interruptible(1000);
 	}
 	return 0x000020;	/* timeout */
 }

--===============69018637975464303==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69018637975464303==--
