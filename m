From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 31 Mar 2012 23:59:10 +0000
Subject: [PATCH] x86, vsyscall: Fix sparse warning: Using plain integer as NULL
Message-Id: <1333238350-6798-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch silences the following sparse warning:
arch/x86/kernel/vsyscall_64.c:250:34:
       warning: Using plain integer as NULL pointer

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 arch/x86/kernel/vsyscall_64.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/vsyscall_64.c b/arch/x86/kernel/vsyscall_64.c
index f386dc4..6170ff9 100644
--- a/arch/x86/kernel/vsyscall_64.c
+++ b/arch/x86/kernel/vsyscall_64.c
@@ -247,7 +247,7 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned long address)
 
 		ret = sys_getcpu((unsigned __user *)regs->di,
 				 (unsigned __user *)regs->si,
-				 0);
+				 NULL);
 		break;
 	}
 
-- 
1.7.9.1

