From: Namhyung Kim <namhyung@gmail.com>
Date: Tue, 03 Aug 2010 07:25:22 +0000
Subject: [PATCH 1/2] kprobes: remove redundant address check
Message-Id: <1280820323-18929-1-git-send-email-namhyung@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove call to kernel_text_address() in register_jprobes()
because it is called right after in register_kprobe().

Signed-off-by: Namhyung Kim <namhyung@gmail.com>

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 282035f..8f96701 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1343,14 +1343,11 @@ int __kprobes register_jprobes(struct jprobe **jps, int num)
 		jp = jps[i];
 		addr = arch_deref_entry_point(jp->entry);
 
-		if (!kernel_text_address(addr))
-			ret = -EINVAL;
-		else {
-			/* Todo: Verify probepoint is a function entry point */
-			jp->kp.pre_handler = setjmp_pre_handler;
-			jp->kp.break_handler = longjmp_break_handler;
-			ret = register_kprobe(&jp->kp);
-		}
+		/* Todo: Verify probepoint is a function entry point */
+		jp->kp.pre_handler = setjmp_pre_handler;
+		jp->kp.break_handler = longjmp_break_handler;
+		ret = register_kprobe(&jp->kp);
+
 		if (ret < 0) {
 			if (i > 0)
 				unregister_jprobes(jps, i);
-- 
1.7.0.4

