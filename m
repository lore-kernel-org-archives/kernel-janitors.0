From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 13:02:03 +0000
Subject: [PATCH 0/3] ASoC: simple-card: Fine-tuning for three function implementations
Message-Id: <8b5e37d1-17c5-4551-801f-ca7939d5efd7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 14:54:32 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use devm_kcalloc() in asoc_simple_card_parse_aux_devs()
  Use devm_kcalloc() in asoc_simple_card_probe()
  SCU: Use devm_kcalloc() in asoc_simple_card_probe()

 sound/soc/generic/simple-card.c     | 8 ++++----
 sound/soc/generic/simple-scu-card.c | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.12.2

