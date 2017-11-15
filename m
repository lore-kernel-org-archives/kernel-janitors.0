From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 12:45:09 +0000
Subject: [PATCH 0/3] ALSA: fm801: Fine-tuning for seven function implementations
Message-Id: <86b94d9c-77fb-fed5-b55c-a0565f619dc7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 13:40:43 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 17 function calls together with a variable assignment
  Use common error handling code in two functions
  Rename a jump label in snd_card_fm801_probe()

 sound/pci/fm801.c | 140 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 76 insertions(+), 64 deletions(-)

-- 
2.15.0

