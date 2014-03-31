From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 31 Mar 2014 07:49:15 +0000
Subject: [patch] ALSA: asihpi: fix some indenting in snd_card_asihpi_pcm_new()
Message-Id: <20140331074915.GA24854@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Eldad Zack <eldad@fogrefinery.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

This used to be a part of a condition until f3d145aac913 ('ALSA: asihpi:
MMAP for non-busmaster cards') but now it's not and we can remove an
indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index e4e42f2..901c949 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -1253,11 +1253,12 @@ static int snd_card_asihpi_pcm_new(struct snd_card_asihpi *asihpi, int device)
 			num_outstreams,	num_instreams, &pcm);
 	if (err < 0)
 		return err;
+
 	/* pointer to ops struct is stored, dont change ops afterwards! */
-		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
-				&snd_card_asihpi_playback_mmap_ops);
-		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
-				&snd_card_asihpi_capture_mmap_ops);
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
+			&snd_card_asihpi_playback_mmap_ops);
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
+			&snd_card_asihpi_capture_mmap_ops);
 
 	pcm->private_data = asihpi;
 	pcm->info_flags = 0;
