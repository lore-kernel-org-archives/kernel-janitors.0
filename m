From: Kim Phillips <kim.phillips@freescale.com>
Date: Tue, 15 Mar 2011 22:20:37 +0000
Subject: Re: [patch] crypto: caam - ARRAY_SIZE() vs sizeof()
Message-Id: <20110315172037.f212db80.kim.phillips@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110315065955.GP2008@bicker>
In-Reply-To: <20110315065955.GP2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 15 Mar 2011 09:59:55 +0300
Dan Carpenter <error27@gmail.com> wrote:

> ARRAY_SIZE() was intended here instead of sizeof().  sizeof() is four
> times larger than ARRAY_SIZE().  outstr is normally 256 chars so 
> printing garbage to it could overfill the buffer and corrupt memory.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Kim Phillips <kim.phillips@freescale.com>

Thanks Dan,

Kim

