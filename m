From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 21:04:43 +0000
Subject: [Kernel-janitors] [PATCH] macintosh/adb: replace schedule_timeout()
Message-Id: <20040723210443.GM2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52974953089227361=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52974953089227361==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/macintosh/adb.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/macintosh/adb.c	2004-07-02 18:27:09.000000000 +0000
@@ -139,10 +139,9 @@ static void printADBreply(struct adb_req
 static __inline__ void adb_wait_ms(unsigned int ms)
 {
 	if (current->pid && adb_probe_task_pid &&
-	  adb_probe_task_pid == current->pid) {
-		set_task_state(current, TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1 + ms * HZ / 1000);
-	} else
+	  adb_probe_task_pid == current->pid)
+		msleep(ms);
+	else
 		mdelay(ms);
 }
 

--===============52974953089227361==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52974953089227361==--
