From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 15:49:29 +0000
Subject: [PATCH 2/3] ASoC: cs42l73: Improve two size determinations in cs42l73_i2c_probe()
Message-Id: <7229b291-d1e3-6269-4c68-435bbdffb0fd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
In-Reply-To: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 16:07:42 +0100

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/cs42l73.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 978cfbbad408..dde37e569ade 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1289,8 +1289,7 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client,
 	unsigned int reg;
 	u32 val32;
 
-	cs42l73 = devm_kzalloc(&i2c_client->dev, sizeof(struct cs42l73_private),
-			       GFP_KERNEL);
+	cs42l73 = devm_kzalloc(&i2c_client->dev, sizeof(*cs42l73), GFP_KERNEL);
 	if (!cs42l73)
 		return -ENOMEM;
 
@@ -1304,9 +1303,8 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client,
 	if (pdata) {
 		cs42l73->pdata = *pdata;
 	} else {
-		pdata = devm_kzalloc(&i2c_client->dev,
-				     sizeof(struct cs42l73_platform_data),
-				GFP_KERNEL);
+		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
+				     GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
-- 
2.15.0

