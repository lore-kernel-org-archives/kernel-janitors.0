From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 18:08:40 +0000
Subject: [Kernel-janitors] [PATCH] paride: replace schedule_timeout() with
Message-Id: <20040720180840.GC2320@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63344450594892265=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720180441.GA2320@us.ibm.com>
In-Reply-To: <20040720180441.GA2320@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============63344450594892265==
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


--- linux-vanilla/drivers/block/paride/pg.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/block/paride/pg.c	2004-07-08 23:18:19.000000000 +0000
@@ -409,7 +409,7 @@ static int pg_reset(struct pg *dev)
 	write_reg(dev, 6, DRIVE(dev));
 	write_reg(dev, 7, 8);
 
-	pg_sleep(20 * HZ / 1000);
+	msleep(20);
 
 	k = 0;
 	while ((k++ < PG_RESET_TMO) && (status_reg(dev) & STAT_BUSY))

--===============63344450594892265==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63344450594892265==--
