From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 14 Nov 2017 17:43:07 +0000
Subject: [PATCH 0/3] ALSA: ens1370: Fine-tuning for six function implementations
Message-Id: <8bcf1ada-f44c-cb83-0890-adc8ae8edda0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Colin Ian King <colin.king@canonical.com>, David Howells <dhowells@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 14 Nov 2017 18:38:28 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 15 function calls together with a variable assignment
  Use common error handling code in snd_audiopci_probe()
  Use common error handling code in snd_ensoniq_create()

 sound/pci/ens1370.c | 110 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 61 insertions(+), 49 deletions(-)

-- 
2.15.0

