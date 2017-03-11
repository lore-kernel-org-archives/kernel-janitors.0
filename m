From: Colin King <colin.king@canonical.com>
Date: Sat, 11 Mar 2017 19:19:22 +0000
Subject: [PATCH] ASoC: cs35l35: trivial fix to indentation
Message-Id: <20170311191922.6209-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Austin <brian.austin@cirrus.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jiri Kosina <trivial@kernel.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove extraneous tab to correct the nesting level indentation

Detected by CoverityScan, CID#1416584 ("Nesting level does
not match indentation")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/cs35l35.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 260ed42..43d33f4 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1370,7 +1370,8 @@ static int cs35l35_i2c_probe(struct i2c_client *i2c_client,
 
 	for (i = 0; i < ARRAY_SIZE(cs35l35_supplies); i++)
 		cs35l35->supplies[i].supply = cs35l35_supplies[i];
-		cs35l35->num_supplies = ARRAY_SIZE(cs35l35_supplies);
+
+	cs35l35->num_supplies = ARRAY_SIZE(cs35l35_supplies);
 
 	ret = devm_regulator_bulk_get(&i2c_client->dev,
 			cs35l35->num_supplies,
-- 
2.10.2

