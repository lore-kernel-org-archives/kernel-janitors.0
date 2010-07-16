From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:15:59 +0000
Subject: [PATCH 12/15] pci: riptide: check kzalloc() result
Message-Id: <1279296959-25227-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Alexey Dobriyan <adobriyan@gmail.com>, Dan Carpenter <error27@gmail.com>, Andy Shevchenko <ext-andriy.shevchenko@nokia.com>, Roel Kluin <roel.kluin@gmail.com>, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org

If kzalloc() fails exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 sound/pci/riptide/riptide.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 59d7996..f64fb7d 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -1615,7 +1615,10 @@ static int snd_riptide_playback_open(struct snd_pcm_substream *substream)
 
 	chip->playback_substream[sub_num] = substream;
 	runtime->hw = snd_riptide_playback;
+
 	data = kzalloc(sizeof(struct pcmhw), GFP_KERNEL);
+	if (data = NULL)
+		return -ENOMEM;
 	data->paths = lbus_play_paths[sub_num];
 	data->id = play_ids[sub_num];
 	data->source = play_sources[sub_num];
@@ -1635,7 +1638,10 @@ static int snd_riptide_capture_open(struct snd_pcm_substream *substream)
 
 	chip->capture_substream = substream;
 	runtime->hw = snd_riptide_capture;
+
 	data = kzalloc(sizeof(struct pcmhw), GFP_KERNEL);
+	if (data = NULL)
+		return -ENOMEM;
 	data->paths = lbus_rec_path;
 	data->id = PADC;
 	data->source = ACLNK2PADC;
-- 
1.7.0.4

