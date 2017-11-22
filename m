From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 20:30:22 +0000
Subject: [PATCH 2/2] ASoC: cs35l34: Improve two size determinations in cs35l34_i2c_probe()
Message-Id: <044cfc92-158f-3bff-a2e6-4993a9070e13@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f524230c-6dbd-cb66-4c61-570b5ef185c1@users.sourceforge.net>
In-Reply-To: <f524230c-6dbd-cb66-4c61-570b5ef185c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 21:17:42 +0100

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/cs35l34.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 6cbdbbe53940..0600d5264c4c 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -1004,9 +1004,7 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client,
 	unsigned int devid = 0;
 	unsigned int reg;
 
-	cs35l34 = devm_kzalloc(&i2c_client->dev,
-			       sizeof(struct cs35l34_private),
-			       GFP_KERNEL);
+	cs35l34 = devm_kzalloc(&i2c_client->dev, sizeof(*cs35l34), GFP_KERNEL);
 	if (!cs35l34)
 		return -ENOMEM;
 
@@ -1042,9 +1040,8 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c_client,
 	if (pdata) {
 		cs35l34->pdata = *pdata;
 	} else {
-		pdata = devm_kzalloc(&i2c_client->dev,
-				sizeof(struct cs35l34_platform_data),
-				GFP_KERNEL);
+		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
+				     GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
-- 
2.15.0

