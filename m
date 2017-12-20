From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 12:00:43 +0000
Subject: [PATCH 0/2] Pinctrl-ADI GPIO2: Adjustments for two function implementations
Message-Id: <3d620bed-db19-aacd-0ea5-4c64aee104d1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sonic Zhang <sonic.zhang@analog.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 12:52:42 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in two functions

 drivers/pinctrl/pinctrl-adi2.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

-- 
2.15.1

