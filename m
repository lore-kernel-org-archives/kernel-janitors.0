From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2019 06:31:51 +0000
Subject: [PATCH] ASoC: cs35l36: Fix an IS_ERR() vs NULL checking bug
Message-Id: <20190222063151.GC30993@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Austin <brian.austin@cirrus.com>, James Schulman <james.schulman@cirrus.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The irq_get_irq_data() function doesn't return error pointers, it
returns NULL.

Fixes: 6ba9dd6c893b ("ASoC: cs35l36: Add support for Cirrus CS35L36 Amplifier")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/cs35l36.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index e374fffb7e17..901d57491218 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1845,9 +1845,9 @@ static int cs35l36_i2c_probe(struct i2c_client *i2c_client,
 		cs35l36_apply_vpbr_config(cs35l36);
 
 	irq_d = irq_get_irq_data(i2c_client->irq);
-	if (IS_ERR(irq_d)) {
+	if (!irq_d) {
 		dev_err(&i2c_client->dev, "Invalid IRQ: %d\n", i2c_client->irq);
-		ret = PTR_ERR(irq_d);
+		ret = -ENODEV;
 		goto err;
 	}
 
-- 
2.17.1
