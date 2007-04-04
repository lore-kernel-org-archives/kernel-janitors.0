From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Wed, 04 Apr 2007 16:49:40 +0000
Subject: [KJ] [PATCH]Unused ROUND_UP, NAME_OFFSET macro in arch/powerpc
Message-Id: <20070404163740.GA9830@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linuxppc-dev@ozlabs.org, akpm@linux-foundation.org, paulus@samba.org, linux-kernel@vger.kernel.org

Unused ROUND_UP, NAME_OFFSET  macro cleanup

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 sys_ppc32.c |    4 ----
 1 files changed, 4 deletions(-)


diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 673e8d9..047246a 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -53,10 +53,6 @@
 #include <asm/ppc-pci.h>
 #include <asm/syscalls.h>
 
-/* readdir & getdents */
-#define NAME_OFFSET(de) ((int) ((de)->d_name - (char __user *) (de)))
-#define ROUND_UP(x) (((x)+sizeof(u32)-1) & ~(sizeof(u32)-1))
-
 struct old_linux_dirent32 {
 	u32		d_ino;
 	u32		d_offset;
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
