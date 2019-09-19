From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 19 Sep 2019 15:38:04 +0000
Subject: [PATCH] ASoC: xlnx: Use devm_platform_ioremap_resource() in xlnx_formatter_pcm_probe()
Message-Id: <8f7cf483-6ab3-d00f-5606-863e9f5b31fc@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Stephen Boyd <swboyd@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Sep 2019 17:27:57 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 48970efe7838..fb652e73abeb 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -564,7 +564,6 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	int ret;
 	u32 val;
 	struct xlnx_pcm_drv_data *aud_drv_data;
-	struct resource *res;
 	struct device *dev = &pdev->dev;

 	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
@@ -584,13 +583,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		return ret;
 	}

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "audio formatter node:addr to resource failed\n");
-		ret = -ENXIO;
-		goto clk_err;
-	}
-	aud_drv_data->mmio = devm_ioremap_resource(dev, res);
+	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aud_drv_data->mmio)) {
 		dev_err(dev, "audio formatter ioremap failed\n");
 		ret = PTR_ERR(aud_drv_data->mmio);
--
2.23.0
