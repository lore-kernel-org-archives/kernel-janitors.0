From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2020 14:48:18 +0000
Subject: [PATCH] ALSA: cs5535audio: Fix a math error in cs5535audio_build_dma_packets()
Message-Id: <20200508144818.GA411239@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaya Kumar <jayakumar.alsa@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

We want to allocate enough space for CS5535AUDIO_MAX_DESCRIPTORS + 1
elements and we also want the size to rounded up to PAGE_SIZE.  The
"+ 1" is because we don't use the zeroeth element.

CS5535AUDIO_MAX_DESCRIPTORS is 128.  Each element is 8 bytes.  So it
should be "(128 + 1) * 8 = 1032" but rounded up that becomes 4096.  In
the original code, it did the "+ 1" after rounding up so so it allocated
4097 bytes.  The DMA API will probably round this up to two pages.

Fixes: 9b4ffa48ae85 ("[ALSA] Add support for the CS5535 Audio device")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/cs5535audio/cs5535audio_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 4032b89b1fc1d..f6324636b355f 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -100,7 +100,7 @@ static int snd_cs5535audio_playback_close(struct snd_pcm_substream *substream)
 }
 
 #define CS5535AUDIO_DESC_LIST_SIZE \
-	PAGE_ALIGN(CS5535AUDIO_MAX_DESCRIPTORS * sizeof(struct cs5535audio_dma_desc))
+	PAGE_ALIGN((CS5535AUDIO_MAX_DESCRIPTORS + 1) * sizeof(struct cs5535audio_dma_desc))
 
 static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 					 struct cs5535audio_dma *dma,
@@ -118,7 +118,7 @@ static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 	if (dma->desc_buf.area = NULL) {
 		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
 					&cs5535au->pci->dev,
-					CS5535AUDIO_DESC_LIST_SIZE+1,
+					CS5535AUDIO_DESC_LIST_SIZE,
 					&dma->desc_buf) < 0)
 			return -ENOMEM;
 		dma->period_bytes = dma->periods = 0;
-- 
2.26.2
