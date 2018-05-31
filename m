From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 06:25:47 +0000
Subject: [PATCH] ALSA: xen-front: signdness bug in alsa_prepare()
Message-Id: <20180531062547.xfcmrfx7vmnef6gm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

"sndif_format" needs to be signed for the error handling to work.

Fixes: 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index 5041f83e98d2..43478f66954a 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -463,7 +463,7 @@ static int alsa_prepare(struct snd_pcm_substream *substream)
 
 	if (!stream->is_open) {
 		struct snd_pcm_runtime *runtime = substream->runtime;
-		u8 sndif_format;
+		int sndif_format;
 		int ret;
 
 		sndif_format = to_sndif_format(runtime->format);
