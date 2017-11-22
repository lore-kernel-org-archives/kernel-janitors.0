From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 15:46:13 +0000
Subject: [PATCH 0/3] ASoC-cs42l73: Adjustments for two function implementations
Message-Id: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 16:38:32 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in cs42l73_i2c_probe()
  Improve two size determinations in cs42l73_i2c_probe()
  Fix a typo in two comments

 sound/soc/codecs/cs42l73.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

-- 
2.15.0

