From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Wed, 26 May 2010 06:32:27 +0000
Subject: Re: [patch] padata: add parenthesis in MAX_SEQ_NR macro
Message-Id: <20100526063227.GP2184@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525212913.GK22515@bicker>
In-Reply-To: <20100525212913.GK22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Herbert Xu <herbert@gondor.hengli.com.au>, Henrik Kretzschmar <henne@nachtwindheim.de>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 25, 2010 at 11:29:13PM +0200, Dan Carpenter wrote:
> MAX_SEQ_NR is used in padata_alloc_pd() like this:
> 
>         pd->max_seq_nr = (MAX_SEQ_NR / num_cpus) * num_cpus - 1;
> 
> It needs parenthesis or the divide by num_cpus takes precedence over the
> subtraction.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Steffen Klassert <steffen.klassert@secunet.com>

Thanks,

Steffen
