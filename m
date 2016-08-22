From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 Aug 2016 08:34:19 +0000
Subject: [PATCH v2 0/2] ALSA: compress: Fine-tuning for snd_compr_set_params()
Message-Id: <14b1efe1-3c1c-4c36-bfc2-19947c190412@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <7233eb00-a941-4935-dce2-7cb907272d41@users.sourceforge.net>
 <03eac1fe-ff33-1759-9c2a-7914f1c6de45@users.sourceforge.net>
 <1471809094.3746.17.camel@perches.com>
In-Reply-To: <1471809094.3746.17.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Joe Perches <joe@perches.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 Aug 2016 10:27:01 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Restructure source code around an if statement
  Use memdup_user()

 sound/core/compress_offload.c | 58 +++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 32 deletions(-)

-- 
2.9.3

