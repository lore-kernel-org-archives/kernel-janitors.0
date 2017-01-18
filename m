From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 18:54:29 +0000
Subject: [PATCH 1/3] MIPS: Return directly in 32_mmap2()
Message-Id: <82853b63-432d-a012-5791-139fee51a0a5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb402413-83e5-9b34-304c-9f4bca6037d9@users.sourceforge.net>
In-Reply-To: <bb402413-83e5-9b34-304c-9f4bca6037d9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 19:00:05 +0100

* Return a failure indication without storing it
  in an intermediate variable.

* Delete the local variable "error" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/linux32.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/mips/kernel/linux32.c b/arch/mips/kernel/linux32.c
index 50fb62544df7..6fa6cdfa6e22 100644
--- a/arch/mips/kernel/linux32.c
+++ b/arch/mips/kernel/linux32.c
@@ -64,15 +64,10 @@ SYSCALL_DEFINE6(32_mmap2, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags, unsigned long, fd,
 	unsigned long, pgoff)
 {
-	unsigned long error;
-
-	error = -EINVAL;
 	if (pgoff & (~PAGE_MASK >> 12))
-		goto out;
-	error = sys_mmap_pgoff(addr, len, prot, flags, fd,
-			       pgoff >> (PAGE_SHIFT-12));
-out:
-	return error;
+		return -EINVAL;
+	return sys_mmap_pgoff(addr, len, prot, flags, fd,
+			      pgoff >> (PAGE_SHIFT-12));
 }
 
 #define RLIM_INFINITY32 0x7fffffff
-- 
2.11.0

