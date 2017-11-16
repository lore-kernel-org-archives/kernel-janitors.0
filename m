From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 17:05:27 +0000
Subject: [PATCH 0/2] ALSA: nm256: Fine-tuning for three function implementations
Message-Id: <d98a2685-ddf9-1cba-839a-d12c5ff8d3ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 18:00:18 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust five function calls together with a variable assignment
  Use common error handling code in snd_nm256_probe()

 sound/pci/nm256/nm256.c | 48 +++++++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 19 deletions(-)

-- 
2.15.0

