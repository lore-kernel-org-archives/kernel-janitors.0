From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 13:16:02 +0000
Subject: [PATCH 0/3] ALSA: ml403-ac97cr: Fine-tuning for five function implementations
Message-Id: <4c38a970-2407-3559-060d-501b8259b3fc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 14:13:12 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in two functions
  Delete an unnecessary return statement in snd_ml403_ac97cr_codec_write()
  Adjust four checks for null pointers

 sound/drivers/ml403-ac97cr.c | 61 ++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

-- 
2.15.0

