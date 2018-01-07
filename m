From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 Jan 2018 09:18:08 +0000
Subject: [PATCH] KVM: PPC: Use seq_puts() in kvmppc_exit_timing_show()
Message-Id: <6f07cc84-cd86-8e48-5da2-edb86f466243@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 Jan 2018 10:07:36 +0100

A headline should be quickly put into a sequence. Thus use the
function "seq_puts" instead of "seq_printf" for this purpose.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/timing.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/timing.c b/arch/powerpc/kvm/timing.c
index e44d2b2ea97e..1c03c978eb18 100644
--- a/arch/powerpc/kvm/timing.c
+++ b/arch/powerpc/kvm/timing.c
@@ -143,8 +143,7 @@ static int kvmppc_exit_timing_show(struct seq_file *m, void *private)
 	int i;
 	u64 min, max, sum, sum_quad;
 
-	seq_printf(m, "%s", "type	count	min	max	sum	sum_squared\n");
-
+	seq_puts(m, "type	count	min	max	sum	sum_squared\n");
 
 	for (i = 0; i < __NUMBER_OF_KVM_EXIT_TYPES; i++) {
 
-- 
2.15.1

