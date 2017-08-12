From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 12 Aug 2017 06:33:02 +0000
Subject: [PATCH] ASoC: Intel: constify snd_compr_codec_caps structures
Message-Id: <1502519582-3338-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Bhumika Goyal <bhumirks@gmail.com>

These snd_compr_codec_caps structures are only copied into other
structures, so they can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/intel/atom/sst/sst_drv_interface.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index ce689c5..71af544 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -407,7 +407,7 @@ static int sst_cdev_caps(struct snd_compr_caps *caps)
 	return 0;
 }
 
-static struct snd_compr_codec_caps caps_mp3 = {
+static const struct snd_compr_codec_caps caps_mp3 = {
 	.num_descriptors = 1,
 	.descriptor[0].max_ch = 2,
 	.descriptor[0].sample_rates[0] = 48000,
@@ -424,7 +424,7 @@ static int sst_cdev_caps(struct snd_compr_caps *caps)
 	.descriptor[0].formats = 0,
 };
 
-static struct snd_compr_codec_caps caps_aac = {
+static const struct snd_compr_codec_caps caps_aac = {
 	.num_descriptors = 2,
 	.descriptor[1].max_ch = 2,
 	.descriptor[0].sample_rates[0] = 48000,

