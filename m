From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 22:20:59 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/9] usb/kaweth: reorder
Message-Id: <20040927222058.GN1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82619989355655399=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82619989355655399==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Reorder set_current_state() and schedule_timeout() for a
minor cleanup. The reorder allows removing two of the
set_current_state() calls.

--- 2.6.9-rc2-vanilla/drivers/usb/net/kaweth.c	2004-09-13 17:15:55.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/net/kaweth.c	2004-09-15 10:06:18.000000000 -0700
@@ -1250,13 +1250,11 @@ static int usb_start_wait_urb(struct urb
                 return status;
         }
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
 	while (timeout && !awd.done) {
-		timeout = schedule_timeout(timeout);
 		set_current_state(TASK_UNINTERRUPTIBLE);
+		timeout = schedule_timeout(timeout);
 	}
 
-        set_current_state(TASK_RUNNING);
         remove_wait_queue(&awd.wqh, &wait);
 
         if (!timeout) {

--===============82619989355655399==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82619989355655399==--
