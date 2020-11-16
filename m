From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Nov 2020 12:59:50 +0000
Subject: [PATCH] ASoC: qcom: sc7180: initialize the "no_headphone" variable
Message-Id: <20201116125950.GA44063@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The "no_headphone" variable is never set to "false" so it could be
uninitialized.

Fixes: e936619b7ce7 ("ASoC: qcom: sc7180: Modify machine driver for sound card")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Apparently we recently turned off uninitialized variable warnings by
default in commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized")

 sound/soc/qcom/sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index e2e6567566af..de70fa792aea 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -316,7 +316,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *link;
 	int ret;
 	int i;
-	bool no_headphone;
+	bool no_headphone = false;
 
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-- 
2.29.2
