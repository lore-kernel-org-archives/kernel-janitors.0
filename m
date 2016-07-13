From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 09:59:53 +0000
Subject: [patch] ALSA: mixart: don't print an unintialized variable on error
Message-Id: <20160713095953.GA29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

My static checker complains that "resp" could be unitialized on error
when we print its value.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/mixart/mixart_mixer.c b/sound/pci/mixart/mixart_mixer.c
index 58fd79eb..51e5349 100644
--- a/sound/pci/mixart/mixart_mixer.c
+++ b/sound/pci/mixart/mixart_mixer.c
@@ -965,7 +965,7 @@ static int mixart_update_monitoring(struct snd_mixart* chip, int channel)
 	int err;
 	struct mixart_msg request;
 	struct mixart_set_out_audio_level audio_level;
-	u32 resp;
+	u32 resp = 0;
 
 	if(chip->pipe_out_ana.status = PIPE_UNDEFINED)
 		return -EINVAL; /* no pipe defined */
