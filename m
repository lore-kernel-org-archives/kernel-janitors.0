From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:39:18 +0000
Subject: [Kernel-janitors] [PATCH 2/8] block/pcd: replace pcd_sleep() with
Message-Id: <20040915183918.GJ4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8219012908953458=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8219012908953458==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I
submitted 19 July which hasn't been merged as of
2.6.9-rc1-mm5/2.6.9-rc2. 

Description: msleep_interruptible() is used instead of pcd_sleep()
to guarantee the task delays as expected. The defintion of pcd_sleep()
is also removed.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc2-vanilla/drivers/block/paride/pcd.c	2004-09-13 17:16:05.000000000 -0700
+++ 2.6.9-rc2/drivers/block/paride/pcd.c	2004-09-14 11:48:15.000000000 -0700
@@ -534,12 +534,6 @@ static int pcd_tray_move(struct cdrom_de
 			 position ? "eject" : "close tray");
 }
 
-static void pcd_sleep(int cs)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(cs);
-}
-
 static int pcd_reset(struct pcd_unit *cd)
 {
 	int i, k, flg;
@@ -549,11 +543,11 @@ static int pcd_reset(struct pcd_unit *cd
 	write_reg(cd, 6, 0xa0 + 0x10 * cd->drive);
 	write_reg(cd, 7, 8);
 
-	pcd_sleep(20 * HZ / 1000);	/* delay a bit */
+	msleep_interruptible(20);	/* delay a bit */
 
 	k = 0;
 	while ((k++ < PCD_RESET_TMO) && (status_reg(cd) & IDE_BUSY))
-		pcd_sleep(HZ / 10);
+		msleep_interruptible(100);
 
 	flg = 1;
 	for (i = 0; i < 5; i++)
@@ -592,7 +586,7 @@ static int pcd_ready_wait(struct pcd_uni
 		if (!(((p & 0xffff) == 0x0402) || ((p & 0xff) == 6)))
 			return p;
 		k++;
-		pcd_sleep(HZ);
+		msleep_interruptible(1000);
 	}
 	return 0x000020;	/* timeout */
 }

--===============8219012908953458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8219012908953458==--
