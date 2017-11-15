From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 09:26:28 +0000
Subject: [PATCH 0/3] ALSA: es1968: Fine-tuning for seven function implementations
Message-Id: <e1e9e0cc-0378-c2fe-015d-15555fd61a23@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 10:23:45 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 16 function calls together with a variable assignment
  Use common error handling code in two functions
  Use common error handling code in snd_es1968_capture_open()

 sound/pci/es1968.c | 163 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 92 insertions(+), 71 deletions(-)

-- 
2.15.0

