From: Kim Phillips <kim.phillips@freescale.com>
Date: Thu, 12 Jun 2014 23:18:12 +0000
Subject: Re: [patch] crypto: caam - remove duplicate FIFOST_CONT_MASK define
Message-Id: <20140612181812.cbc7c9b0adfe42d74ea2f636@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609151941.GN9600@mwanda>
In-Reply-To: <20140609151941.GN9600@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Porosanu <alexandru.porosanu@freescale.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 9 Jun 2014 18:19:41 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The FIFOST_CONT_MASK define is cut and pasted twice so we can delete the
> second instance.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Kim Phillips <kim.phillips@freescale.com>

Thanks,

Kim
