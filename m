From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 12:44:45 +0000
Subject: [PATCH 2/2] ASoC: rockchip: Delete an unnecessary variable initialisation in rk_aif1_hw_params()
Message-Id: <ad5a1eaa-cc97-6d53-f71c-17f43cbd5b25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <255fa488-a5f1-2ea3-dd48-b10ad8b2c18c@users.sourceforge.net>
In-Reply-To: <255fa488-a5f1-2ea3-dd48-b10ad8b2c18c-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 13:26:06 +0100

The variable "ret" will eventually be set to an appropriate value
a bit later. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/rockchip/rockchip_max98090.c | 2 +-
 sound/soc/rockchip/rockchip_rt5645.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 419fa6ef14bb..6d661a93588f 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -76,7 +76,7 @@ static const struct snd_kcontrol_new rk_mc_controls[] = {
 static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	int ret = 0;
+	int ret;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index 7f763d0963d3..d032d8bd15b9 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -70,7 +70,7 @@ static const struct snd_kcontrol_new rk_mc_controls[] = {
 static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	int ret = 0;
+	int ret;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-- 
2.15.0

