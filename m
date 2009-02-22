From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:00:57 +0000
Subject: [PATCH 01/16] kexec/i386: fix sparse warnings: Using plain integer as
Message-Id: <20090222000051.17557.85888.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  arch/x86/kernel/machine_kexec_32.c:124:22: warning: Using plain integer as NULL pointer
  arch/x86/kernel/traps.c:950:24: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/kernel/machine_kexec_32.c |    2 +-
 arch/x86/kernel/traps.c            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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

