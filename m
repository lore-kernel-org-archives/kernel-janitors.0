From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 11:50:29 +0000
Subject: [PATCH 0/3] ALSA: korg1212: Fine-tuning for three function implementations
Message-Id: <3f68211d-51f0-2990-d711-44eaeb85ba4d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Kees Cook <keescook@chromium.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Nov 2017 12:42:42 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust eight function calls together with a variable assignment
  Delete a duplicate function call "release_firmware" in snd_korg1212_create()
  Use common error handling code in two functions

 sound/pci/korg1212/korg1212.c | 85 ++++++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 38 deletions(-)

-- 
2.15.0

