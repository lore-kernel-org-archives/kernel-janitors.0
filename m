From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 07:40:22 +0000
Subject: [PATCH 4/4] ASoC: wm2000: Improve a size determination in wm2000_i2c_probe()
Message-Id: <a6e50094-3d1c-6ad4-67e4-377036f5ccd6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
In-Reply-To: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 08:18:14 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/wm2000.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 2151e75ee5c6..86e7f9ebab44 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -826,8 +826,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	int reg;
 	u16 id;
 
-	wm2000 = devm_kzalloc(&i2c->dev, sizeof(struct wm2000_priv),
-			      GFP_KERNEL);
+	wm2000 = devm_kzalloc(&i2c->dev, sizeof(*wm2000), GFP_KERNEL);
 	if (!wm2000)
 		return -ENOMEM;
 
-- 
2.15.0

