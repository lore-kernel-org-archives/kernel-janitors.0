From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 17:23:46 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 20/33] char/rio_linux: replace
Message-Id: <20040916172346.GM1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74050656209139132=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74050656209139132==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep()/msleep_interruptible() [as appropriate] instead
of schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/rio/rio_linux.c	2004-09-09 23:05:37.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/rio/rio_linux.c	2004-09-10 11:11:23.000000000 -0700
@@ -330,8 +330,7 @@ int RIODelay (struct Port *PortP, int nj
   func_enter ();
 
   rio_dprintk (RIO_DEBUG_DELAY, "delaying %d jiffies\n", njiffies);  
-  current->state = TASK_INTERRUPTIBLE;
-  schedule_timeout(njiffies);
+  msleep_interruptible(jiffes_to_msecs(njiffies));
   func_exit();
 
   if (signal_pending(current))
@@ -347,8 +346,7 @@ int RIODelay_ni (struct Port *PortP, int
   func_enter ();
 
   rio_dprintk (RIO_DEBUG_DELAY, "delaying %d jiffies (ni)\n", njiffies);  
-  current->state = TASK_UNINTERRUPTIBLE;
-  schedule_timeout(njiffies);
+  msleep(jiffies_to_msecs(njiffies));
   func_exit();
   return !RIO_FAIL;
 }

--===============74050656209139132==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74050656209139132==--
