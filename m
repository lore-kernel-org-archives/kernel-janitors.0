From: Jiri Olsa <olsajiri@gmail.com>
Date: Mon, 05 Nov 2007 18:07:19 +0000
Subject: [PATCH] kernel: Removing duplicit #includes
Message-Id: <472F5BD7.8030409@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing duplicit #includes for kernel/
Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
---
 kernel/printk.c  |    1 -
 kernel/profile.c |    2 --
 kernel/sysctl.c  |    1 -
 3 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/kernel/printk.c b/kernel/printk.c
index a30fe33..3f06748 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -32,7 +32,6 @@
 #include <linux/security.h>
 #include <linux/bootmem.h>
 #include <linux/syscalls.h>
-#include <linux/jiffies.h>
 
 #include <asm/uaccess.h>
 
diff --git a/kernel/profile.c b/kernel/profile.c
index 5e95330..92b71ea 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -20,7 +20,6 @@
 #include <linux/mm.h>
 #include <linux/cpumask.h>
 #include <linux/cpu.h>
-#include <linux/profile.h>
 #include <linux/highmem.h>
 #include <linux/mutex.h>
 #include <asm/sections.h>
@@ -425,7 +424,6 @@ void profile_tick(int type)
 #ifdef CONFIG_PROC_FS
 #include <linux/proc_fs.h>
 #include <asm/uaccess.h>
-#include <asm/ptrace.h>
 
 static int prof_cpu_mask_read_proc (char *page, char **start, off_t off,
                        int count, int *eof, void *data)
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 3b4efbe..5aec15e 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -37,7 +37,6 @@
 #include <linux/highuid.h>
 #include <linux/writeback.h>
 #include <linux/hugetlb.h>
-#include <linux/security.h>
 #include <linux/initrd.h>
 #include <linux/times.h>
 #include <linux/limits.h>

