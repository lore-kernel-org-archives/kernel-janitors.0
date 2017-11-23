From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 20:03:28 +0000
Subject: [PATCH 0/3] ASoC: da7218: Adjustments for two function implementations
Message-Id: <07c631e4-e2df-7ae2-ea31-9430c89dc8e3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, support.opensource@diasemi.com, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 21:00:12 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete two error messages for a failed memory allocation
    in da7218_of_to_pdata()
  Use common error handling code in da7218_of_to_pdata()
  Improve a size determination in da7218_i2c_probe()

 sound/soc/codecs/da7218.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

-- 
2.15.0

