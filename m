From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 22 Jul 2016 13:32:40 +0000
Subject: [PATCH 0/2] Fix a resource release omission in error handling code
Message-Id: <20160722133242.21916-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

The first patch is a style fix, the second add calls to npe_release.
The reason for me thinking that they are necessary is that every other branches
leading to an error return are calling this function.

---
 drivers/crypto/ixp4xx_crypto.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
---
