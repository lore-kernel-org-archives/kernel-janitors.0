From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 13:05:12 +0000
Subject: [PATCH 0/2] Pinctrl-single: Adjustments for two function implementations
Message-Id: <6bc679d1-c1ee-52fe-9ece-b28095f653ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Dec 2017 14:01:23 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in pcs_probe()
  Delete an unnecessary return statement in pcs_irq_chain_handler()

 drivers/pinctrl/pinctrl-single.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.15.1

