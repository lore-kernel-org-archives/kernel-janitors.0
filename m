From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 20:52:16 +0000
Subject: [PATCH 0/4] w1: Adjustments for some function implementations
Message-Id: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Evgeniy Polyakov <zbr@ioremap.net>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Sebastian Reichel <sre@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 22:04:56 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in two functions
  masters: Delete an error message for a failed memory allocation in four functions
  masters: Improve a size determination in four functions

 drivers/w1/masters/ds2482.c    | 3 ++-
 drivers/w1/masters/ds2490.c    | 7 +++----
 drivers/w1/masters/matrox_w1.c | 7 +------
 drivers/w1/masters/mxc_w1.c    | 3 +--
 drivers/w1/masters/omap_hdq.c  | 4 +---
 drivers/w1/masters/w1-gpio.c   | 7 ++-----
 drivers/w1/slaves/w1_ds28e04.c | 2 +-
 drivers/w1/w1.c                | 9 ++-------
 drivers/w1/w1_int.c            | 6 +-----
 9 files changed, 14 insertions(+), 34 deletions(-)

-- 
2.14.0

