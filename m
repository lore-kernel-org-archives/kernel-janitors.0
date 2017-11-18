From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 19:10:06 +0000
Subject: [PATCH 0/3] ALSA-Trident 4DWave: Fine-tuning for nine function implementations
Message-Id: <498d6d73-2c62-178a-3c7a-b0fcb092d81e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 19:50:12 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 34 function calls together with a variable assignment
  Use common error handling code in two functions
  Use common error handling code in snd_trident_mixer()

 sound/pci/trident/trident.c      |  68 ++++++------
 sound/pci/trident/trident_main.c | 221 ++++++++++++++++++++++-----------------
 2 files changed, 163 insertions(+), 126 deletions(-)

-- 
2.15.0

