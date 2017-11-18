From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 12:51:24 +0000
Subject: [PATCH 0/2] ALSA-RME Digi96: Fine-tuning for four function implementations
Message-Id: <7b7da9a6-64e1-bde5-99aa-de21f0665323@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 13:45:43 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust 11 function calls together with a variable assignment
  Improve unlocking of an IRQ in snd_rme96_capture_hw_params()

 sound/pci/rme96.c | 91 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 51 insertions(+), 40 deletions(-)

-- 
2.15.0

