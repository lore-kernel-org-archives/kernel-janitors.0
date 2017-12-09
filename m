From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Dec 2017 11:49:14 +0000
Subject: [PATCH] RISC-V: Logical vs Bitwise typo
Message-Id: <20171209114914.fbor54gqfcmvqipf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the current code, there is a ! logical NOT where a bitwise ~ NOT was
intended.  It means that we never return -EINVAL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index a2ae936a093e..79c78668258e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -70,7 +70,7 @@ SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
 	bool local = (flags & SYS_RISCV_FLUSH_ICACHE_LOCAL) != 0;
 
 	/* Check the reserved flags. */
-	if (unlikely(flags & !SYS_RISCV_FLUSH_ICACHE_ALL))
+	if (unlikely(flags & ~SYS_RISCV_FLUSH_ICACHE_ALL))
 		return -EINVAL;
 
 	flush_icache_mm(mm, local);
