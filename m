From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Dec 2015 18:19:45 +0000
Subject: [PATCH 0/2] block: Fine-tuning for two function implementations
Message-Id: <566B13C1.50907@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Dec 2015 19:12:34 +0100

A few update suggestions were taken into account from static
source code analysis.

Markus Elfring (2):
  zram: Less checks in zram_bvec_write() after error detection
  z2ram: Delete a jump label in z2_init()

 drivers/block/z2ram.c         |  4 +---
 drivers/block/zram/zram_drv.c | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 16 deletions(-)

-- 
2.6.3

