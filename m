From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 11:10:06 +0000
Subject: [PATCH 0/3] ALSA: rawmidi: Adjustments for some function implementations
Message-Id: <d4c89bda-5091-2d3c-ded1-ba2c3b061ff6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Fabian Frederick <fabf@skynet.be>, Ingo Molnar <mingo@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 12:02:12 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust seven function calls together with a variable assignment
  Use common error handling code in snd_rawmidi_new()
  Adjust 21 checks for null pointers

 sound/core/rawmidi.c | 103 +++++++++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 45 deletions(-)

-- 
2.15.0

