From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 19:57:24 +0000
Subject: [KJ] [PATCH] paride/pg: replace pg_sleep() with msleep()
Message-Id: <20050302195724.GH2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64201331349374779=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64201331349374779==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Just had a quick revelation that pg_sleep()'s parameter being labelled
as ``cs'' indicated centiseconds, which is the schedular quantum when
HZ=100. But the current driver does not account for other values of HZ.

Description: Use msleep() instead of pg_sleep() to guarantee the task
delays as expected. Remove the now unused pg_sleep() definition.
pg_sleep()'s units were centiseconds, so the corresponding parameters to
msleep() were multiplied by 10. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/drivers/block/paride/pg.c	2005-03-02 11:21:41.000000000 -0800
+++ 2.6.11-kj/drivers/block/paride/pg.c	2005-03-02 11:53:36.000000000 -0800
@@ -293,12 +293,6 @@ static inline u8 DRIVE(struct pg *dev)
 	return 0xa0+0x10*dev->drive;
 }
 
-static void pg_sleep(int cs)
-{
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(cs);
-}
-
 static int pg_wait(struct pg *dev, int go, int stop, unsigned long tmo, char *msg)
 {
 	int j, r, e, s, p, to;
@@ -311,7 +305,7 @@ static int pg_wait(struct pg *dev, int g
 		if (j++ < PG_SPIN)
 			udelay(PG_SPIN_DEL);
 		else
-			pg_sleep(1);
+			msleep(10);
 	}
 
 	to = time_after_eq(jiffies, tmo);
@@ -413,7 +407,7 @@ static int pg_reset(struct pg *dev)
 
 	k = 0;
 	while ((k++ < PG_RESET_TMO) && (status_reg(dev) & STAT_BUSY))
-		pg_sleep(1);
+		msleep(10);
 
 	for (i = 0; i < 5; i++)
 		got[i] = read_reg(dev, i + 1);

--===============64201331349374779==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64201331349374779==--
