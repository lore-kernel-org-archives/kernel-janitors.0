From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 18:56:48 +0000
Subject: [PATCH 3/3] MIPS-syscall: Return directly in mips_mmap()
Message-Id: <65e23f25-f12e-9b94-9038-fd901dae92db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb402413-83e5-9b34-304c-9f4bca6037d9@users.sourceforge.net>
In-Reply-To: <bb402413-83e5-9b34-304c-9f4bca6037d9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 19:30:47 +0100

* Return an error code without storing it in an intermediate variable.

* Delete the local variable "result" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/syscall.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index 53a7ef9a8f32..e4e99888799d 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -60,16 +60,9 @@ SYSCALL_DEFINE6(mips_mmap, unsigned long, addr, unsigned long, len,
 	unsigned long, prot, unsigned long, flags, unsigned long,
 	fd, off_t, offset)
 {
-	unsigned long result;
-
-	result = -EINVAL;
 	if (offset & ~PAGE_MASK)
-		goto out;
-
-	result = sys_mmap_pgoff(addr, len, prot, flags, fd, offset >> PAGE_SHIFT);
-
-out:
-	return result;
+		return -EINVAL;
+	return sys_mmap_pgoff(addr, len, prot, flags, fd, offset >> PAGE_SHIFT);
 }
 
 SYSCALL_DEFINE6(mips_mmap2, unsigned long, addr, unsigned long, len,
-- 
2.11.0

