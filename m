From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 19:47:31 +0000
Subject: [KJ] [PATCH 30/39] sound/vx_core: replace schedule_timeout() with
Message-Id: <20050121194731.GK3340@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81351931807024869=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81351931807024869==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The check for xmsec >= 1000 / HZ seems wrong to me, as well,
since if HZ==100, that means we could mdelay() for 9 msecs! msleep() should be
usable in all cases when not in an interrupt handler.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/sound/drivers/vx/vx_core.c	2005-01-15 16:55:45.000000000 -0800
+++ 2.6.11-rc1-kj/sound/drivers/vx/vx_core.c	2005-01-18 13:26:06.000000000 -0800
@@ -45,9 +45,8 @@ MODULE_LICENSE("GPL");
  */
 void snd_vx_delay(vx_core_t *chip, int xmsec)
 {
-	if (! in_interrupt() && xmsec >= 1000 / HZ) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((xmsec * HZ + 999) / 1000);
+	if (!in_interrupt()) {
+		msleep(xmsec);
 	} else {
 		mdelay(xmsec);
 	}

--===============81351931807024869==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81351931807024869==--
