From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:43:39 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/9] usb/auerswald: add
Message-Id: <20040927214339.GI1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22049146419089594=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22049146419089594==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. One patch removed from USB set, so
total is now 9.

Description: Reorder set_current_state() and schedule_timeout() so that
schedule_timeout() will delay as expected every iteration of the
while-loop. Without the addition, schedule_timeout() will return
immediately in the first iteration.

--- 2.6.9-rc2-vanilla/drivers/usb/misc/auerswald.c	2004-09-13 17:15:54.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/misc/auerswald.c	2004-09-27 14:42:24.000000000 -0700
@@ -626,8 +626,8 @@ static int auerchain_start_wait_urb (pau
 
 	while (timeout && !chs.done)
 	{
-		timeout = schedule_timeout (timeout);
 		set_current_state(TASK_UNINTERRUPTIBLE);
+		timeout = schedule_timeout (timeout);
 		rmb();
 	}
 

--===============22049146419089594==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22049146419089594==--
