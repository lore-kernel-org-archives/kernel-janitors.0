From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 16:21:38 +0000
Subject: [PATCH 0/5] irqchip/irq-gic: Adjustments for three function implementations
Message-Id: <cd9daaf3-677e-9845-0d36-b6826b3457b5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Jan 2018 17:17:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation in gicv2m_init_one()
  Improve a size determination in gicv2m_init_one()
  Mark a of_device_id variable as "const"
  Delete an error message for a failed memory allocation in two functions
  Mark an array of text strings as "const"

 drivers/irqchip/irq-gic-v2m.c    |  9 +++------
 drivers/irqchip/irq-gic-v3-its.c | 10 +++-------
 2 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.15.1

