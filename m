From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 11:10:04 +0000
Subject: [PATCH 0/5] ISDN-CAPI: Fine-tuning for several function implementations
Message-Id: <be07f84d-fc84-e47d-207e-aedd8c960151@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Sep 2016 13:03:13 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in capidrv_addcontr()
  Delete error messages for a failed memory allocation in four functions
  Adjust 17 function calls together with variable assignments
  Adjust checks for null pointers in four functions
  Delete unnecessary braces

 drivers/isdn/capi/capidrv.c | 111 +++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 57 deletions(-)

-- 
2.10.0

