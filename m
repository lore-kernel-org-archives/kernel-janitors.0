From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Aug 2019 14:01:51 +0000
Subject: [PATCH] ALSA: sb: remove redundant assignment to variable result
Message-Id: <20190813140151.9865-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable result is initialized to a value that is never read and it is
re-assigned later. The initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/isa/sb/sb_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/sb/sb_common.c b/sound/isa/sb/sb_common.c
index 162338f1b68a..ff031d670400 100644
--- a/sound/isa/sb/sb_common.c
+++ b/sound/isa/sb/sb_common.c
@@ -80,7 +80,7 @@ int snd_sbdsp_reset(struct snd_sb *chip)
 
 static int snd_sbdsp_version(struct snd_sb * chip)
 {
-	unsigned int result = -ENODEV;
+	unsigned int result;
 
 	snd_sbdsp_command(chip, SB_DSP_GET_VERSION);
 	result = (short) snd_sbdsp_get_byte(chip) << 8;
-- 
2.20.1
