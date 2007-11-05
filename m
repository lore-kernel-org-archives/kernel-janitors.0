From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:15:49 +0000
Subject: [PATCH 11/12] arch/x86: Remove duplicate includes.
Message-Id: <472F79F5.30707@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/x86/kernel/hpet.c           |    1 -
 arch/x86/kernel/pci-calgary_64.c |    1 -
 arch/x86/kernel/time_64.c        |    1 -
 arch/x86/mm/fault_32.c           |    1 -
 arch/x86/mm/fault_64.c           |    1 -
 arch/x86/vdso/vclock_gettime.c   |    1 -
 6 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 53303f2..7a29e0e 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -6,7 +6,6 @@
 #include <linux/init.h>
 #include <linux/sysdev.h>
 #include <linux/pm.h>
-#include <linux/delay.h>
 
 #include <asm/fixmap.h>
 #include <asm/hpet.h>
diff --git a/arch/x86/kernel/pci-calgary_64.c b/arch/x86/kernel/pci-calgary_64.c
index 6bf1f71..c9060b0 100644
--- a/arch/x86/kernel/pci-calgary_64.c
+++ b/arch/x86/kernel/pci-calgary_64.c
@@ -30,7 +30,6 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/dma-mapping.h>
-#include <linux/init.h>
 #include <linux/bitops.h>
 #include <linux/pci_ids.h>
 #include <linux/pci.h>
diff --git a/arch/x86/kernel/time_64.c b/arch/x86/kernel/time_64.c
index c821edc..0ecccbf 100644
--- a/arch/x86/kernel/time_64.c
+++ b/arch/x86/kernel/time_64.c
@@ -41,7 +41,6 @@
 #include <asm/sections.h>
 #include <linux/hpet.h>
 #include <asm/apic.h>
-#include <asm/hpet.h>
 #include <asm/mpspec.h>
 #include <asm/nmi.h>
 #include <asm/vgtod.h>
diff --git a/arch/x86/mm/fault_32.c b/arch/x86/mm/fault_32.c
index a2273d4..816de97 100644
--- a/arch/x86/mm/fault_32.c
+++ b/arch/x86/mm/fault_32.c
@@ -25,7 +25,6 @@
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
 #include <linux/kdebug.h>
-#include <linux/kprobes.h>
 
 #include <asm/system.h>
 #include <asm/desc.h>
diff --git a/arch/x86/mm/fault_64.c b/arch/x86/mm/fault_64.c
index 0e26230..6c3f7b0 100644
--- a/arch/x86/mm/fault_64.c
+++ b/arch/x86/mm/fault_64.c
@@ -25,7 +25,6 @@
 #include <linux/kprobes.h>
 #include <linux/uaccess.h>
 #include <linux/kdebug.h>
-#include <linux/kprobes.h>
 
 #include <asm/system.h>
 #include <asm/pgalloc.h>
diff --git a/arch/x86/vdso/vclock_gettime.c b/arch/x86/vdso/vclock_gettime.c
index 5b54cdf..23476c2 100644
--- a/arch/x86/vdso/vclock_gettime.c
+++ b/arch/x86/vdso/vclock_gettime.c
@@ -19,7 +19,6 @@
 #include <asm/hpet.h>
 #include <asm/unistd.h>
 #include <asm/io.h>
-#include <asm/vgtod.h>
 #include "vextern.h"
 
 #define gtod vdso_vsyscall_gtod_data
-- 



