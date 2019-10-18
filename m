From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Oct 2019 08:23:17 +0000
Subject: [PATCH][next] ASoC: rt1011: fix spelling mistake "temperture" -> "temperature"
Message-Id: <20191018082317.11971-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt1011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index ad049cfddcb0..dcd397a83cb4 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2373,7 +2373,7 @@ static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
 	device_property_read_u32(dev, "realtek,r0_calib",
 		&rt1011->r0_calib);
 
-	dev_dbg(dev, "%s: r0_calib: 0x%x, temperture_calib: 0x%x",
+	dev_dbg(dev, "%s: r0_calib: 0x%x, temperature_calib: 0x%x",
 		__func__, rt1011->r0_calib, rt1011->temperature_calib);
 
 	return 0;
-- 
2.20.1
