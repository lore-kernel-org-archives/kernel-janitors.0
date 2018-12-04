From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 04 Dec 2018 08:02:56 +0000
Subject: Re: [PATCH] ubifs: fix a memory leak in ubifs_lpt_calc_hash()
Message-Id: <20181204080256.4rvvgbzdupp7kr3t@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203144743.5p6ve64mw32y67oy@kili.mountain>
In-Reply-To: <20181203144743.5p6ve64mw32y67oy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Dec 03, 2018 at 05:47:43PM +0300, Dan Carpenter wrote:
> We need to free a couple memory allocations before returning on this
> error path.

Indeed, good catch.

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> Fixes: a1dc58140f7e ("ubifs: authentication: Authenticate LPT")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/ubifs/lpt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
> index d1d5e96350dd..c162459a1e02 100644
> --- a/fs/ubifs/lpt.c
> +++ b/fs/ubifs/lpt.c
> @@ -1688,7 +1688,7 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
>  	if (!c->nroot) {
>  		err = ubifs_read_nnode(c, NULL, 0);
>  		if (err)
> -			return err;
> +			goto out;
>  	}
>  
>  	cnode = (struct ubifs_cnode *)c->nroot;
> -- 
> 2.11.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
