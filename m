From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 14:12:19 +0000
Subject: [PATCH] ASoC: dwc: Delete an error message for a failed memory allocation in dw_i2s_probe()
Message-Id: <c6b7021a-ed0d-cc2e-d722-4960e060e8d3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Alex Deucher <alexander.deucher@amd.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Jaroslav Kysela <perex@perex.cz>, Jose Abreu <Jose.Abreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 16:04:53 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/dwc/dwc-i2s.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index eebe9d34e7a0..e27e21f8569a 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -617,10 +617,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	const char *clk_id;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev) {
-		dev_warn(&pdev->dev, "kzalloc fail\n");
+	if (!dev)
 		return -ENOMEM;
-	}
 
 	dw_i2s_dai = devm_kzalloc(&pdev->dev, sizeof(*dw_i2s_dai), GFP_KERNEL);
 	if (!dw_i2s_dai)
-- 
2.14.0

