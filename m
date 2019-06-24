From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Jun 2019 14:51:06 +0000
Subject: Re: [PATCH] crypto: qat - Endian bug in interrupt handler
Message-Id: <20190624145105.GX28859@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624134839.GB1754@mwanda>
In-Reply-To: <20190624134839.GB1754@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Tadeusz Struk <tadeusz.struk@intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org


Never mind.  Please ignore this patch.

This is Intel hardware so it's little endian.  There are a bunch of
other test_bit() casts which would be problematic so this wouldn't
really fix anything anyway.

regards,
dan carpenter
