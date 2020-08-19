From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Aug 2020 16:01:03 +0000
Subject: [PATCH][next] ASoC: qcom: add missing out of memory check on drvdata->clks allocation
Message-Id: <20200819160103.164893-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Ajit Pandey <ajitp@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rohit kumar <rohitkr@codeaurora.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently drvdata->clks is not being checked for an allocation failure,
leading to potential null pointer dereferencing. Fix this by adding a
check and returning -ENOMEM if an error occurred.

Addresses-Coverity: ("Dereference null return value")
Fixes: 1220f6a76e77 ("ASoC: qcom: Add common array to initialize soc based core clocks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/qcom/lpass-apq8016.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index dd9e3dd014f6..5c8ae225cd5d 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -168,6 +168,8 @@ static int apq8016_lpass_init(struct platform_device *pdev)
 
 	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
 				     sizeof(*drvdata->clks), GFP_KERNEL);
+	if (!drvdata->clks)
+		return -ENOMEM;
 	drvdata->num_clks = variant->num_clks;
 
 	for (i = 0; i < drvdata->num_clks; i++)
-- 
2.27.0
