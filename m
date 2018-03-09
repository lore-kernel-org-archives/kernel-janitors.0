From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Mar 2018 15:55:34 +0000
Subject: [PATCH v2 00/17] MFD: Adjustments for several function implementations
Message-Id: <c5d9751e-3ae8-0b66-821a-0e7f45bb8e1c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Mar 2018 10:24:42 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (17):
  abx500-core: Adjustments for eight function implementations
  si476x-i2c: Delete an error message for a failed memory allocation
    in si476x_core_probe()
  sm501: Adjustments for five function implementations
  smsc-ece1099: Improve a size determination in smsc_i2c_probe()
  ti_am335x_tscadc: Delete an error message for a failed memory allocation
    in ti_tscadc_probe()
  tps65090: Delete an error message for a failed memory allocation
    in tps65090_i2c_probe()
  tps6586x: Delete an error message for a failed memory allocation
    in tps6586x_parse_dt()
  tps65910: Adjustments for four function implementations
  tps80031: Delete an error message for a failed memory allocation
    in tps80031_probe()
  twl6030-irq: Delete an error message for a failed memory allocation
    in twl6030_init_irq()
  viperboard: Delete an error message for a failed memory allocation
    in vprbrd_probe()
---

v2:
Lee Jones requested a resend for some of these patches. Thus several changes
were rebased on source files from Linux next-20180308.

 drivers/mfd/abx500-core.c      | 25 +++++++++++--------------
 drivers/mfd/si476x-i2c.c       |  6 ++----
 drivers/mfd/sm501.c            | 30 +++++++++++++-----------------
 drivers/mfd/smsc-ece1099.c     |  3 +--
 drivers/mfd/ti_am335x_tscadc.c |  5 ++---
 drivers/mfd/tps65090.c         |  4 +---
 drivers/mfd/tps6586x.c         |  4 +---
 drivers/mfd/tps65910.c         | 18 ++++++++----------
 drivers/mfd/tps80031.c         |  4 +---
 drivers/mfd/twl6030-irq.c      |  4 +---
 drivers/mfd/viperboard.c       |  4 +---
 11 files changed, 42 insertions(+), 65 deletions(-)

-- 
2.16.2

