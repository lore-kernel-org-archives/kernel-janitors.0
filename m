From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:44:49 +0000
Subject: [Kernel-janitors] [PATCH] mtd/cfi_cmdset_0001: replace
Message-Id: <20040726234449.GE1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93125110180971149=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93125110180971149==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/mtd/chips/cfi_cmdset_0001.c	2004-06-16 05:19:03.000000000 +0000
+++ linux-dev/drivers/mtd/chips/cfi_cmdset_0001.c	2004-07-02 21:50:13.000000000 +0000
@@ -1315,8 +1315,7 @@ static int do_erase_oneblock(struct map_
 	chip->erase_suspended = 0;
 
 	spin_unlock(chip->mutex);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((chip->erase_time*HZ)/(2*1000));
+	msleep(chip->erase_time / 2);
 	spin_lock(chip->mutex);
 
 	/* FIXME. Use a timer to check this, and return immediately. */

--===============93125110180971149==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93125110180971149==--
