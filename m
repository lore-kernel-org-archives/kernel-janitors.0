From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 20:43:12 +0000
Subject: [KJ] [PATCH] char/ds1620: use msleep() instead of schedule_timeout()
Message-Id: <20050302204312.GM2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27225392666571047=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27225392666571047==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Not sure why any driver needs to sleep for *two* ticks, so let's fix it.

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected. Signals are never checked for by the callers or
in the function itself, so use TASK_UNINTERRUPTIBLE instead of
TASK_INTERRUPTIBLE. The delay is presumed to have been written when HZ==100,
and thus has been multiplied by 10 to pass to msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-kj-v/drivers/char/ds1620.c	2005-03-01 23:37:48.000000000 -0800
+++ 2.6.11-kj/drivers/char/ds1620.c	2005-03-02 12:35:25.000000000 -0800
@@ -163,8 +163,7 @@ static void ds1620_out(int cmd, int bits
 	netwinder_ds1620_reset();
 	netwinder_unlock(&flags);
 
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(2);
+	msleep(20);
 }
 
 static unsigned int ds1620_in(int cmd, int bits)

--===============27225392666571047==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27225392666571047==--
