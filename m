From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 23:57:31 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/2] ieee1394/nodemgr: replace
Message-Id: <20040916235731.GK1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74820605831205933=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916225640.GC1777@us.ibm.com>
In-Reply-To: <20040916225640.GC1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============74820605831205933==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Uses msleep_interruptible() in place of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/ieee1394/nodemgr.c	2004-09-09 23:05:58.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/ieee1394/nodemgr.c	2004-09-10 11:41:07.000000000 -0700
@@ -70,8 +70,7 @@ static int nodemgr_bus_read(struct csr12
 		if (!ret)
 			break;
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		if (schedule_timeout (HZ/3))
+		if (msleep_interruptible(334))
 			return -EINTR;
 	}
 
@@ -1496,7 +1495,7 @@ static int nodemgr_host_thread(void *__h
 		 * to make sure things settle down. */
 		for (i = 0; i < 4 ; i++) {
 			set_current_state(TASK_INTERRUPTIBLE);
-			if (schedule_timeout(HZ/16)) {
+			if (msleep_interruptible(63)) {
 				up(&nodemgr_serialize);
 				goto caught_signal;
 			}

--===============74820605831205933==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74820605831205933==--
