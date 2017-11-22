From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 21:22:14 +0000
Subject: [PATCH 1/2] ASoC: cs42l52: Delete an error message for a failed memory allocation in cs42l52_i2c_pro
Message-Id: <0c7a61a4-580e-e7ae-acef-047f8cff24ca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
In-Reply-To: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 22:08:06 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/cs42l52.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 0d9c4a57301b..e8645f2ac0d9 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1118,10 +1118,9 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client,
 		pdata = devm_kzalloc(&i2c_client->dev,
 				     sizeof(struct cs42l52_platform_data),
 				GFP_KERNEL);
-		if (!pdata) {
-			dev_err(&i2c_client->dev, "could not allocate pdata\n");
+		if (!pdata)
 			return -ENOMEM;
-		}
+
 		if (i2c_client->dev.of_node) {
 			if (of_property_read_bool(i2c_client->dev.of_node,
 				"cirrus,mica-differential-cfg"))
-- 
2.15.0

