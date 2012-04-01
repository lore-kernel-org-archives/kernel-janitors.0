From: Emil Goode <emilgoode@gmail.com>
Date: Sun, 01 Apr 2012 18:48:04 +0000
Subject: [PATCH v2] x86, vsyscall: Fix sparse warning: Using plain integer as NULL
Message-Id: <1333306084-3776-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Decided to change the comment instead as well.

This patch silences the following sparse warning:
arch/x86/kernel/vsyscall_64.c:250:34:
       warning: Using plain integer as NULL pointer

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
v2: Changed comment to "NULL" instead of "0"

 arch/x86/kernel/vsyscall_64.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/vsyscall_64.c b/arch/x86/kernel/vsyscall_64.c
index f386dc4..7515cf0 100644
--- a/arch/x86/kernel/vsyscall_64.c
+++ b/arch/x86/kernel/vsyscall_64.c
@@ -216,9 +216,9 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned long address)
 	current_thread_info()->sig_on_uaccess_error = 1;
 
 	/*
-	 * 0 is a valid user pointer (in the access_ok sense) on 32-bit and
+	 * NULL is a valid user pointer (in the access_ok sense) on 32-bit and
 	 * 64-bit, so we don't need to special-case it here.  For all the
-	 * vsyscalls, 0 means "don't write anything" not "write it at
+	 * vsyscalls, NULL means "don't write anything" not "write it at
 	 * address 0".
 	 */
 	ret = -EFAULT;
@@ -247,7 +247,7 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned long address)
 
 		ret = sys_getcpu((unsigned __user *)regs->di,
 				 (unsigned __user *)regs->si,
-				 0);
+				 NULL);
 		break;
 	}
 
-- 
1.7.9.1

