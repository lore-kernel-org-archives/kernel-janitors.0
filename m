From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:12:47 +0000
Subject: [PATCH v2 01/15] NULL noise: arch/x86/kernel
Message-Id: <20090305191231.30062.95084.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: Ingo Molnar <mingo@elte.hu>

Fix this sparse warnings:
  arch/x86/kernel/io_apic.c:3474:37: warning: Using plain integer as NULL pointer
  arch/x86/kernel/machine_kexec_32.c:124:22: warning: Using plain integer as NULL pointer
  arch/x86/kernel/traps.c:950:24: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
v2: other subject, as suggested by Al Viro

 arch/x86/kernel/io_apic.c          |    2 +-
 arch/x86/kernel/machine_kexec_32.c |    2 +-
 arch/x86/kernel/traps.c            |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/io_apic.c b/arch/x86/kernel/io_apic.c
index a89878e..d9fe0ed 100644
--- a/arch/x86/kernel/io_apic.c
+++ b/arch/x86/kernel/io_apic.c
@@ -3471,7 +3471,7 @@ int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 	unsigned int irq_want;
 
 #ifdef CONFIG_INTR_REMAP
-	struct intel_iommu *iommu = 0;
+	struct intel_iommu *iommu = NULL;
 	int index = 0;
 #endif
 
diff --git a/arch/x86/kernel/machine_kexec_32.c b/arch/x86/kernel/machine_kexec_32.c
index 37f4200..f5fc8c7 100644
--- a/arch/x86/kernel/machine_kexec_32.c
+++ b/arch/x86/kernel/machine_kexec_32.c
@@ -121,7 +121,7 @@ static void machine_kexec_page_table_set_one(
 static void machine_kexec_prepare_page_tables(struct kimage *image)
 {
 	void *control_page;
-	pmd_t *pmd = 0;
+	pmd_t *pmd = NULL;
 
 	control_page = page_address(image->control_code_page);
 #ifdef CONFIG_X86_PAE
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index ba90406..6882089 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -947,7 +947,7 @@ dotraplinkage void do_iret_error(struct pt_regs *regs, long error_code)
 	info.si_signo = SIGILL;
 	info.si_errno = 0;
 	info.si_code = ILL_BADSTK;
-	info.si_addr = 0;
+	info.si_addr = NULL;
 	if (notify_die(DIE_TRAP, "iret exception",
 			regs, error_code, 32, SIGILL) = NOTIFY_STOP)
 		return;

