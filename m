From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 20:17:43 +0000
Subject: [PATCH 0/4] ALSA SoC PCM: Fine-tuning for some function implementations
Message-Id: <54203404-1e40-3c97-a6e5-75a41ec3e742@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 21:12:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Improve unlocking of a mutex in soc_dpcm_runtime_update()
  Add some blank lines for better code readability
  Add some spaces for better code readability
  Improve a size determination in dpcm_be_connect()

 sound/soc/soc-pcm.c | 60 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 24 deletions(-)

-- 
2.15.0

