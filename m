From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 23:18:30 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/4] pci hotplug/cpqphp_ctrl:
Message-Id: <20040924231830.GC1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91253234302548925=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221217.GZ2270@us.ibm.com>
In-Reply-To: <20040920221217.GZ2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============91253234302548925==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/pci/hotplug/cpqphp_ctrl.c	2004-09-09 23:05:35.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/pci/hotplug/cpqphp_ctrl.c	2004-09-10 15:33:04.000000000 -0700
@@ -69,10 +69,8 @@ static void long_delay(int delay)
 	init_waitqueue_head(&delay_wait);
 
 	add_wait_queue(&delay_wait, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(delay);
+	msleep_interruptible(jiffies_to_msecs(delay));
 	remove_wait_queue(&delay_wait, &wait);
-	set_current_state(TASK_RUNNING);
 	
 	up(&delay_sem);
 }

--===============91253234302548925==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91253234302548925==--
