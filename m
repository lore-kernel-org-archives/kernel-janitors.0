From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Sep 2017 20:34:46 +0000
Subject: [PATCH 0/2] ALSA: rme9652: Adjustments for two function implementations
Message-Id: <9832906e-3b04-b708-2c26-4755e0beb811@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Sep 2017 22:30:22 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common code in hdsp_get_iobox_version()
  Use common error handling code in snd_hdspm_probe()

 sound/pci/rme9652/hdsp.c  | 26 +++++++++++---------------
 sound/pci/rme9652/hdspm.c | 16 ++++++++--------
 2 files changed, 19 insertions(+), 23 deletions(-)

-- 
2.14.1

