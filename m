From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:41:47 +0000
Subject: [Kernel-janitors] [PATCH 3/8] block/pf: replace pf_sleep() with
Message-Id: <20040915184147.GK4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78853907145520807=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78853907145520807==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I
submitted 20 July which hasn't been merged as of
2.6.9-rc1-mm5/2.6.9-rc2. 

Description: msleep_interruptible() is used instead of pf_sleep()
to guarantee the task delays as expected. The defintion of pf_sleep()
is also removed.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/block/paride/pf.c	2004-09-13 17:16:05.000000000 -0700
+++ 2.6.9-rc2/drivers/block/paride/pf.c	2004-09-14 11:49:47.000000000 -0700
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
+	msleep_interruptible(20);
 
 	k = 0;
 	while ((k++ < PF_RESET_TMO) && (status_reg(pf) & STAT_BUSY))
-		pf_sleep(HZ / 10);
+		msleep_interruptible(100);
 
 	flg = 1;
 	for (i = 0; i < 5; i++)

--===============78853907145520807==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78853907145520807==--
