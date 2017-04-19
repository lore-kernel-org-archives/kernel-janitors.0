From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 09:08:21 +0000
Subject: [PATCH 0/2] n2rng: Fine-tuning for n2rng_probe()
Message-Id: <4d9fbb01-e12f-eb5c-7ecd-5a2a10fd5110@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Matt Mackall <mpm@selenic.com>, Shannon Nelson <shannon.nelson@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Apr 2017 11:00:11 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use devm_kcalloc()
  Combine substrings for two messages

 drivers/char/hw_random/n2-drv.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.12.2

