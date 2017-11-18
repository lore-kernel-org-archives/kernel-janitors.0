From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 20:38:52 +0000
Subject: [PATCH 0/2] ALSA-Digigram VX222: Fine-tuning for four function implementations
Message-Id: <e961ecef-9f03-0c2a-ad64-64102bbc1389@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Nov 2017 21:27:50 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust ten function calls together with a variable assignment
  Use common error handling code in two functions

 sound/pci/vx222/vx222.c     | 53 +++++++++++++++++++++++++--------------------
 sound/pci/vx222/vx222_ops.c | 19 +++++++++-------
 2 files changed, 41 insertions(+), 31 deletions(-)

-- 
2.15.0

