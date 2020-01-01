From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:27 +0000
Subject: [PATCH 09/16] powerpc/mpic: constify copied structure
Message-Id: <1577864614-5543-10-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

The mpic_ipi_chip and mpic_irq_ht_chip structures are only copied
into other structures, so make them const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/sysdev/mpic.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 934a77324f6b..a3a72b780e67 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -964,7 +964,7 @@ static struct irq_chip mpic_irq_chip = {
 };
 
 #ifdef CONFIG_SMP
-static struct irq_chip mpic_ipi_chip = {
+static const struct irq_chip mpic_ipi_chip = {
 	.irq_mask	= mpic_mask_ipi,
 	.irq_unmask	= mpic_unmask_ipi,
 	.irq_eoi	= mpic_end_ipi,
@@ -978,7 +978,7 @@ static struct irq_chip mpic_tm_chip = {
 };
 
 #ifdef CONFIG_MPIC_U3_HT_IRQS
-static struct irq_chip mpic_irq_ht_chip = {
+static const struct irq_chip mpic_irq_ht_chip = {
 	.irq_startup	= mpic_startup_ht_irq,
 	.irq_shutdown	= mpic_shutdown_ht_irq,
 	.irq_mask	= mpic_mask_irq,
