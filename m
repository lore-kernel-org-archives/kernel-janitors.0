From: Namhyung Kim <namhyung@gmail.com>
Date: Tue, 03 Aug 2010 07:25:23 +0000
Subject: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

verify jprobe's entry point is a function entry point
using kallsyms' offset value.

Signed-off-by: Namhyung Kim <namhyung@gmail.com>

diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 8f96701..c7295f9 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1334,19 +1334,25 @@ unsigned long __weak arch_deref_entry_point(void *entry)
 int __kprobes register_jprobes(struct jprobe **jps, int num)
 {
 	struct jprobe *jp;
-	int ret = 0, i;
+	int ret = -EINVAL, i;
 
 	if (num <= 0)
-		return -EINVAL;
+		return ret;
 	for (i = 0; i < num; i++) {
 		unsigned long addr;
+		unsigned long size, offset;
+		char namebuf[KSYM_NAME_LEN];
+
 		jp = jps[i];
 		addr = arch_deref_entry_point(jp->entry);
 
-		/* Todo: Verify probepoint is a function entry point */
-		jp->kp.pre_handler = setjmp_pre_handler;
-		jp->kp.break_handler = longjmp_break_handler;
-		ret = register_kprobe(&jp->kp);
+		/* Verify probepoint is a function entry point */
+		if (kallsyms_lookup(addr, &size, &offset, NULL, namebuf) &&
+		    offset = 0) {
+			jp->kp.pre_handler = setjmp_pre_handler;
+			jp->kp.break_handler = longjmp_break_handler;
+			ret = register_kprobe(&jp->kp);
+		}
 
 		if (ret < 0) {
 			if (i > 0)
-- 
1.7.0.4

