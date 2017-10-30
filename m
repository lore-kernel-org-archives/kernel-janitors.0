From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 15:45:31 +0000
Subject: [PATCH 0/3] pinctrl-mcp23s08: Fine-tuning for two function implementations
Message-Id: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 16:40:20 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Improve unlocking of a mutex in mcp23s08_irq()
  Use common error handling code in mcp23s08_dbg_show()
  Combine two function calls in mcp23s08_dbg_show()

 drivers/pinctrl/pinctrl-mcp23s08.c | 80 ++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 43 deletions(-)

-- 
2.14.3

