From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:12:17 +0000
Subject: [KJ] [PATCH 8/14] xtensa: use ssleep() instead of schedule_timeout()
Message-Id: <20050709001217.GN2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43550431091671671=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43550431091671671==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan <nacc@us.ibm.com>

Description: Replace schedule_timeout() with ssleep() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 traps.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -urp 2.6.13-rc2-kj/arch/xtensa/kernel/traps.c 2.6.13-rc2-kj-dev/arch/xtensa/kernel/traps.c
--- 2.6.13-rc2-kj/arch/xtensa/kernel/traps.c	2005-07-06 07:57:18.000000000 -0700
+++ 2.6.13-rc2-kj-dev/arch/xtensa/kernel/traps.c	2005-07-06 13:35:36.000000000 -0700
@@ -29,6 +29,7 @@
 #include <linux/module.h>
 #include <linux/stringify.h>
 #include <linux/kallsyms.h>
+#include <linux/delay.h>
 
 #include <asm/ptrace.h>
 #include <asm/timex.h>
@@ -488,8 +489,7 @@ void die(const char * str, struct pt_reg
 
 	if (panic_on_oops) {
 		printk(KERN_EMERG "Fatal exception: panic in 5 seconds\n");
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(5 * HZ);
+		ssleep(5);
 		panic("Fatal exception");
 	}
 	do_exit(err);

--===============43550431091671671==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43550431091671671==--
