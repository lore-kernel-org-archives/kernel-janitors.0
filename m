From: Kim Phillips <kim.phillips@freescale.com>
Date: Tue, 15 Mar 2011 22:20:34 +0000
Subject: Re: [patch] crypto: caam - dereferencing ERR_PTR on allocation
Message-Id: <20110315172034.3038b124.kim.phillips@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110315065747.GO2008@bicker>
In-Reply-To: <20110315065747.GO2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 15 Mar 2011 09:57:47 +0300
Dan Carpenter <error27@gmail.com> wrote:

> t_alg is an ERR_PTR here so we can't dereference it.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Acked-by: Kim Phillips <kim.phillips@freescale.com>

Thanks,

Kim

