From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 09 Apr 2016 11:17:29 +0000
Subject: [PATCH] uprobes/x86: constify uprobe_xol_ops structures
Message-Id: <1460200649-32526-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org

The uprobe_xol_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/x86/kernel/uprobes.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index bf4db6e..bd07415 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -578,7 +578,7 @@ static void default_abort_op(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	riprel_post_xol(auprobe, regs);
 }
 
-static struct uprobe_xol_ops default_xol_ops = {
+static const struct uprobe_xol_ops default_xol_ops = {
 	.pre_xol  = default_pre_xol_op,
 	.post_xol = default_post_xol_op,
 	.abort	  = default_abort_op,
@@ -695,7 +695,7 @@ static void branch_clear_offset(struct arch_uprobe *auprobe, struct insn *insn)
 		0, insn->immediate.nbytes);
 }
 
-static struct uprobe_xol_ops branch_xol_ops = {
+static const struct uprobe_xol_ops branch_xol_ops = {
 	.emulate  = branch_emulate_op,
 	.post_xol = branch_post_xol_op,
 };

