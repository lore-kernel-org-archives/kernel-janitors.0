From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 22:47:30 +0000
Subject: [Kernel-janitors] [PATCH] video/bttv-driver: replace
Message-Id: <20040726224730.GM1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82368022064729507=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82368022064729507==
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

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/video/bttv-driver.c	2004-06-16 05:19:44.000000000 +0000
+++ linux-dev/drivers/media/video/bttv-driver.c	2004-07-12 18:48:48.000000000 +0000
@@ -743,8 +743,7 @@ static void set_pll(struct bttv *btv)
         for (i=0; i<10; i++) {
 		/*  Let other people run while the PLL stabilizes */
 		vprintk(".");
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/50);
+		msleep(20);
 		
                 if (btread(BT848_DSTATUS) & BT848_DSTATUS_PLOCK) {
 			btwrite(0,BT848_DSTATUS);

--===============82368022064729507==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82368022064729507==--
