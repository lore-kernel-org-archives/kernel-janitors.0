From: Sasha Levin <sashal@kernel.org>
Date: Sun, 22 Sep 2019 18:58:52 +0000
Subject: [PATCH AUTOSEL 4.9 19/60] EDAC/altera: Use the proper type for the IRQ status bits
Message-Id: <20190922185934.4305-19-sashal@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190922185934.4305-1-sashal@kernel.org>
In-Reply-To: <20190922185934.4305-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Borislav Petkov <bp@suse.de>, Thor Thayer <thor.thayer@linux.intel.com>, James Morse <james.morse@arm.com>, kernel-janitors@vger.kernel.org, linux-edac <linux-edac@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, Sasha Levin <sashal@kernel.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 8faa1cf6ed82f33009f63986c3776cc48af1b7b2 ]

Smatch complains about the cast of a u32 pointer to unsigned long:

  drivers/edac/altera_edac.c:1878 altr_edac_a10_irq_handler()
  warn: passing casted pointer '&irq_status' to 'find_first_bit()'

This code wouldn't work on a 64 bit big endian system because it would
read past the end of &irq_status.

 [ bp: massage. ]

Fixes: 13ab8448d2c9 ("EDAC, altera: Add ECC Manager IRQ controller support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
Cc: James Morse <james.morse@arm.com>
Cc: kernel-janitors@vger.kernel.org
Cc: linux-edac <linux-edac@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>
Link: https://lkml.kernel.org/r/20190624134717.GA1754@mwanda
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/edac/altera_edac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index b0bd0f64d8f21..6037efa94c9ba 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1651,6 +1651,7 @@ static void altr_edac_a10_irq_handler(struct irq_desc *desc)
 	struct altr_arria10_edac *edac = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	int irq = irq_desc_get_irq(desc);
+	unsigned long bits;
 
 	dberr = (irq = edac->db_irq) ? 1 : 0;
 	sm_offset = dberr ? A10_SYSMGR_ECC_INTSTAT_DERR_OFST :
@@ -1660,7 +1661,8 @@ static void altr_edac_a10_irq_handler(struct irq_desc *desc)
 
 	regmap_read(edac->ecc_mgr_map, sm_offset, &irq_status);
 
-	for_each_set_bit(bit, (unsigned long *)&irq_status, 32) {
+	bits = irq_status;
+	for_each_set_bit(bit, &bits, 32) {
 		irq = irq_linear_revmap(edac->domain, dberr * 32 + bit);
 		if (irq)
 			generic_handle_irq(irq);
-- 
2.20.1
