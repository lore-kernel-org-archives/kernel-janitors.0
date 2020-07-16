From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Jul 2020 14:51:38 +0000
Subject: [PATCH] media: atomisp: fix mask and shift operation on ISPSSPM0
Message-Id: <20200716145138.1708693-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check on bits 25:24 on ISPSSPM0 is always 0 because
the mask and shift operations are incorrect. Fix this by shifting
by MRFLD_ISPSSPM0_ISPSSS_OFFSET (24 bits right) and then masking
with RFLD_ISPSSPM0_ISPSSC_MASK (0x03) to get the appropriate 2 bits
to check.

Addresses-Coverity: ("Operands don't affect result")
Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index d36809a0182c..a59d11aa232d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -755,7 +755,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 
 		/* Wait until ISPSSPM0 bit[25:24] shows the right value */
 		iosf_mbi_read(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0, &tmp);
-		tmp = (tmp & MRFLD_ISPSSPM0_ISPSSC_MASK) >> MRFLD_ISPSSPM0_ISPSSS_OFFSET;
+		tmp = (tmp >> MRFLD_ISPSSPM0_ISPSSS_OFFSET) & MRFLD_ISPSSPM0_ISPSSC_MASK;
 		if (tmp = val) {
 			trace_ipu_cstate(enable);
 			return 0;
-- 
2.27.0
