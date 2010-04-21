From: Peter Huewe <PeterHuewe@gmx.de>
Date: Wed, 21 Apr 2010 21:19:38 +0000
Subject: Subject: [PATCH 2/2] arch/avr32: fix build failure caused by wrong prototype
Message-Id: <201004212319.39033.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

This patch fixes a build failure[1] introduced by 1d8393171
which had the static keyword as a leftover.

Kernelversion: linux-next-20100421

References:
[1]http://kisskb.ellerman.id.au/kisskb/buildresult/2448162/

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 arch/avr32/kernel/ptrace.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/avr32/kernel/ptrace.c b/arch/avr32/kernel/ptrace.c
index dd5b882..5e73c25 100644
--- a/arch/avr32/kernel/ptrace.c
+++ b/arch/avr32/kernel/ptrace.c
@@ -28,7 +28,7 @@ static struct pt_regs *get_user_regs(struct task_struct *tsk)
 				  THREAD_SIZE - sizeof(struct pt_regs));
 }
 
-static void user_enable_single_step(struct task_struct *tsk)
+void user_enable_single_step(struct task_struct *tsk)
 {
 	pr_debug("user_enable_single_step: pid=%u, PC=0x%08lx, SR=0x%08lx\n",
 		 tsk->pid, task_pt_regs(tsk)->pc, task_pt_regs(tsk)->sr);
-- 
1.6.4.4

