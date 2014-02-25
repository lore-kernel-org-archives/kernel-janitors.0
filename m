From: Kim Phillips <kim.phillips@freescale.com>
Date: Tue, 25 Feb 2014 00:41:42 +0000
Subject: Re: [patch] crypto: caam - writel() arguments are swapped
Message-Id: <20140224184142.b8d3a2cfb35dfe5f31d332ee@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140221085131.GB13078@elgon.mountain>
In-Reply-To: <20140221085131.GB13078@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Alex Porosanu <alexandru.porosanu@freescale.com>, Ruchika Gupta <ruchika.gupta@freescale.com>, Vakul Garg <vakul@freescale.com>, linux-crypto@vger.kernel.org, Steve Cornelius <sec@pobox.com>, kernel-janitors@vger.kernel.org

On Fri, 21 Feb 2014 11:51:31 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> My guess is that this little endian configuration is never found in real
> life, 

it is, but the code has not been upstreamed.  Steve?

> but if it were then the writel() arguments are in the wrong order
> so the driver would crash immediately.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Meanwhile:

Acked-by: Kim Phillips <kim.phillips@freescale.com>

Kim

