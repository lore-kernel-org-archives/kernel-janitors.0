From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:33:57 +0000
Subject: [patch] ALSA: cmipci: remove a stray space character
Message-Id: <20150225133357.GS19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Benoit Taine <benoit.taine@lip6.fr>, Bjorn Helgaas <bhelgaas@google.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 1d0f2ca..6cf464d 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2062,7 +2062,7 @@ static int snd_cmipci_get_volume(struct snd_kcontrol *kcontrol,
 		val = (snd_cmipci_mixer_read(cm, reg.right_reg) >> reg.right_shift) & reg.mask;
 		if (reg.invert)
 			val = reg.mask - val;
-		 ucontrol->value.integer.value[1] = val;
+		ucontrol->value.integer.value[1] = val;
 	}
 	spin_unlock_irq(&cm->reg_lock);
 	return 0;
