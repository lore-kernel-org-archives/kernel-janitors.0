From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 21:04:06 +0000
Subject: [PATCH 0/2] ALSA: intel8x0m: Fine-tuning for five function implementations
Message-Id: <fb982b27-f9b8-959b-9bb6-17f217aa3220@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 15 Nov 2017 22:00:11 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust 12 function calls together with a variable assignment
  Use common error handling code in two functions

 sound/pci/intel8x0m.c | 100 ++++++++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 43 deletions(-)

-- 
2.15.0

