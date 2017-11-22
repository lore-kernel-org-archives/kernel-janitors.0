From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 21:20:03 +0000
Subject: [PATCH 0/2] ASoC: cs42l52: Adjustments for cs42l52_i2c_probe()
Message-Id: <c1e180fd-3c93-a724-09be-e12974ffdb9f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 22:15:43 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve two size determinations

 sound/soc/codecs/cs42l52.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.15.0

