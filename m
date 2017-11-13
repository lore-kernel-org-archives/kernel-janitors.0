From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Nov 2017 12:50:43 +0000
Subject: [PATCH 0/3] ALSA: cs4281: Fine-tuning for five function implementations
Message-Id: <ac9d010b-7a26-1f2d-5034-15abe603c6fd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Fabian Frederick <fabf@skynet.be>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Nov 2017 13:46:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 18 function calls together with a variable assignment
  Use common error handling code in snd_cs4281_probe()
  Use common error handling code in snd_cs4281_create()

 sound/pci/cs4281.c | 136 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 77 insertions(+), 59 deletions(-)

-- 
2.15.0

