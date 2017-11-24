From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 09:51:37 +0000
Subject: [PATCH 0/2] ASoC: wm8903: Adjustments for wm8903_i2c_probe()
Message-Id: <d4ce14fa-42a4-c911-3e0a-f2dd5cde6c14@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 10:44:55 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve two size determinations

 sound/soc/codecs/wm8903.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.15.0

