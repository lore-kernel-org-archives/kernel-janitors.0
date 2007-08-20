From: Christoph Lameter <clameter@sgi.com>
Date: Mon, 20 Aug 2007 18:06:48 +0000
Subject: Re: [PATCH 5/5] mm/... convert #include "linux/..." to #include
Message-Id: <Pine.LNX.4.64.0708201106230.25248@schroedinger.engr.sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561983.4200.145.camel@localhost>
In-Reply-To: <1187561983.4200.145.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <dada1@cosmosbay.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-mm@kvack.org

On Sun, 19 Aug 2007, Joe Perches wrote:

> diff --git a/mm/slab.c b/mm/slab.c
> index a684778..976aeff 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -334,7 +334,7 @@ static __always_inline int index_of(const size_t size)
>  		return i; \
>  	else \
>  		i++;
> -#include "linux/kmalloc_sizes.h"
> +#include <linux/kmalloc_sizes.h>
>  #undef CACHE
>  		__bad_size();
>  	} else

But I think this was done intentionally to point out that the file 
includes is *not* a regular include file.

