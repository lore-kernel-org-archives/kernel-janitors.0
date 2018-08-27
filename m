From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Aug 2018 09:21:45 +0000
Subject: [PATCH] ALSA: pcm: signedness bug in snd_pcm_plug_alloc()
Message-Id: <20180827092144.5oj6obfb3zabp5us@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

The "frames" variable is unsigned so the error handling doesn't work
properly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 0391cb1a4f19..141c5f3a9575 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -111,7 +111,7 @@ int snd_pcm_plug_alloc(struct snd_pcm_substream *plug, snd_pcm_uframes_t frames)
 		while (plugin->next) {
 			if (plugin->dst_frames)
 				frames = plugin->dst_frames(plugin, frames);
-			if (snd_BUG_ON(frames <= 0))
+			if (snd_BUG_ON((snd_pcm_sframes_t)frames <= 0))
 				return -ENXIO;
 			plugin = plugin->next;
 			err = snd_pcm_plugin_alloc(plugin, frames);
@@ -123,7 +123,7 @@ int snd_pcm_plug_alloc(struct snd_pcm_substream *plug, snd_pcm_uframes_t frames)
 		while (plugin->prev) {
 			if (plugin->src_frames)
 				frames = plugin->src_frames(plugin, frames);
-			if (snd_BUG_ON(frames <= 0))
+			if (snd_BUG_ON((snd_pcm_sframes_t)frames <= 0))
 				return -ENXIO;
 			plugin = plugin->prev;
 			err = snd_pcm_plugin_alloc(plugin, frames);
