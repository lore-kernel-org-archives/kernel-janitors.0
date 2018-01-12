From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:00:40 +0000
Subject: [PATCH 0/4] gpio-stmpe: Adjustments for two function implementations
Message-Id: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:58:42 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use seq_putc() in stmpe_dbg_show()
  Improve a size determination in stmpe_gpio_probe()
  Move an assignment in stmpe_gpio_probe()
  Delete an unnecessary variable initialisation in stmpe_gpio_probe()

 drivers/gpio/gpio-stmpe.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.15.1

