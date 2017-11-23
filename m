From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 20:07:51 +0000
Subject: [PATCH 3/3] ASoC: da7218: Improve a size determination in da7218_i2c_probe()
Message-Id: <8f6b7c8c-f1eb-47c7-c11f-731aa8051863@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07c631e4-e2df-7ae2-ea31-9430c89dc8e3@users.sourceforge.net>
In-Reply-To: <07c631e4-e2df-7ae2-ea31-9430c89dc8e3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, support.opensource@diasemi.com, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 20:50:44 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/da7218.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 93a0cb741751..0c1933a98995 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -3269,8 +3269,7 @@ static int da7218_i2c_probe(struct i2c_client *i2c,
 	struct da7218_priv *da7218;
 	int ret;
 
-	da7218 = devm_kzalloc(&i2c->dev, sizeof(struct da7218_priv),
-			      GFP_KERNEL);
+	da7218 = devm_kzalloc(&i2c->dev, sizeof(*da7218), GFP_KERNEL);
 	if (!da7218)
 		return -ENOMEM;
 
-- 
2.15.0

