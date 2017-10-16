From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Oct 2017 12:19:21 +0000
Subject: [PATCH] asihpi: clean up a couple of build warnings
Message-Id: <20171016121921.12722-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable dpcm is never used and hence can be removed. Variable
runtime is being assigned but is never read, so the assignment
is redundant and can be removed. Cleans up two clang warnings:

Value stored to 'dpcm' is never read
Value stored to 'runtime' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/asihpi/asihpi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 614322171c79..720361455c60 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -573,10 +573,8 @@ static void snd_card_asihpi_pcm_int_start(struct snd_pcm_substream *substream)
 
 static void snd_card_asihpi_pcm_int_stop(struct snd_pcm_substream *substream)
 {
-	struct snd_card_asihpi_pcm *dpcm;
 	struct snd_card_asihpi *card;
 
-	dpcm = (struct snd_card_asihpi_pcm *)substream->runtime->private_data;
 	card = snd_pcm_substream_chip(substream);
 
 	hpi_handle_error(hpi_adapter_set_property(card->hpi->adapter->index,
@@ -863,7 +861,6 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 
 	snd_pcm_group_for_each_entry(s, substream) {
 		struct snd_card_asihpi_pcm *ds = s->runtime->private_data;
-		runtime = s->runtime;
 
 		/* don't link Cap and Play */
 		if (substream->stream != s->stream)
-- 
2.14.1

