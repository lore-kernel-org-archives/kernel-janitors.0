From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 17:12:52 +0000
Subject: [PATCH 0/3] crypto-ansi_cprng: Fine-tuning for three function implementations
Message-Id: <d284473a-b968-2b3e-9147-1c8598a26f7c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Neil Horman <nhorman@tuxdriver.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Oct 2017 19:06:54 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in get_prng_bytes()
  Delete two variable assignments in get_prng_bytes()
  Delete unnecessary blank lines

 crypto/ansi_cprng.c | 47 ++++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

-- 
2.14.2

