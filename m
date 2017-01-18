From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 13:45:07 +0000
Subject: [PATCH 0/3] AVR32: Fine-tuning for two function implementations
Message-Id: <308dc151-c874-dfe7-64f9-24a63fc66883@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 14:40:04 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Return directly after a failed access_ok() in setup_rt_frame()
  Delete an unnecessary variable initialisation in setup_rt_frame()
  Return an error code only as a constant in sys_cacheflush()

 arch/avr32/kernel/signal.c |  5 ++---
 arch/avr32/mm/cache.c      | 21 +++++----------------
 2 files changed, 7 insertions(+), 19 deletions(-)

-- 
2.11.0

