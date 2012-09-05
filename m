From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2012 12:29:46 +0000
Subject: [patch] ASoC: wm0010: unlock on error path
Message-Id: <20120905122946.GA6128@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.de>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>

We're holding the wm0010->lock mutex when we goto err_core.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This driver is only in linux-next.

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 5f99148..1c052d6 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -663,7 +663,9 @@ abort:
 	wm0010_halt(codec);
 	mutex_unlock(&wm0010->lock);
 	return ret;
+
 err_core:
+	mutex_unlock(&wm0010->lock);
 	regulator_bulk_disable(ARRAY_SIZE(wm0010->core_supplies),
 			       wm0010->core_supplies);
 err:
