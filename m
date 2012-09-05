From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2012 12:31:26 +0000
Subject: [patch] perf: off by one test in perf_reg_value()
Message-Id: <20120905123126.GC6128@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The test should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed on linux-next.

diff --git a/arch/x86/kernel/perf_regs.c b/arch/x86/kernel/perf_regs.c
index c5a3e5c..e309cc5 100644
--- a/arch/x86/kernel/perf_regs.c
+++ b/arch/x86/kernel/perf_regs.c
@@ -57,7 +57,7 @@ static unsigned int pt_regs_offset[PERF_REG_X86_MAX] = {
 
 u64 perf_reg_value(struct pt_regs *regs, int idx)
 {
-	if (WARN_ON_ONCE(idx > ARRAY_SIZE(pt_regs_offset)))
+	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(pt_regs_offset)))
 		return 0;
 
 	return regs_get_register(regs, pt_regs_offset[idx]);
