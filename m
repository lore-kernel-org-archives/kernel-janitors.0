From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2015 11:26:37 +0000
Subject: [patch] ALSA: msnd: add some missing curly braces
Message-Id: <20150305112637.GB13378@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

There were some curly braces intended here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/isa/msnd/msnd_pinnacle_mixer.c b/sound/isa/msnd/msnd_pinnacle_mixer.c
index 17e49a0..b408540 100644
--- a/sound/isa/msnd/msnd_pinnacle_mixer.c
+++ b/sound/isa/msnd/msnd_pinnacle_mixer.c
@@ -306,11 +306,12 @@ int snd_msndmix_new(struct snd_card *card)
 	spin_lock_init(&chip->mixer_lock);
 	strcpy(card->mixername, "MSND Pinnacle Mixer");
 
-	for (idx = 0; idx < ARRAY_SIZE(snd_msnd_controls); idx++)
+	for (idx = 0; idx < ARRAY_SIZE(snd_msnd_controls); idx++) {
 		err = snd_ctl_add(card,
 				  snd_ctl_new1(snd_msnd_controls + idx, chip));
 		if (err < 0)
 			return err;
+	}
 
 	return 0;
 }
