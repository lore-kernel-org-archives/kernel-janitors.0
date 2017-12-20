From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 09:50:13 +0000
Subject: [PATCH 0/2] pinctrl/nomadik/abx500: Adjustments for abx500_gpio_probe()
Message-Id: <e5be1da7-460d-a47d-59b8-c1902907f5a4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 10:45:01 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/pinctrl/nomadik/pinctrl-abx500.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.15.1

