From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 16:26:28 +0000
Subject: [PATCH] ASoC: hdmi-codec: fix spelling mistake "plalform" -> "platform"
Message-Id: <20190417162628.10976-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/hdmi-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 35df73e42cbc..b9d9dde9fbaf 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -757,7 +757,7 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 	dev_dbg(dev, "%s()\n", __func__);
 
 	if (!hcd) {
-		dev_err(dev, "%s: No plalform data\n", __func__);
+		dev_err(dev, "%s: No platform data\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.20.1
