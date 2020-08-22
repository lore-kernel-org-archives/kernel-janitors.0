From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 22 Aug 2020 13:11:24 +0000
Subject: [PATCH] media: staging/intel-ipu3: css: Correctly reset some memory
Message-Id: <20200822131124.157917-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org, yong.zhi@intel.com
Cc: devel@driverdev.osuosl.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

The intent here is to reset the whole 'scaler_coeffs_luma' array, not just
the first element.

Fixes: 	e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/media/ipu3/ipu3-css-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
index fbd53d7c097c..e9d6bd9e9332 100644
--- a/drivers/staging/media/ipu3/ipu3-css-params.c
+++ b/drivers/staging/media/ipu3/ipu3-css-params.c
@@ -159,7 +159,7 @@ imgu_css_scaler_calc(u32 input_width, u32 input_height, u32 target_width,
 
 	memset(&cfg->scaler_coeffs_chroma, 0,
 	       sizeof(cfg->scaler_coeffs_chroma));
-	memset(&cfg->scaler_coeffs_luma, 0, sizeof(*cfg->scaler_coeffs_luma));
+	memset(&cfg->scaler_coeffs_luma, 0, sizeof(cfg->scaler_coeffs_luma));
 	do {
 		phase_step_correction++;
 
-- 
2.25.1
