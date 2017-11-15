From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 19:48:10 +0000
Subject: [PATCH 0/2] ALSA: intel8x0: Fine-tuning for seven function implementations
Message-Id: <981b2716-2828-6478-46b3-5f8f3c36db46@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Laura Abbott <labbott@redhat.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 20:40:30 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust 15 function calls together with a variable assignment
  Use common error handling code in two functions

 sound/pci/intel8x0.c | 111 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 46 deletions(-)

-- 
2.15.0

