From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:28:38 +0000
Subject: [KJ] [PATCH] input/iforce-packets: insert set_current_state()
Message-Id: <20041022232838.GD18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============056684177495718746=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============056684177495718746==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Inserts set_current_state() before schedule_timeout().
Without the insertion, schedule_timeout() will return immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/input/joystick/iforce/iforce-packets.c	2004-10-22 10:41:36.000000000 -0700
+++ 2.6.9-bk7/drivers/input/joystick/iforce/iforce-packets.c	2004-10-22 14:53:18.000000000 -0700
@@ -269,8 +269,10 @@ int iforce_get_id_packet(struct iforce *
 			return -1;
 		}
 
-		while (timeout && iforce->ctrl->status == -EINPROGRESS)
+		while (timeout && iforce->ctrl->status == -EINPROGRESS) {
+			set_current_state(TASK_INTERRUPTIBLE);
 			timeout = schedule_timeout(timeout);
+		}
 
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&iforce->wait, &wait);
@@ -293,8 +295,10 @@ int iforce_get_id_packet(struct iforce *
 		set_current_state(TASK_INTERRUPTIBLE);
 		add_wait_queue(&iforce->wait, &wait);
 
-		while (timeout && iforce->expect_packet)
+		while (timeout && iforce->expect_packet) {
+			set_current_state(TASK_INTERRUPTIBLE);
 			timeout = schedule_timeout(timeout);
+		}
 
 		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&iforce->wait, &wait);

--===============056684177495718746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============056684177495718746==--
