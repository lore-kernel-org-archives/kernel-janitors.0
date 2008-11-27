From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 27 Nov 2008 13:43:06 +0000
Subject: Re: [PATCH] sound/pci/mixart/mixart.c: Add missing snd_card_free
Message-Id: <s5hk5apz3md.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811271423040.15160@pc-004.diku.dk>
	<Pine.LNX.4.64.0811271432350.15160@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811271432350.15160@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Thu, 27 Nov 2008 14:33:30 +0100 (CET),
Julia Lawall wrote:
> 
> Oops, please ignore this patch.  There is a problem, but the modification 
> is not correct.

How about the patch below?


Takashi

---
diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index ae7601f..3cccfed 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -989,6 +989,7 @@ static int snd_mixart_pcm_digital(struct snd_mixart *chip)
 
 static int snd_mixart_chip_free(struct snd_mixart *chip)
 {
+	chip->mgr->chip[chip->chip_idx] = NULL;
 	kfree(chip);
 	return 0;
 }
