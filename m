From: Thiago Rafael Becker <trbecker@trbecker.org>
Date: Sat, 12 May 2012 19:02:23 +0000
Subject: [PATCH] kgdb: clear compilation warning
Message-Id: <1336849343-2701-1-git-send-email-trbecker@trbecker.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Thiago Rafael Becker <trbecker@trbecker.org>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, a.p.zijlstra@chello.nl, jason.wessel@windriver.com, jan.kiszka@siemens.com, dhowells@redhat.com

In the function kgdb_arch_set_breakpoint, the variable is only used
if DEBUG_RODATA is configured. This clears the following compilation
warning:

arch/x86/kernel/kgdb.c:749:7: warning: unused variable 'opc'

Signed-off-by: Thiago Rafael Becker <trbecker@trbecker.org>
---
 arch/x86/kernel/kgdb.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index 8bfb614..0ea80ef 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -746,7 +746,9 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
 int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
+#ifdef CONFIG_DEBUG_RODATA
 	char opc[BREAK_INSTR_SIZE];
+#endif
 
 	bpt->type = BP_BREAKPOINT;
 	err = probe_kernel_read(bpt->saved_instr, (char *)bpt->bpt_addr,
-- 
1.7.10.1

