From: Dan Carpenter <error27@gmail.com>
Date: Fri, 14 May 2010 14:48:28 +0000
Subject: [patch -next] sound/es1688: add pedantic range checks
Message-Id: <20100514144824.GB17487@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Jean Delvare <khali@linux-fr.org>, Krzysztof Helt <krzysztof.h1@wp.pl>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org

Smatch complains that if (dev = SNDRV_CARDS) we're one past the end of
the array.  That's unlikely to happen in real life, I suppose.

Also smatch complains about "strcpy(card->shortname, pcm->name);"
The "pcm->name" buffer is 80 characters and "card->shortname" is 32
characters.  If you follow the call paths it turns out we never actually
use more than 16 characters so it's not a problem.  But anyway, let's 
make it easy for people auditing this in the future.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index fdcce31..0cde813 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -149,10 +149,11 @@ static int __devinit snd_es1688_probe(struct snd_card *card, unsigned int n)
 	if (error < 0)
 		return error;
 
-	strcpy(card->driver, "ES1688");
-	strcpy(card->shortname, pcm->name);
-	sprintf(card->longname, "%s at 0x%lx, irq %i, dma %i", pcm->name,
-		chip->port, chip->irq, chip->dma8);
+	strlcpy(card->driver, "ES1688", sizeof(card->driver));
+	strlcpy(card->shortname, pcm->name, sizeof(card->shortname));
+	snprintf(card->longname, sizeof(card->longname),
+		"%s at 0x%lx, irq %i, dma %i", pcm->name, chip->port,
+		 chip->irq, chip->dma8);
 
 	if (fm_port[n] = SNDRV_AUTO_PORT)
 		fm_port[n] = port[n];	/* share the same port */
@@ -271,6 +272,8 @@ static int __devinit snd_es968_pnp_detect(struct pnp_card_link *pcard,
 		if (enable[dev] && isapnp[dev])
 			break;
 	}
+	if (dev = SNDRV_CARDS)
+		return -ENODEV;
 
 	error = snd_card_create(index[dev], id[dev], THIS_MODULE,
 				sizeof(struct snd_es1688), &card);
