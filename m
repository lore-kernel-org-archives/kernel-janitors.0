From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 10 Jan 2005 21:27:00 +0000
Subject: [KJ] [UPDATE PATCH] cdrom/sonycd535: replace schedule_timeout()
Message-Id: <20050110212700.GH9186@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============016016311081052947=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============016016311081052947==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep_interruptible-drivers_cdrom_sonycd535.patch

> msleep_interruptible-drivers_cdrom_sonycd535_2.patch

These two patches are combined in the following, please replace.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. Although TASK_INTERRUPTIBLE is used in the original code,
the schedule_timeout() return conditions for such a state are not checked
appropriately; therefore, TASK_UNINTERRUPTIBLE should be ok (and, hence,
msleep()).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.10-v/drivers/cdrom/sonycd535.c	2004-12-24 13:35:50.000000000 -0800
+++ 2.6.10/drivers/cdrom/sonycd535.c	2005-01-06 10:18:47.000000000 -0800
@@ -129,6 +129,7 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/delay.h>
 
 #define REALLY_SLOW_IO
 #include <asm/system.h>
@@ -896,9 +897,8 @@ do_cdu535_request(request_queue_t * q)
 					}
 					if (readStatus == BAD_STATUS) {
 						/* Sleep for a while, then retry */
-						set_current_state(TASK_INTERRUPTIBLE);
 						spin_unlock_irq(&sonycd535_lock);
-						schedule_timeout(RETRY_FOR_BAD_STATUS*HZ/10);
+						msleep(RETRY_FOR_BAD_STATUS*100);
 						spin_lock_irq(&sonycd535_lock);
 					}
 #if DEBUG > 0
@@ -1478,8 +1478,7 @@ static int __init sony535_init(void)
 	/* look for the CD-ROM, follows the procedure in the DOS driver */
 	inb(select_unit_reg);
 	/* wait for 40 18 Hz ticks (reverse-engineered from DOS driver) */
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout((HZ+17)*40/18);
+	msleep(2222);
 	inb(result_reg);
 
 	outb(0, read_status_reg);	/* does a reset? */

--===============016016311081052947==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============016016311081052947==--
