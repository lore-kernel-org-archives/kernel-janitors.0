From: Dan Carpenter <error27@gmail.com>
Date: Tue, 16 Mar 2010 06:46:23 +0000
Subject: [patch] sequencer: clean up remove bogus check
Message-Id: <20100316064623.GA5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

A few lines earlier bend is limited to 2399.  So semitones is always
less than 24 here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/oss/sequencer.c b/sound/oss/sequencer.c
index c798746..e85789e 100644
--- a/sound/oss/sequencer.c
+++ b/sound/oss/sequencer.c
@@ -1631,8 +1631,6 @@ unsigned long compute_finetune(unsigned long base_freq, int bend, int range,
 	}
 
 	semitones = bend / 100;
-	if (semitones > 99)
-		semitones = 99;
 	cents = bend % 100;
 
 	amount = (int) (semitone_tuning[semitones] * multiplier * cent_tuning[cents]) / 10000;
