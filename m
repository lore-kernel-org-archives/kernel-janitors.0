From: Thiago Rafael Becker <trbecker@trbecker.org>
Date: Fri, 11 May 2012 04:13:40 +0000
Subject: [PATCH] kgbd: clear compilation warning
Message-Id: <1336709620-19351-1-git-send-email-trbecker@trbecker.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Thiago Rafael Becker <trbecker@trbecker.org>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, a.p.zijlstra@chello.nl, jason.wessel@windriver.com, jan.kiszka@siemens.com, dhowells@redhat.com

In the function kgbd_arch_set_breakpoint, the variable is only used
if DEBUG_RODATA is configured. This clears the following compilation
warning:

arch/x86/kernel/kgdb.c:749:7: warning: unused variable 'opc'

Signed-off-by: Thiago Rafael Becker <trbecker@trbecker.org>
---
 arch/x86/kernel/kgdb.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index 8bfb614..7c54c78 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -746,7 +746,6 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
 int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 {
 	int err;
-	char opc[BREAK_INSTR_SIZE];
 
 	bpt->type = BP_BREAKPOINT;
 	err = probe_kernel_read(bpt->saved_instr, (char *)bpt->bpt_addr,
@@ -756,6 +755,8 @@ int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 	err = probe_kernel_write((char *)bpt->bpt_addr,
 				 arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
 #ifdef CONFIG_DEBUG_RODATA
+	char opc[BREAK_INSTR_SIZE];
+
 	if (!err)
 		return err;
 	/*
-- 
1.7.10.1

