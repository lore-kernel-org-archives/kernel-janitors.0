From: Dan Carpenter <error27@gmail.com>
Date: Mon, 21 Jun 2010 06:46:35 +0000
Subject: [patch] pci: off by one in dmar_get_fault_reason()
Message-Id: <20100621064635.GB5940@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This should be '<' here instead of '<=' so we don't go past the end of
the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/pci/dmar.c b/drivers/pci/dmar.c
index 0a19708..3043636 100644
--- a/drivers/pci/dmar.c
+++ b/drivers/pci/dmar.c
@@ -1208,7 +1208,7 @@ static const char *intr_remap_fault_reasons[]  
 const char *dmar_get_fault_reason(u8 fault_reason, int *fault_type)
 {
-	if (fault_reason >= 0x20 && (fault_reason <= 0x20 +
+	if (fault_reason >= 0x20 && (fault_reason < 0x20 +
 				     ARRAY_SIZE(intr_remap_fault_reasons))) {
 		*fault_type = INTR_REMAP;
 		return intr_remap_fault_reasons[fault_reason - 0x20];
