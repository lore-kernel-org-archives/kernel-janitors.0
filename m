From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 21:23:41 +0000
Subject: [PATCH 2/2] ASoC: cs42l52: Improve two size determinations in cs42l52_i2c_probe()
Message-Id: <d02ceefc-8918-f24d-6de7-8c6f348d5ed9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
In-Reply-To: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 22:11:30 +0100

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/cs42l52.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index e8645f2ac0d9..9731e5dff291 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1100,8 +1100,7 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client,
 	unsigned int reg;
 	u32 val32;
 
-	cs42l52 = devm_kzalloc(&i2c_client->dev, sizeof(struct cs42l52_private),
-			       GFP_KERNEL);
+	cs42l52 = devm_kzalloc(&i2c_client->dev, sizeof(*cs42l52), GFP_KERNEL);
 	if (cs42l52 = NULL)
 		return -ENOMEM;
 	cs42l52->dev = &i2c_client->dev;
@@ -1115,9 +1114,8 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client,
 	if (pdata) {
 		cs42l52->pdata = *pdata;
 	} else {
-		pdata = devm_kzalloc(&i2c_client->dev,
-				     sizeof(struct cs42l52_platform_data),
-				GFP_KERNEL);
+		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
+				     GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
-- 
2.15.0

