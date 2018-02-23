From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Feb 2018 08:23:00 +0000
Subject: Re: [2/2] crypto: bcm: One function call less in do_shash() after error detection
Message-Id: <46bd73e1-73ae-24b2-49d6-623328c14e76@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <68946b12-83d6-ab74-fd54-71b23cf9b7ef@users.sourceforge.net>
 <55bdcf76-f1c9-180d-6798-959e617b10ac@users.sourceforge.net>
 <20180222134231.GC28447@gondor.apana.org.au>
In-Reply-To: <20180222134231.GC28447@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org
Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, Rob Rice <rob.rice@broadcom.com>, Steve Lin <steven.lin1@broadcom.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> This patch is pointless as kfree on NULL is a no-op.

I prefer to avoid unnecessary function calls generally.

Regards,
Markus
