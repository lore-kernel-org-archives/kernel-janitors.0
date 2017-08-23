From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Aug 2017 08:21:39 +0000
Subject: [PATCH 0/6] ALSA: core: Fine-tuning for some function implementations
Message-Id: <800d7aa6-d8f2-cbf5-caaa-7e4006976e68@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8c9e41b-a47e-1d99-3d1a-5d39772e4b54@users.sourceforge.net>
 <s5h378isw2d.wl-tiwai@suse.de>
In-Reply-To: <s5h378isw2d.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Vegard Nossum <vegard.nossum@oracle.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Aug 2017 10:05:43 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  pcm: Use common error handling code in _snd_pcm_new()
  pcm: Adjust nine function calls together with a variable assignment
  pcm: Adjust 11 checks for null pointers
  timer: Use common error handling code in alsa_timer_init()
  timer: Adjust a condition check in snd_timer_resolution()
  timer: Adjust 13 checks for null pointers

 sound/core/pcm.c   | 90 +++++++++++++++++++++++++++++++-----------------------
 sound/core/timer.c | 39 ++++++++++++-----------
 2 files changed, 73 insertions(+), 56 deletions(-)

-- 
2.14.0

