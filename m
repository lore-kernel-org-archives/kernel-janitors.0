From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 18:10:56 +0000
Subject: [PATCH 0/3] ALSA: hal2: Fine-tuning for four function implementations
Message-Id: <118a96d5-c52a-fd22-23d5-28f20de7ff22@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 11 Nov 2017 19:06:54 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in hal2_probe()
  Improve a size determination in hal2_create()
  Fix a typo in two comment lines

 sound/mips/hal2.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

-- 
2.15.0

