From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:16:06 +0000
Subject: [PATCH 12/12] arch/xtensa: Remove duplicate includes.
Message-Id: <472F7A06.1040200@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/xtensa/kernel/asm-offsets.c   |    1 -
 arch/xtensa/kernel/syscall.c       |    1 -
 arch/xtensa/mm/cache.c             |    1 -
 arch/xtensa/platform-iss/network.c |    1 -
 4 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/xtensa/kernel/asm-offsets.c b/arch/xtensa/kernel/asm-offsets.c
index d5ffe7b..5d9ef51 100644
--- a/arch/xtensa/kernel/asm-offsets.c
+++ b/arch/xtensa/kernel/asm-offsets.c
@@ -21,7 +21,6 @@
 #include <linux/mm.h>
 
 #include <asm/ptrace.h>
-#include <asm/processor.h>
 #include <asm/uaccess.h>
 
 #define DEFINE(sym, val) asm volatile("\n->" #sym " %0 " #val : : "i" (val))
diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index f3e16ef..b06e030 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -36,7 +36,6 @@ syscall_t sys_call_table[__NR_syscall_count] /* FIXME __cacheline_aligned */= {
 #define __SYSCALL(nr,symbol,nargs) [ nr ] = (syscall_t)symbol,
 #undef _XTENSA_UNISTD_H
 #undef  __KERNEL_SYSCALLS__
-#include <asm/unistd.h>
 };
 
 /*
diff --git a/arch/xtensa/mm/cache.c b/arch/xtensa/mm/cache.c
index 9a1fa94..42bfb69 100644
--- a/arch/xtensa/mm/cache.c
+++ b/arch/xtensa/mm/cache.c
@@ -25,7 +25,6 @@
 #include <linux/swap.h>
 #include <linux/pagemap.h>
 
-#include <asm/pgtable.h>
 #include <asm/bootparam.h>
 #include <asm/mmu_context.h>
 #include <asm/tlb.h>
diff --git a/arch/xtensa/platform-iss/network.c b/arch/xtensa/platform-iss/network.c
index b61fb36..31c8d21 100644
--- a/arch/xtensa/platform-iss/network.c
+++ b/arch/xtensa/platform-iss/network.c
@@ -31,7 +31,6 @@
 #include <linux/bootmem.h>
 #include <linux/ethtool.h>
 #include <linux/rtnetlink.h>
-#include <linux/timer.h>
 #include <linux/platform_device.h>
 
 #include <asm/platform/simcall.h>
-- 


