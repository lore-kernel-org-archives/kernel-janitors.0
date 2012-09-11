From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Tue, 11 Sep 2012 08:27:47 +0000
Subject: Re: [PATCH] idr: Rename MAX_LEVEL to MAX_ID_LEVEL
Message-Id: <1347352069.14488.12.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910131426.GA12431@localhost>
In-Reply-To: <20120910131426.GA12431@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Glauber Costa <glommer@parallels.com>, kernel-janitors@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>

Hi!

On Mon, 2012-09-10 at 21:14 +0800, Fengguang Wu wrote:
> To avoid name conflicts:
> 
> drivers/video/riva/fbdev.c:281:9: sparse: preprocessor token MAX_LEVEL redefined
> 
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> ---
> 
> Andrew: the conflict happens in Glauber's kmemcg-slab tree.  So it's
> better to quickly push this pre-fix to upstream before Glauber's patches.
> 
> 
>  include/linux/idr.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux.orig/include/linux/idr.h	2012-09-10 21:08:51.177452944 +0800
> +++ linux/include/linux/idr.h	2012-09-10 21:08:57.729452732 +0800
> @@ -43,10 +43,10 @@
>  #define MAX_ID_MASK (MAX_ID_BIT - 1)
>  
>  /* Leave the possibility of an incomplete final layer */
> -#define MAX_LEVEL (MAX_ID_SHIFT + IDR_BITS - 1) / IDR_BITS
> +#define MAX_ID_LEVEL (MAX_ID_SHIFT + IDR_BITS - 1) / IDR_BITS

And while you are it: Please add '(' and ')' around it as in 

#define MAX_ID_LEVEL ((MAX_ID_SHIFT + IDR_BITS - 1) / IDR_BITS)


>  /* Number of id_layer structs to leave in free list */
> -#define IDR_FREE_MAX MAX_LEVEL + MAX_LEVEL
> +#define IDR_FREE_MAX MAX_ID_LEVEL + MAX_ID_LEVEL
#define IDR_FREE_MAX (MAX_ID_LEVEL + MAX_ID_LEVEL)

For starters (sleeping in "cpp-101";-): People may use it as in
"IDR_FREE_MAX * 2".
And I didn't look into that file - that should be changed everywhere in
that way.

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

