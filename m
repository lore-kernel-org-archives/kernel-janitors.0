From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:00:50 +0000
Subject: [PATCH] ALSA: cs46xx: fix spelling mistake "to" -> "too"
Message-Id: <20200123000050.2831088-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427190245.16861-1-colin.king@canonical.com>
In-Reply-To: <20180427190245.16861-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 2c5c9d4c1d94..6b536fc23ca6 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -1293,7 +1293,7 @@ cs46xx_dsp_create_pcm_channel (struct snd_cs46xx * chip,
 	if (src_scb = NULL) {
 		if (ins->nsrc_scb >= DSP_MAX_SRC_NR) {
 			dev_err(chip->card->dev,
-				"dsp_spos: to many SRC instances\n!");
+				"dsp_spos: too many SRC instances\n!");
 			return NULL;
 		}
 
-- 
2.24.0
