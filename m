From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:10:22 +0000
Subject: [KJ] [PATCH 6/14] ia64/sn: use msleep_interruptible() instead of
Message-Id: <20050709001022.GL2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86485225072296146=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86485225072296146==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan <nacc@us.ibm.com>

Description: Replace schedule_timeout() with msleep_interruptible() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 xpc_main.c |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff -urp 2.6.13-rc2-kj/arch/ia64/sn/kernel/xpc_main.c 2.6.13-rc2-kj-dev/arch/ia64/sn/kernel/xpc_main.c
--- 2.6.13-rc2-kj/arch/ia64/sn/kernel/xpc_main.c	2005-07-06 07:57:02.000000000 -0700
+++ 2.6.13-rc2-kj-dev/arch/ia64/sn/kernel/xpc_main.c	2005-07-08 15:29:46.000000000 -0700
@@ -53,6 +53,7 @@
 #include <linux/cache.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <asm/sn/intr.h>
 #include <asm/sn/sn_sal.h>
 #include <asm/uaccess.h>
@@ -308,8 +309,7 @@ xpc_make_first_contact(struct xpc_partit
 			"partition %d\n", XPC_PARTID(part));
 
 		/* wait a 1/4 of a second or so */
-		set_current_state(TASK_INTERRUPTIBLE);
-		(void) schedule_timeout(0.25 * HZ);
+		msleep_interruptible(250);
 
 		if (part->act_state == XPC_P_DEACTIVATING) {
 			return part->reason;
@@ -841,9 +841,7 @@ xpc_do_exit(void)
 	down(&xpc_discovery_exited);
 
 
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(0.3 * HZ);
-	set_current_state(TASK_RUNNING);
+	msleep_interruptible(300);
 
 
 	/* wait for all partitions to become inactive */
@@ -860,11 +858,8 @@ xpc_do_exit(void)
 			}
 		}
 
-		if (active_part_count) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(0.3 * HZ);
-			set_current_state(TASK_RUNNING);
-		}
+		if (active_part_count)
+			msleep_interruptible(300);
 
 	} while (active_part_count > 0);

--===============86485225072296146==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86485225072296146==--
