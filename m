From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:27:43 +0000
Subject: [PATCH 5/5] irqchip/irq-gic-v3-its: Mark an array of text strings as "const"
Message-Id: <3b51857b-f168-1fa2-1a05-c187ca51a59f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
In-Reply-To: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 17:05:34 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: static const char * array should probably be
static const char * const

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 100c3125f20e..09f0297a1f59 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1551,7 +1551,7 @@ static int __init its_alloc_lpi_tables(void)
 	return its_lpi_init(lpi_id_bits);
 }
 
-static const char *its_base_type_string[] = {
+static const char * const its_base_type_string[] = {
 	[GITS_BASER_TYPE_DEVICE]	= "Devices",
 	[GITS_BASER_TYPE_VCPU]		= "Virtual CPUs",
 	[GITS_BASER_TYPE_RESERVED3]	= "Reserved (3)",
-- 
2.15.1

