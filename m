From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Dec 2014 13:06:46 +0000
Subject: [patch] ALSA: lola: NULL dereference on probe failure
Message-Id: <20141210130646.GA18593@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Taine <benoit.taine@lip6.fr>, Bjorn Helgaas <bhelgaas@google.com>

"card" is NULL if snd_card_new() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index a75c8dc..4cf4be5 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -719,7 +719,7 @@ static int lola_probe(struct pci_dev *pci,
 	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
 			   0, &card);
 	if (err < 0) {
-		dev_err(card->dev, "Error creating card!\n");
+		dev_err(&pci->dev, "Error creating card!\n");
 		return err;
 	}
 
