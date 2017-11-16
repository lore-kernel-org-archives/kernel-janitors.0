From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 15:32:17 +0000
Subject: [PATCH 0/2] ALSA-miXart: Fine-tuning for seven function implementations
Message-Id: <6f8ce522-66ac-9740-41fb-2df6ab6f3aec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 16:27:32 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust 23 function calls together with a variable assignment
  Use common error handling code in snd_mixart_probe()

 sound/pci/mixart/mixart.c       | 88 ++++++++++++++++++++++-------------------
 sound/pci/mixart/mixart_hwdep.c | 17 +++++---
 sound/pci/mixart/mixart_mixer.c | 44 +++++++++++++++------
 3 files changed, 93 insertions(+), 56 deletions(-)

-- 
2.15.0

