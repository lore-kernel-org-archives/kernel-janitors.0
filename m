From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 23:05:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] parport/parport_cs: replace
Message-Id: <20040924230558.GZ1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94465810794944227=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234735.GJ1777@us.ibm.com>
In-Reply-To: <20040916234735.GJ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============94465810794944227==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/parport/parport_pc.c	2004-09-09 23:05:51.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/parport/parport_pc.c	2004-09-10 15:32:30.000000000 -0700
@@ -168,8 +168,7 @@ static int change_mode(struct parport *p
 				if (time_after_eq (jiffies, expire))
 					/* The FIFO is stuck. */
 					return -EBUSY;
-				__set_current_state (TASK_INTERRUPTIBLE);
-				schedule_timeout ((HZ + 99) / 100);
+				msleep_interruptible(10);
 				if (signal_pending (current))
 					break;
 			}

--===============94465810794944227==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94465810794944227==--
