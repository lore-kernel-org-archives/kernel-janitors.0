From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Mar 2020 10:39:03 +0000
Subject: [PATCH][next] ASoc: amd: use correct format specifier for a long int
Message-Id: <20200303103903.9259-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the format specifier %d is being used for a long int. Fix
the by using %ld instead.

Fixes warning:
sound/soc/amd/acp3x-rt5682-max9836.c:341:23: warning: format '%d'
 expects argument of type 'int', but argument 3 has type
 'long int' [-Wformat=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 511b8b1722aa..521c9ab4c29c 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -338,7 +338,7 @@ static int acp3x_probe(struct platform_device *pdev)
 
 	dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
 	if (IS_ERR(dmic_sel)) {
-		dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
+		dev_err(&pdev->dev, "DMIC gpio failed err=%ld\n",
 			PTR_ERR(dmic_sel));
 		return PTR_ERR(dmic_sel);
 	}
-- 
2.25.0
