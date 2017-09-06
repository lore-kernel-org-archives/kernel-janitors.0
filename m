From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Sep 2017 19:45:29 +0000
Subject: [PATCH 0/3] ALSA: ymfpci: Fine-tuning for some function implementations
Message-Id: <dafe6d86-1bfd-41a8-e189-bde7ae30dea9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Sep 2017 21:37:32 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in snd_card_ymfpci_probe()
  Use common error handling code in snd_ymfpci_create()
  Adjust 17 checks for null pointers

 sound/pci/ymfpci/ymfpci.c      | 62 ++++++++++++++++++------------------
 sound/pci/ymfpci/ymfpci_main.c | 72 ++++++++++++++++++++++--------------------
 2 files changed, 67 insertions(+), 67 deletions(-)

-- 
2.14.1

