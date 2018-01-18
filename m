From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 21:13:37 +0000
Subject: [PATCH 0/3] irq-imx-gpcv2: Adjustments for imx_gpcv2_irqchip_init()
Message-Id: <e9033837-9e04-be5b-2875-aa746840d5a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Shenwei Wang <shenwei.wang@freescale.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 22:08:44 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Use common error handling code

 drivers/irqchip/irq-imx-gpcv2.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.15.1

