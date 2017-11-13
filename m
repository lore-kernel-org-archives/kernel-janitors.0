From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Nov 2017 18:21:21 +0000
Subject: [PATCH 0/4] ALSA: cs46xx: Adjustments for some function implementations
Message-Id: <893b1dc2-d078-9ea6-4ad2-0e0327affddd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Bhumika Goyal <bhumirks@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, Fabian Frederick <fabf@skynet.be>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Nov 2017 19:14:56 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Adjust 33 function calls together with a variable assignment
  Use common error handling code in two functions
  Improve a size determination in cs46xx_dsp_proc_register_scb_desc()
  Adjust 35 checks for null pointers

 sound/pci/cs46xx/cs46xx.c           |  75 ++++++++++----------
 sound/pci/cs46xx/cs46xx_lib.c       | 134 +++++++++++++++++++++---------------
 sound/pci/cs46xx/dsp_spos.c         |  60 +++++++++-------
 sound/pci/cs46xx/dsp_spos_scb_lib.c |  36 +++++-----
 4 files changed, 166 insertions(+), 139 deletions(-)

-- 
2.15.0

