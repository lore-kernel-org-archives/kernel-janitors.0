From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 13 Apr 2017 12:13:56 +0000
Subject: [PATCH 0/2] Fix/improve some error handling related to 'chcr_alloc_shash'
Message-Id: <cover.1492085165.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, harsh@chelsio.com, hariprasad@chelsio.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This serie is divided into 2 patches. They are more or less related to the
same issue, but the first patch is not a bug in itself, just a clean-up
(IMHO).
If I'm correct, the 2nd one, is a real (unlikely) issue.

Christophe JAILLET (2):
  crypto: chcr - Improve error checking
  crypto: chcr - Fix error checking

 drivers/crypto/chelsio/chcr_algo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.11.0

