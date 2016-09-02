From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Fri, 02 Sep 2016 14:47:51 +0000
Subject: [PATCH v2 0/2] add omitted release in qat_common
Message-Id: <20160902144753.31334-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160902144400.31216-1-lambert.quentin@gmail.com>
In-Reply-To: <20160902144400.31216-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Salvatore Benedetto <salvatore.benedetto@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Quentin Lambert <lambert.quentin@gmail.com>
Cc: kernel-janitors@vger.kernel.org

The first patch introduces a variable to handle different error codes and be
able to reuse the same clean up code. The second add an omitted release by
jumping to the clean code having set the returned value to the proper error
code.

-changes since v1
I failed to send the first version properly and it was missing a proper commit
message, just ignore it.

---
 drivers/crypto/qat/qat_common/qat_uclo.c |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)
---
