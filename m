From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:26:37 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 5/6] serial/pmac_zilog: replace
Message-Id: <20040927212637.GF1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66485260037202143=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66485260037202143==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout() to
guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/serial/pmac_zilog.c	2004-09-13 17:15:52.000000000 -0700
+++ 2.6.9-rc2/drivers/serial/pmac_zilog.c	2004-09-14 10:16:17.000000000 -0700
@@ -949,8 +949,7 @@ static int pmz_startup(struct uart_port 
 	 */
 	if (pwr_delay != 0) {
 		pmz_debug("pmz: delaying %d ms\n", pwr_delay);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((pwr_delay * HZ)/1000);
+		msleep(pwr_delay);
 	}
 
 	/* IrDA reset is done now */
@@ -1684,8 +1683,7 @@ static int pmz_resume(struct macio_dev *
 	 */
 	if (pwr_delay != 0) {
 		pmz_debug("pmz: delaying %d ms\n", pwr_delay);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((pwr_delay * HZ)/1000);
+		msleep(pwr_delay);
 	}
 
 	pmz_debug("resume, switching complete\n");

--===============66485260037202143==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66485260037202143==--
