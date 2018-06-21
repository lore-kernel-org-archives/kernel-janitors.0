From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Jun 2018 08:07:21 +0000
Subject: [PATCH] ALSA: lx6464es: Missing error code in snd_lx6464es_create()
Message-Id: <20180620204256.wvesr47qgikwhfgq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Zhouyang Jia <jiazhouyang09@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Bhumika Goyal <bhumirks@gmail.com>

We forgot to set the error code on this error path.

Fixes: 4a23fc8cc068 ("ALSA: lx6464es: add error handling for pci_ioremap_bar")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 6c85f13ab23f..54f6252faca6 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -1018,6 +1018,7 @@ static int snd_lx6464es_create(struct snd_card *card,
 	chip->port_dsp_bar = pci_ioremap_bar(pci, 2);
 	if (!chip->port_dsp_bar) {
 		dev_err(card->dev, "cannot remap PCI memory region\n");
+		err = -ENOMEM;
 		goto remap_pci_failed;
 	}
 
