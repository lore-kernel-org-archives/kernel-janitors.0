From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:35:26 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/10] usb/ati_remote: add
Message-Id: <20040927213526.GH1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95087069871841035=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95087069871841035==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Add set_current_state() before schedule_timeout() so that
if the while-loop iterates multiple times, schedule_timeout() delays as
expected. Without the addition, schedule_timeout() will return
immediately.

--- 2.6.9-rc2-vanilla/drivers/usb/input/ati_remote.c	2004-09-13 17:15:54.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/input/ati_remote.c	2004-09-27 14:33:12.000000000 -0700
@@ -418,6 +418,7 @@ static int ati_remote_sendpacket(struct 
 
 	while (timeout && (ati_remote->out_urb->status == -EINPROGRESS) 
 	       && !(ati_remote->send_flags & SEND_FLAG_COMPLETE)) {
+		set_current_state(TASK_INTERRUPTIBLE);
 		timeout = schedule_timeout(timeout);
 		rmb();
 	}

--===============95087069871841035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95087069871841035==--
