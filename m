From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:01:44 +0000
Subject: [Kernel-janitors] [PATCH] serial/pmac_zilog: replace
Message-Id: <20040727230144.GG4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39041442272429983=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39041442272429983==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/serial/pmac_zilog.c	2004-06-16 05:18:52.000000000 +0000
+++ linux-dev/drivers/serial/pmac_zilog.c	2004-07-06 01:00:33.000000000 +0000
@@ -949,8 +949,7 @@ static int pmz_startup(struct uart_port 
 	 */
 	if (pwr_delay != 0) {
 		pmz_debug("pmz: delaying %d ms\n", pwr_delay);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((pwr_delay * HZ)/1000);
+		msleep(pwr_delay);
 	}
 
 	/* IrDA reset is done now */
@@ -1680,8 +1679,7 @@ static int pmz_resume(struct macio_dev *
 	 */
 	if (pwr_delay != 0) {
 		pmz_debug("pmz: delaying %d ms\n", pwr_delay);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((pwr_delay * HZ)/1000);
+		msleep(pwr_delay);
 	}
 
 	pmz_debug("resume, switching complete\n");

--===============39041442272429983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39041442272429983==--
