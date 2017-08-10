From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 13:00:27 +0000
Subject: [PATCH 0/5] ASoC: dapm: Adjustments for some function implementations
Message-Id: <e8013ddb-687d-ee56-8153-2791bb9f46fe@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 14:54:32 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete error messages for a failed memory allocation in snd_soc_dapm_new_pcm()
  Improve a size determination in two functions
  Use kcalloc() in snd_soc_dapm_new_widgets()
  Adjust one function call together with a variable assignment
  Adjust seven checks for null pointers

 sound/soc/soc-dapm.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

-- 
2.14.0

