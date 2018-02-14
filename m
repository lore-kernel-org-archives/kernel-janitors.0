From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 18:30:14 +0000
Subject: [PATCH 0/2] crypto/caam: Adjustments for eight function implementations
Message-Id: <9a9a602d-93da-457d-c37d-2acbb4b7b5d5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, Aymen Sghaier <aymen.sghaier@nxp.com>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 14 Feb 2018 19:23:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in seven functions
  Use common error handling code in four functions

 drivers/crypto/caam/caamalg.c  | 38 +++++++++++++++++---------------------
 drivers/crypto/caam/caamhash.c | 35 +++++++++++++----------------------
 drivers/crypto/caam/key_gen.c  |  4 +---
 3 files changed, 31 insertions(+), 46 deletions(-)

-- 
2.16.1

