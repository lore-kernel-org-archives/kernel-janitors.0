From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 21:14:41 +0000
Subject: [PATCH 0/3] ALSA-RME Digi32: Fine-tuning for seven function implementations
Message-Id: <67820e63-aed9-c775-8417-b0f531a9b305@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 22:08:44 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 15 function calls together with a variable assignment
  Use common error handling code in snd_rme32_probe()
  Improve unlocking of an IRQ in two functions

 sound/pci/rme32.c | 127 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 74 insertions(+), 53 deletions(-)

-- 
2.15.0

