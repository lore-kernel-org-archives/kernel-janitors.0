From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 01 Sep 2016 06:52:37 +0000
Subject: [PATCH] ASoC: omap-pcm: off-by-one in 'omap_pcm_limit_supported_formats'
Message-Id: <1472712757-21066-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.ujfalusi@ti.com, jarkko.nikula@bitmer.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

When calling 'snd_pcm_format_physical_width', SNDRV_PCM_FORMAT_LAST is a
valid value, so don't skip it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Un-tested
---
 sound/soc/omap/omap-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/omap/omap-pcm.c b/sound/soc/omap/omap-pcm.c
index a84f677234f0..94e9ff791f3a 100644
--- a/sound/soc/omap/omap-pcm.c
+++ b/sound/soc/omap/omap-pcm.c
@@ -58,7 +58,7 @@ static void omap_pcm_limit_supported_formats(void)
 {
 	int i;
 
-	for (i = 0; i < SNDRV_PCM_FORMAT_LAST; i++) {
+	for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
 		switch (snd_pcm_format_physical_width(i)) {
 		case 8:
 		case 16:
-- 
2.7.4

