From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 21:51:07 +0000
Subject: [Kernel-janitors] [PATCH] nwflash: replace schedule_timeout() with
Message-Id: <20040722215107.GJ2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35374141838093531=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35374141838093531==
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

Note: I could not find any current Maintainer for this driver. If there
is one I should sent the patch too, please let me know.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/nwflash.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/char/nwflash.c	2004-07-08 23:29:48.000000000 +0000
@@ -64,15 +64,6 @@ static DECLARE_MUTEX(nwflash_sem);
 
 extern spinlock_t gpio_lock;
 
-/*
- * the delay routine - it is often required to let the flash "breeze"...
- */
-void flash_wait(int timeout)
-{
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(timeout);
-}
-
 static int get_flash_id(void)
 {
 	volatile unsigned int c1, c2;
@@ -402,7 +393,7 @@ static int erase_block(int nBlock)
 	/*
 	 * wait 10 ms
 	 */
-	flash_wait(HZ / 100);
+	msleep(10);
 
 	/*
 	 * wait while erasing in process (up to 10 sec)
@@ -410,7 +401,7 @@ static int erase_block(int nBlock)
 	timeout = jiffies + 10 * HZ;
 	c1 = 0;
 	while (!(c1 & 0x80) && time_before(jiffies, timeout)) {
-		flash_wait(HZ / 100);
+		msleep(10);
 		/*
 		 * read any address
 		 */
@@ -441,7 +432,7 @@ static int erase_block(int nBlock)
 	/*
 	 * just to make sure - verify if erased OK...
 	 */
-	flash_wait(HZ / 100);
+	msleep(10);
 
 	pWritePtr = (unsigned char *) ((unsigned int) (FLASH_BASE + (nBlock << 16)));
 
@@ -588,7 +579,7 @@ static int write_block(unsigned long p, 
 				/*
 				 * wait couple ms
 				 */
-				flash_wait(HZ / 100);
+				msleep(10);
 				/*
 				 * red LED == write
 				 */
@@ -613,7 +604,7 @@ static int write_block(unsigned long p, 
 	leds_event(led_amber_off);
 	leds_event(led_green_on);
 
-	flash_wait(HZ / 100);
+	msleep(10);
 
 	pWritePtr = (unsigned char *) ((unsigned int) (FLASH_BASE + p));
 

--===============35374141838093531==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35374141838093531==--
