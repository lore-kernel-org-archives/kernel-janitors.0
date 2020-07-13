From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jul 2020 10:53:24 +0000
Subject: [PATCH] ALSA: echoaudio: re-enable IRQs on failure path
Message-Id: <20200713105324.GB251988@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Mark Hills <mark@xwax.org>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>

This should be spin_unlock_irq() instead of spin_lock().

Fixes: 6c3312544873 ("ALSA: echoaudio: Prevent races in calls to set_audio_format()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/echoaudio/echoaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index e81f42811f45..6aeb99aa2414 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -721,7 +721,7 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 	spin_lock_irq(&chip->lock);
 
 	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index))) {
-		spin_unlock(&chip->lock);
+		spin_unlock_irq(&chip->lock);
 		return -EINVAL;
 	}
 
-- 
2.27.0
