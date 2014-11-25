From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 17:21:14 +0000
Subject: [patch v2] x86_64, traps: always true condition
Message-Id: <20141125172114.GA24535@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should be checking IS_ERR() here.  PTR_ERR() is always true.

Fixes: fe3d197f8431 ('x86, mpx: On-demand kernel allocation of bounds tables')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use correct fixes tag.

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 67d817e..f176d96 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -331,7 +331,7 @@ dotraplinkage void do_bounds(struct pt_regs *regs, long error_code)
 		break; /* Success, it was handled */
 	case 1: /* Bound violation. */
 		info = mpx_generate_siginfo(regs, xsave_buf);
-		if (PTR_ERR(info)) {
+		if (IS_ERR(info)) {
 			/*
 			 * We failed to decode the MPX instruction.  Act as if
 			 * the exception was not caused by MPX.
