From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 17:52:23 +0000
Subject: [PATCH 0/2] crypto-testmgr: Fine-tuning for drbg_cavs_test()
Message-Id: <7c2b4df8-a04b-cacd-13ba-4d9afb346263@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 19:47:43 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code
  Delete an unnecessary variable initialisation

 crypto/testmgr.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

-- 
2.14.2

