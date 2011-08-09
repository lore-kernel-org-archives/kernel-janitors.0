From: Dan Magenheimer <dan.magenheimer@oracle.com>
Date: Tue, 09 Aug 2011 21:23:33 +0000
Subject: RE: [patch] Staging: zcache: signedness bug in tmem_get()
Message-Id: <c20f30dd-eef1-46d5-89df-bc5af40fd865@default>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110809180133.GB3830@shale.localdomain>
In-Reply-To: <20110809180133.GB3830@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Tuesday, August 09, 2011 12:02 PM
> To: Greg Kroah-Hartman
> Cc: Dan Magenheimer; open list:STAGING SUBSYSTEM; kernel-janitors@vger.kernel.org
> Subject: [patch] Staging: zcache: signedness bug in tmem_get()
> 
> "ret" needs to be signed for the error handling to work properly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/zcache/tmem.c b/drivers/staging/zcache/tmem.c
> index 975e34b..1ca66ea 100644
> --- a/drivers/staging/zcache/tmem.c
> +++ b/drivers/staging/zcache/tmem.c
> @@ -604,7 +604,7 @@ int tmem_get(struct tmem_pool *pool, struct tmem_oid *oidp, uint32_t index,
>  	struct tmem_obj *obj;
>  	void *pampd;
>  	bool ephemeral = is_ephemeral(pool);
> -	uint32_t ret = -1;
> +	int ret = -1;
>  	struct tmem_hashbucket *hb;
>  	bool free = (get_and_free = 1) || ((get_and_free = 0) && ephemeral);
>  	bool lock_held = false;

Acked-by: Dan Magenheimer <dan.magenheimer@oracle.com>

I discovered this bug also a couple of weeks ago debugging RAMster but
have convinced myself that, in zcache, the problem would never manifest
so didn't post the fix.  Still best to have it fixed though as it was a
huge pain to track down in RAMster... thanks for posting the fix Dan.
