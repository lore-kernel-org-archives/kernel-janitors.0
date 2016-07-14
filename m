From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 10:14:29 +0000
Subject: [patch] MIPS: OCTEON: Off by one in octeon_irq_gpio_map()
Message-Id: <20160714101429.GA18175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>
Cc: Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org

It should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().

Fixes: 64b139f97c01 ('MIPS: OCTEON: irq: add CIB and other fixes')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index 368eb49..75a4add 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1260,7 +1260,7 @@ static int octeon_irq_gpio_map(struct irq_domain *d,
 
 	line = (hw + gpiod->base_hwirq) >> 6;
 	bit = (hw + gpiod->base_hwirq) & 63;
-	if (line > ARRAY_SIZE(octeon_irq_ciu_to_irq) ||
+	if (line >= ARRAY_SIZE(octeon_irq_ciu_to_irq) ||
 		octeon_irq_ciu_to_irq[line][bit] != 0)
 		return -EINVAL;
 
