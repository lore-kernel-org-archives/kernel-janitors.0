From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Dec 2020 10:07:59 +0000
Subject: [PATCH] ASoC: cs42l56: fix up error handling in probe
Message-Id: <X9NE/9nK9/TuxuL+@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Schulman <james.schulman@cirrus.com>, Brian Austin <brian.austin@cirrus.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, David Rhodes <david.rhodes@cirrus.com>

There are two issues with this code.  The first error path forgot to set
the error code and instead returns success.  The second error path
doesn't clean up.

Fixes: 272b5edd3b8f ("ASoC: Add support for CS42L56 CODEC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/cs42l56.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index bb9599cc832b..c44a5cdb796e 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1250,6 +1250,7 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
 		dev_err(&i2c_client->dev,
 			"CS42L56 Device ID (%X). Expected %X\n",
 			devid, CS42L56_DEVID);
+		ret = -EINVAL;
 		goto err_enable;
 	}
 	alpha_rev = reg & CS42L56_AREV_MASK;
@@ -1307,7 +1308,7 @@ static int cs42l56_i2c_probe(struct i2c_client *i2c_client,
 	ret =  devm_snd_soc_register_component(&i2c_client->dev,
 			&soc_component_dev_cs42l56, &cs42l56_dai, 1);
 	if (ret < 0)
-		return ret;
+		goto err_enable;
 
 	return 0;
 
-- 
2.29.2
