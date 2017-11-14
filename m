From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 14 Nov 2017 20:34:47 +0000
Subject: [PATCH 0/3] ALSA: es1938: Fine-tuning for seven function implementations
Message-Id: <afd9d456-ae8e-b2f6-a682-a27c1fa4209b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 14 Nov 2017 21:30:12 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 14 function calls together with a variable assignment
  Use common error handling code in snd_es1938_probe()
  Use common error handling code in snd_es1938_create()

 sound/pci/es1938.c | 117 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 67 insertions(+), 50 deletions(-)

-- 
2.15.0

