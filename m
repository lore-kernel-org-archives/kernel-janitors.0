From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 21:52:31 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 5/9] usb/hid-core: add
Message-Id: <20040927215231.GM1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51907857250329759=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51907857250329759==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Add set_current_state() before schedule_timeout() so that
the task delays as expected. Without the addition, schedule_timeout()
will return immediately on subsequent iterations of the while-loop.

--- 2.6.9-rc2-vanilla/drivers/usb/input/hid-core.c	2004-09-13 17:15:54.000000000 -0700
+++ 2.6.9-rc2/drivers/usb/input/hid-core.c	2004-09-27 14:50:24.000000000 -0700
@@ -1244,8 +1244,10 @@ int hid_wait_io(struct hid_device *hid)
 	add_wait_queue(&hid->wait, &wait);
 
 	while (timeout && (test_bit(HID_CTRL_RUNNING, &hid->iofl) ||
-			   test_bit(HID_OUT_RUNNING, &hid->iofl)))
+			   test_bit(HID_OUT_RUNNING, &hid->iofl))) {
+		set_current_state(TASK_UNINTERRUPTIBLE);
 		timeout = schedule_timeout(timeout);
+	}
 
 	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&hid->wait, &wait);

--===============51907857250329759==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51907857250329759==--
