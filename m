From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 19:10:12 +0000
Subject: [PATCH 0/3] ALSA: mpu401: Adjustments for three function implementations
Message-Id: <47947226-bd09-5d15-c0d2-a9f4a659e1b4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 12 Aug 2017 21:05:21 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in snd_mpu401_uart_new()
  Use common error handling code in snd_mpu401_uart_new()
  Adjust four checks for null pointers

 sound/drivers/mpu401/mpu401_uart.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.14.0

