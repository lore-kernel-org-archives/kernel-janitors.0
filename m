From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 20 Nov 2011 20:57:49 +0000
Subject: [patch] ALSA: cs5535 - Fix an endianness conversion
Message-Id: <20111120205748.GA7354@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaya Kumar <jayakumar.alsa@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

desc->size is supposed to be a le16 type.  On a big endian system the
current code will set ->size to zero.  We fixed a similar bug
on the next line but missed this one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker bug.  I haven't tested it.

diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index e083122..dbf94b1 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -148,7 +148,7 @@ static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 		struct cs5535audio_dma_desc *desc  			&((struct cs5535audio_dma_desc *) dma->desc_buf.area)[i];
 		desc->addr = cpu_to_le32(addr);
-		desc->size = cpu_to_le32(period_bytes);
+		desc->size = cpu_to_le16(period_bytes);
 		desc->ctlreserved = cpu_to_le16(PRD_EOP);
 		desc_addr += sizeof(struct cs5535audio_dma_desc);
 		addr += period_bytes;
