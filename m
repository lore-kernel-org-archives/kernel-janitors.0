From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 06:56:54 +0000
Subject: [patch] ASoC: core: double free in snd_soc_add_platform()
Message-Id: <20130722065654.GC14617@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>

There are three callers for this function, and none of them want it to
free platform for them.  It leads to a double free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0ec070c..d82ee38 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3908,10 +3908,8 @@ int snd_soc_add_platform(struct device *dev, struct snd_soc_platform *platform,
 {
 	/* create platform component name */
 	platform->name = fmt_single_name(dev, &platform->id);
-	if (platform->name = NULL) {
-		kfree(platform);
+	if (platform->name = NULL)
 		return -ENOMEM;
-	}
 
 	platform->dev = dev;
 	platform->driver = platform_drv;
