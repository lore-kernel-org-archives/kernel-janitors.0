From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Sep 2017 13:15:13 +0000
Subject: [PATCH 0/2] ALSA: usx2y: Fine-tuning for two function implementations
Message-Id: <6743b977-4293-42d2-6c1b-cb83b687bd66@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Andrew Morton <akpm@linux-foundation.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dave Jiang <dave.jiang@intel.com>, Jaroslav Kysela <perex@perex.cz>, Johan Hovold <johan@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Sep 2017 15:10:12 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code in us122l_create_card()
  Use common error handling code in submit_urbs()

 sound/usb/usx2y/us122l.c     | 10 ++++++----
 sound/usb/usx2y/usb_stream.c | 18 ++++++++++--------
 2 files changed, 16 insertions(+), 12 deletions(-)

-- 
2.14.1

