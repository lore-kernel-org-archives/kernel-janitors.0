From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Oct 2017 12:18:36 +0000
Subject: [PATCH] ALSA: emu10k1: remove redundant assignment to tmp
Message-Id: <20171017121836.20436-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to variable tmp is redundant as the value is never
read and a new value is assigned to tmp in the following for-loop,
so remove the assignment.
Cleans up clang warning: Value stored to 'tmp' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/emu10k1/emuproc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index cf05229b569b..bde0d1954f56 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -280,7 +280,6 @@ static void snd_emu10k1_proc_rates_read(struct snd_info_entry *entry,
 	struct snd_emu10k1 *emu = entry->private_data;
 	unsigned int val, tmp, n;
 	val = snd_emu10k1_ptr20_read(emu, CAPTURE_RATE_STATUS, 0);
-	tmp = (val >> 16) & 0x8;
 	for (n = 0; n < 4; n++) {
 		tmp = val >> (16 + (n*4));
 		if (tmp & 0x8) snd_iprintf(buffer, "Channel %d: Rate=%d\n", n, samplerate[tmp & 0x7]);
-- 
2.14.1

