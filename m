From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2018 09:16:07 +0000
Subject: [PATCH] ALSA: dice: fix a bounds check in snd_dice_detect_tcelectronic_formats()
Message-Id: <20180518091607.GA32078@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>
Cc: alsa-devel@alsa-project.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

The "entry" pointer is always non-NULL so this test for out of bounds
won't work.

Fixes: f1f0f330b1d0 ("ALSA: dice: add parameters of stream formats for models produced by TC Electronic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/firewire/dice/dice-tcelectronic.c b/sound/firewire/dice/dice-tcelectronic.c
index af8203b9d1a6..e134a5110c6c 100644
--- a/sound/firewire/dice/dice-tcelectronic.c
+++ b/sound/firewire/dice/dice-tcelectronic.c
@@ -75,13 +75,12 @@ int snd_dice_detect_tcelectronic_formats(struct snd_dice *dice)
 		}
 	}
 
-	entry = NULL;
 	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
 		entry = entries + i;
 		if (entry->model_id = model_id)
 			break;
 	}
-	if (!entry)
+	if (i = ARRAY_SIZE(entries))
 		return -ENODEV;
 
 	memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
