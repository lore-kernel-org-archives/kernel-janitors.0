From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:43:21 +0000
Subject: [Kernel-janitors] [PATCH 4/8] block/pg: replace pg_sleep() with
Message-Id: <20040915184321.GL4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54313122202131225=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54313122202131225==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I
submitted 20 July which hasn't been merged as of
2.6.9-rc1-mm5/2.6.9-rc2. 

Description: msleep_interruptible() is used instead of pg_sleep()
to guarantee the task delays as expected. The defintion of pg_sleep()
is also modified to use set_current_state() instead of direct
assignment.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/block/paride/pg.c	2004-09-13 17:16:05.000000000 -0700
+++ 2.6.9-rc2/drivers/block/paride/pg.c	2004-09-14 11:50:50.000000000 -0700
@@ -295,7 +295,7 @@ static inline u8 DRIVE(struct pg *dev)
 
 static void pg_sleep(int cs)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(cs);
 }
 
@@ -409,7 +409,7 @@ static int pg_reset(struct pg *dev)
 	write_reg(dev, 6, DRIVE(dev));
 	write_reg(dev, 7, 8);
 
-	pg_sleep(20 * HZ / 1000);
+	msleep_interruptible(20);
 
 	k = 0;
 	while ((k++ < PG_RESET_TMO) && (status_reg(dev) & STAT_BUSY))

--===============54313122202131225==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54313122202131225==--
