From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 21:24:46 +0000
Subject: [PATCH 0/2] ALSA: pcxhr: Fine-tuning for three function implementations
Message-Id: <c110ba76-d99d-9f80-d927-14d437115004@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 22:20:02 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust six function calls together with a variable assignment
  Use common error handling code in pcxhr_probe()

 sound/pci/pcxhr/pcxhr.c | 82 ++++++++++++++++++++++++++-----------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

-- 
2.15.0

