From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:20:25 +0000
Subject: [PATCH 1/6] consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131216172025.GB15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


blackfin BF561:
consolidate spin_lock/unlock waiting with spin_unlock_wait()

config: defconfig -> changed processor to BF561
toolchain: blackfin-toolchain-elf-gcc-4.1-09r1-10

Builds smp.o without warnings.
No runtime check (no hardware available)

CC: Philippe Gerum <rpm@xenomai.org>
CC: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 arch/blackfin/mach-bf561/smp.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/blackfin/mach-bf561/smp.c b/arch/blackfin/mach-bf561/smp.c
index 11789be..463d839 100644
--- a/arch/blackfin/mach-bf561/smp.c
+++ b/arch/blackfin/mach-bf561/smp.c
@@ -69,8 +69,7 @@ void platform_secondary_init(unsigned int cpu)
 	SSYNC();
 
 	/* We are done with local CPU inits, unblock the boot CPU. */
-	spin_lock(&boot_lock);
-	spin_unlock(&boot_lock);
+	spin_unlock_wait(&boot_lock);
 }
 
 int platform_boot_secondary(unsigned int cpu, struct task_struct *idle)
-- 
1.7.2.5

