From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 18:10:26 +0000
Subject: [PATCH] MIPS: Octeon: Delete an error message for a failed memory allocation in octeon_irq_init_gpio
Message-Id: <7995eb17-f2ec-54ad-f4d4-7b3dd8337d33@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Dan Carpenter <dan.carpenter@oracle.com>, David Daney <david.daney@cavium.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, "Steven J. Hill" <steven.hill@cavium.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:00:06 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/cavium-octeon/octeon-irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index c1eb1ff7c800..050c08ece5b6 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1615,7 +1615,6 @@ static int __init octeon_irq_init_gpio(
 		irq_domain_add_linear(
 			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
 	} else {
-		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
 		return -ENOMEM;
 	}
 
-- 
2.13.0

