From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 23:06:39 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/3] parport/ieee1284: replace
Message-Id: <20040924230639.GB1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41676146166609951=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916231114.GE1777@us.ibm.com>
In-Reply-To: <20040916231114.GE1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============41676146166609951==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/parport/ieee1284.c	2004-09-09 23:05:51.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/parport/ieee1284.c	2004-09-10 15:31:36.000000000 -0700
@@ -216,8 +216,7 @@ int parport_wait_peripheral(struct parpo
 			/* parport_wait_event didn't time out, but the
 			 * peripheral wasn't actually ready either.
 			 * Wait for another 10ms. */
-			__set_current_state (TASK_INTERRUPTIBLE);
-			schedule_timeout ((HZ+ 99) / 100);
+			msleep_interruptible(10);
 		}
 	}
 

--===============41676146166609951==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41676146166609951==--
