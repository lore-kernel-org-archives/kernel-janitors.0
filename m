From: Lucas Woods <woodzy@gmail.com>
Date: Mon, 05 Nov 2007 20:14:02 +0000
Subject: [PATCH 05/12] arch/parisc: Remove duplicate includes.
Message-Id: <472F798A.8020008@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Lucas Woods <woodzy@gmail.com>
---
 arch/parisc/kernel/signal.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
index 2ce3806..aff469c 100644
--- a/arch/parisc/kernel/signal.c
+++ b/arch/parisc/kernel/signal.c
@@ -23,7 +23,6 @@
 #include <linux/ptrace.h>
 #include <linux/unistd.h>
 #include <linux/stddef.h>
-#include <linux/compat.h>
 #include <linux/elf.h>
 #include <asm/ucontext.h>
 #include <asm/rt_sigframe.h>
-- 



