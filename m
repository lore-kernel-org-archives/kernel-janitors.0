From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 08 May 2020 12:30:20 +0000
Subject: [PATCH 4.4 029/312] MIPS: Octeon: Off by one in octeon_irq_gpio_map()
Message-Id: <20200508123126.529643159@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508123124.574959822@linuxfoundation.org>
In-Reply-To: <20200508123124.574959822@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

commit 008d0cf1ec69ec6d2c08f2d23aff2b67cbe5d2af upstream.

It should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().

Fixes: 64b139f97c01 ('MIPS: OCTEON: irq: add CIB and other fixes')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: David Daney <david.daney@cavium.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-mips@linux-mips.org
Cc: kernel-janitors@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/13813/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/cavium-octeon/octeon-irq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1220,7 +1220,7 @@ static int octeon_irq_gpio_map(struct ir
 
 	line = (hw + gpiod->base_hwirq) >> 6;
 	bit = (hw + gpiod->base_hwirq) & 63;
-	if (line > ARRAY_SIZE(octeon_irq_ciu_to_irq) ||
+	if (line >= ARRAY_SIZE(octeon_irq_ciu_to_irq) ||
 		octeon_irq_ciu_to_irq[line][bit] != 0)
 		return -EINVAL;
 
