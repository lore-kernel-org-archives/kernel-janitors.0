From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 23:58:47 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/4] mtd/cfi_cmdset_0002:
Message-Id: <20040920235847.GF2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54892406144202743=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54892406144202743==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/mtd/chips/cfi_cmdset_0002.c	2004-09-09 23:05:53.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/mtd/chips/cfi_cmdset_0002.c	2004-09-10 14:16:28.000000000 -0700
@@ -1175,8 +1175,7 @@ static inline int do_erase_chip(struct m
 	chip->in_progress_block_addr = adr;
 
 	cfi_spin_unlock(chip->mutex);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((chip->erase_time*HZ)/(2*1000));
+	msleep(chip->erase_time/2);
 	cfi_spin_lock(chip->mutex);
 
 	timeo = jiffies + (HZ*20);
@@ -1354,8 +1353,7 @@ static inline int do_erase_oneblock(stru
 	chip->in_progress_block_addr = adr;
 	
 	cfi_spin_unlock(chip->mutex);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((chip->erase_time*HZ)/(2*1000));
+	msleep(chip->erase_time/2);
 	cfi_spin_lock(chip->mutex);
 
 	timeo = jiffies + (HZ*20);

--===============54892406144202743==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54892406144202743==--
