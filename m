From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 22:12:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 32/33] char/zftape-buffers:
Message-Id: <20040916221203.GZ1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92678050819851832=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92678050819851832==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. There actually won't be a PATCH
33/33, because I dropped one that even I wouldn't approve :)

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/ftape/zftape/zftape-buffers.c	2004-09-13 17:15:47.000000000 -0700
+++ 2.6.9-rc2/drivers/char/ftape/zftape/zftape-buffers.c	2004-09-16 15:04:45.000000000 -0700
@@ -27,6 +27,7 @@
 #include <linux/errno.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include <linux/zftape.h>
 
@@ -119,8 +120,7 @@ void *zft_kmalloc(size_t size)
 	void *new;
 
 	while ((new = kmalloc(size, GFP_KERNEL)) == NULL) {
-		current->state   = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep_interuptible(100);
 	}
 	memset(new, 0, size);
 	used_memory += size;

--===============92678050819851832==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92678050819851832==--
