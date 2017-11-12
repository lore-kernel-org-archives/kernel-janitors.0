From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 12 Nov 2017 21:36:39 +0000
Subject: [PATCH 0/2] ALSA: au88x0: Fine-tuning for some function implementations
Message-Id: <e42f1434-f1d7-a43b-d887-a82b50158280@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Colin Ian King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 12 Nov 2017 22:30:44 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Adjust 40 function calls together with a variable assignment
  Use common error handling code in two functions

 sound/pci/au88x0/au88x0.c        | 112 +++++++++++++++++++--------------------
 sound/pci/au88x0/au88x0_a3d.c    |  28 +++++-----
 sound/pci/au88x0/au88x0_core.c   |  78 +++++++++++++--------------
 sound/pci/au88x0/au88x0_eq.c     |  21 +++++---
 sound/pci/au88x0/au88x0_mixer.c  |   3 +-
 sound/pci/au88x0/au88x0_mpu401.c |  14 ++---
 sound/pci/au88x0/au88x0_pcm.c    |  16 +++---
 7 files changed, 140 insertions(+), 132 deletions(-)

-- 
2.15.0

