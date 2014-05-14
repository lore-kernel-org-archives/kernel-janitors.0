From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 May 2014 14:23:08 +0000
Subject: [patch] ASoC: compress: indent an if statement
Message-Id: <20140514142308.GC18082@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

The return statement was not indented correctly.  I lined up the
condition a bit as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 91083e6..e4c7ad5 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -317,8 +317,9 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 		cmd = SND_COMPR_TRIGGER_DRAIN) {
 
 		if (platform->driver->compr_ops &&
-			platform->driver->compr_ops->trigger)
-		return platform->driver->compr_ops->trigger(cstream, cmd);
+		    platform->driver->compr_ops->trigger)
+			return platform->driver->compr_ops->trigger(cstream,
+								    cmd);
 	}
 
 	if (cstream->direction = SND_COMPRESS_PLAYBACK)
