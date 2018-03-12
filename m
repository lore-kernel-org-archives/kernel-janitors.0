From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Mar 2018 13:30:28 +0000
Subject: [PATCH 0/2] crypto/talitos: Adjustments for talitos_edesc_alloc()
Message-Id: <ad256dc9-a064-37f9-fb8e-aea22ba40a2b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, Christophe Leroy <christophe.leroy@c-s.fr>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Mar 2018 14:24:34 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code
  Delete an error message for a failed memory allocation

 drivers/crypto/talitos.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

-- 
2.16.2

