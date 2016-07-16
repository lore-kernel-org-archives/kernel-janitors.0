From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Date: Sat, 16 Jul 2016 03:34:19 +0000
Subject: Re: [patch] tools/vm/slabinfo: fix an unintentional printf
Message-Id: <20160716033419.GA493@swordfish>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715211243.GE19522@mwanda>
In-Reply-To: <20160715211243.GE19522@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@linux.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Colin Ian King <colin.king@canonical.com>, Laura Abbott <labbott@fedoraproject.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On (07/16/16 00:12), Dan Carpenter wrote:
> The curly braces are missing here so we print stuff unintentionally.
> 
> Fixes: 9da4714a2d4f ('slub: slabinfo update for cmpxchg handling')

Hello,

a minor correction:
it's 	9da4714a2d44

not 	9da4714a2d4f

	-ss


> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/tools/vm/slabinfo.c b/tools/vm/slabinfo.c
> index 7cf6e17..b9d34b3 100644
> --- a/tools/vm/slabinfo.c
> +++ b/tools/vm/slabinfo.c
> @@ -510,10 +510,11 @@ static void slab_stats(struct slabinfo *s)
>  			s->alloc_node_mismatch, (s->alloc_node_mismatch * 100) / total);
>  	}
>  
> -	if (s->cmpxchg_double_fail || s->cmpxchg_double_cpu_fail)
> +	if (s->cmpxchg_double_fail || s->cmpxchg_double_cpu_fail) {
>  		printf("\nCmpxchg_double Looping\n------------------------\n");
>  		printf("Locked Cmpxchg Double redos   %lu\nUnlocked Cmpxchg Double redos %lu\n",
>  			s->cmpxchg_double_fail, s->cmpxchg_double_cpu_fail);
> +	}
>  }
>  
>  static void report(struct slabinfo *s)
> 
