From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 23:18:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/4] pci hotplug/cpqphp: replace
Message-Id: <20040924231858.GD1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8735044307736175=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221309.GA2270@us.ibm.com>
In-Reply-To: <20040920221309.GA2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============8735044307736175==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/pci/hotplug/cpqphp.h	2004-09-09 23:05:35.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/pci/hotplug/cpqphp.h	2004-09-10 15:32:45.000000000 -0700
@@ -707,9 +707,8 @@ static inline int wait_for_ctrl_irq(stru
 
 	dbg("%s - start\n", __FUNCTION__);
 	add_wait_queue(&ctrl->queue, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
 	/* Sleep for up to 1 second to wait for the LED to change. */
-	schedule_timeout(1*HZ);
+	msleep_interruptible(1000);
 	remove_wait_queue(&ctrl->queue, &wait);
 	if (signal_pending(current))
 		retval =  -EINTR;

--===============8735044307736175==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8735044307736175==--
