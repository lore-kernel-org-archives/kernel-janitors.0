From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Mar 2014 10:55:09 +0000
Subject: [patch] ALSA: lola: NULL deref on allocation error
Message-Id: <20140305105225.GA3599@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

"chip" is NULL here.  We don't need a printk here because kmalloc() has
it built in.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index d63434d8c3fb..68824cdd137d 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -586,7 +586,6 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
 
 	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
 	if (!chip) {
-		dev_err(chip->card->dev, "cannot allocate chip\n");
 		pci_disable_device(pci);
 		return -ENOMEM;
 	}
