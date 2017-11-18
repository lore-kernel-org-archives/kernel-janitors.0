From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 15:30:16 +0000
Subject: [PATCH 0/3] ALSA-S3 SonicVibes: Fine-tuning for five function implementations
Message-Id: <663ac54c-baf9-ac11-50fd-d8b407d1eacf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, David Howells <dhowells@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 16:25:43 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 15 function calls together with a variable assignment
  Use common error handling code in snd_sonic_probe()
  Use common error handling code in snd_sonicvibes_create()

 sound/pci/sonicvibes.c | 144 +++++++++++++++++++++++++++----------------------
 1 file changed, 79 insertions(+), 65 deletions(-)

-- 
2.15.0

