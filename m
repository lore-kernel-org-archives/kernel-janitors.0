From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 06:23:44 +0000
Subject: [PATCH 0/3] ATM-iphase: Adjustments for some function implementations
Message-Id: <c30df8dd-a6e9-23c1-842b-afa8696e10d4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Chas Williams <3chas3@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 08:18:28 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Adjust 11 function calls together with a variable assignment
  Delete five error messages for a failed memory allocation
  Adjust four checks for null pointers

 drivers/atm/iphase.c | 95 +++++++++++++++++++++++++++-------------------------
 1 file changed, 49 insertions(+), 46 deletions(-)

-- 
2.13.4

