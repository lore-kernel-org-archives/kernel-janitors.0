From: Colin King <colin.king@canonical.com>
Date: Sun, 26 Aug 2018 22:09:52 +0000
Subject: [PATCH] ALSA: hdspm: fix spelling mistake "Initializeing" -> "Initializing"
Message-Id: <20180826220952.12335-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_dbg message and also remove
extraneous white space and repeated question marks.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/pci/rme9652/hdspm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 11b5b5e0e058..679ad0415e3b 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6534,7 +6534,7 @@ static int snd_hdspm_create_alsa_devices(struct snd_card *card,
 	dev_dbg(card->dev, "Update mixer controls...\n");
 	hdspm_update_simple_mixer_controls(hdspm);
 
-	dev_dbg(card->dev, "Initializeing complete ???\n");
+	dev_dbg(card->dev, "Initializing complete?\n");
 
 	err = snd_card_register(card);
 	if (err < 0) {
-- 
2.17.1
