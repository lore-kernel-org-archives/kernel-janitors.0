From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:56:15 +0000
Subject: [KJ] [PATCH] kernel/timer: fix msleep_interruptible() comment
Message-Id: <20050303185615.GN11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50919181556195592=="
List-Id: <kernel-janitors.vger.kernel.org>
To: Kernel-Janitors <kernel-janitors@lists.osdl.org>, LKML <linux-kernel@vger.kernel.org>

--===============50919181556195592==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: The comment for msleep_interruptible() is wrong, as it will
ignore wait-queue events, but will wake up early for signals.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/kernel/timer.c	2005-03-01 23:38:25.000000000 -0800
+++ 2.6.11-kj/kernel/timer.c	2005-03-02 15:22:06.000000000 -0800
@@ -1589,7 +1589,7 @@ void msleep(unsigned int msecs)
 EXPORT_SYMBOL(msleep);
 
 /**
- * msleep_interruptible - sleep waiting for waitqueue interruptions
+ * msleep_interruptible - sleep waiting for signals
  * @msecs: Time in milliseconds to sleep for
  */
 unsigned long msleep_interruptible(unsigned int msecs)

--===============50919181556195592==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50919181556195592==--
