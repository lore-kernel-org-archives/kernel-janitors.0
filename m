From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 18:06:20 +0000
Subject: [Kernel-janitors] [PATCH] paride: replace schedule_timeout() with
Message-Id: <20040720180620.GB2320@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97468872589713262=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720180441.GA2320@us.ibm.com>
In-Reply-To: <20040720180441.GA2320@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============97468872589713262==
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


--- linux-vanilla/drivers/block/paride/pf.c	2004-06-16 05:19:42.000000000 +0000
+++ linux-dev/drivers/block/paride/pf.c	2004-07-08 23:14:06.000000000 +0000
@@ -526,12 +526,6 @@ static void pf_eject(struct pf_unit *pf)
 
 #define PF_RESET_TMO   30	/* in tenths of a second */
 
-static void pf_sleep(int cs)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(cs);
-}
-
 /* the ATAPI standard actually specifies the contents of all 7 registers
    after a reset, but the specification is ambiguous concerning the last
    two bytes, and different drives interpret the standard differently.
@@ -546,11 +540,11 @@ static int pf_reset(struct pf_unit *pf)
 	write_reg(pf, 6, 0xa0+0x10*pf->drive);
 	write_reg(pf, 7, 8);
 
-	pf_sleep(20 * HZ / 1000);
+	msleep(20);
 
 	k = 0;
 	while ((k++ < PF_RESET_TMO) && (status_reg(pf) & STAT_BUSY))
-		pf_sleep(HZ / 10);
+		msleep(100);
 
 	flg = 1;
 	for (i = 0; i < 5; i++)

--===============97468872589713262==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97468872589713262==--
