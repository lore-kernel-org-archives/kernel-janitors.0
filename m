From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Sep 2016 14:36:35 +0000
Subject: crypto-caamhash: Fine-tuning for several function implementations
Message-Id: <970e9e1b-c1dc-eb28-b380-92c15e9b1961@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Labbe Corentin <clabbe.montjoie@gmail.com>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Sep 2016 16:27:23 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Use kmalloc_array() in ahash_setkey()
  Rename jump labels in ahash_setkey()
  Rename a jump label in five functions
  Return a value directly in caam_hash_cra_init()
  Delete an unnecessary initialisation in seven functions
  Move common error handling code in two functions

 drivers/crypto/caam/caamhash.c | 111 +++++++++++++++++++----------------------
 1 file changed, 52 insertions(+), 59 deletions(-)

-- 
2.10.0

