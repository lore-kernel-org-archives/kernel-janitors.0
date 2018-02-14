From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 15:23:53 +0000
Subject: [PATCH 0/2] crypto/omap: Adjustments for three function implementations
Message-Id: <28780631-d093-a581-8690-3868f8fa327e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Joel Fernandes <joelf@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 16:18:19 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete error messages for a failed memory allocation
  Improve size determinations

 drivers/crypto/omap-aes.c  | 8 +++-----
 drivers/crypto/omap-des.c  | 8 +++-----
 drivers/crypto/omap-sham.c | 4 +---
 3 files changed, 7 insertions(+), 13 deletions(-)

-- 
2.16.1

