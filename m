From: Ross Zwisler <ross.zwisler@linux.intel.com>
Date: Fri, 15 Jul 2016 21:42:13 +0000
Subject: Re: [patch] testing/radix-tree: fix a macro expansion bug
Message-Id: <20160715214213.GA3883@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715210953.GC19522@mwanda>
In-Reply-To: <20160715210953.GC19522@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Wilcox <willy@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Konstantin Khlebnikov <koct9i@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 16, 2016 at 12:09:53AM +0300, Dan Carpenter wrote:
> There are no parentheses around this macro and it causes a problem when
> we do:
> 
> 	index = rand() % THRASH_SIZE;
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Ross Zwisler <ross.zwisler@linux.intel.com>

> 
> diff --git a/tools/testing/radix-tree/tag_check.c b/tools/testing/radix-tree/tag_check.c
> index b7447ce..b0ac057 100644
> --- a/tools/testing/radix-tree/tag_check.c
> +++ b/tools/testing/radix-tree/tag_check.c
> @@ -122,7 +122,7 @@ enum {
>  	NODE_TAGGED = 2,
>  };
>  
> -#define THRASH_SIZE		1000 * 1000
> +#define THRASH_SIZE		(1000 * 1000)
>  #define N 127
>  #define BATCH	33
>  
