From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 08:44:03 +0000
Subject: [PATCH 1/2] ASoC: cs42l56: Delete an error message for a failed memory allocation in cs42l56_i2c_pro
Message-Id: <23adac87-3c2b-a264-348a-aaf7cbba5420@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d722241a-dca3-dac3-8288-ac2e283e8be8@users.sourceforge.net>
In-Reply-To: <d722241a-dca3-dac3-8288-ac2e283e8be8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 09:26:08 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/cs42l56.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index cb6ca85f1536..13ee46217d78 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1210,11 +1210,9 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
 		pdata = devm_kzalloc(&i2c_client->dev,
 				     sizeof(struct cs42l56_platform_data),
 				     GFP_KERNEL);
-		if (!pdata) {
-			dev_err(&i2c_client->dev,
-				"could not allocate pdata\n");
+		if (!pdata)
 			return -ENOMEM;
-		}
+
 		if (i2c_client->dev.of_node) {
 			ret = cs42l56_handle_of_data(i2c_client,
 						     &cs42l56->pdata);
-- 
2.15.0

