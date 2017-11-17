From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 09:46:10 +0000
Subject: [PATCH 0/4] ALSA-Riptide: Fine-tuning for seven function implementations
Message-Id: <0eef2699-f28a-c1e0-9351-268b5eb7e0c1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, David Howells <dhowells@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 17 Nov 2017 10:32:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Adjust 13 function calls together with a variable assignment
  Delete an unnecessary variable initialisation in snd_riptide_proc_read()
  Reduce the scope for two variables in snd_riptide_proc_read()
  Use common error handling code in snd_riptide_create()

 sound/pci/riptide/riptide.c | 78 ++++++++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 32 deletions(-)

-- 
2.15.0

