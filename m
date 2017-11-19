From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 12:42:13 +0000
Subject: [PATCH 0/2] ASoC-Rockchip: Fine-tuning for rk_aif1_hw_params()
Message-Id: <255fa488-a5f1-2ea3-dd48-b10ad8b2c18c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 13:34:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code
  Delete two unnecessary variable initialisations

 sound/soc/rockchip/rockchip_max98090.c | 13 +++++--------
 sound/soc/rockchip/rockchip_rt5645.c   | 13 +++++--------
 2 files changed, 10 insertions(+), 16 deletions(-)

-- 
2.15.0

