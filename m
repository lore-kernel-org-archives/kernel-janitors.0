From: matt mooney <mfm@muteddisk.com>
Date: Tue, 14 Sep 2010 05:32:21 +0000
Subject: [PATCH 4/4] powerpc: remove cast from void*
Message-Id: <1284442341-11787-1-git-send-email-mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: xen-devel@lists.xensource.com, kernel-janitors@vger.kernel.org, linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>, Anton Blanchard <anton@samba.org>, Andrew Morton <akpm@linux-foundation.org>

Unnecessary cast from void* in assignment.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/powerpc/platforms/pseries/hvCall_inst.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall_inst.c b/arch/powerpc/platforms/pseries/hvCall_inst.c
index e19ff02..f106662 100644
--- a/arch/powerpc/platforms/pseries/hvCall_inst.c
+++ b/arch/powerpc/platforms/pseries/hvCall_inst.c
@@ -55,7 +55,7 @@ static void hc_stop(struct seq_file *m, void *p)
 static int hc_show(struct seq_file *m, void *p)
 {
 	unsigned long h_num = (unsigned long)p;
-	struct hcall_stats *hs = (struct hcall_stats *)m->private;
+	struct hcall_stats *hs = m->private;
 
 	if (hs[h_num].num_calls) {
 		if (cpu_has_feature(CPU_FTR_PURR))
-- 
1.7.2.1

