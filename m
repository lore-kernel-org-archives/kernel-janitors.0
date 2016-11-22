From: Martin Brandenburg <martin@omnibond.com>
Date: Tue, 22 Nov 2016 15:49:23 +0000
Subject: Re: [PATCH] orangefs: Axe some dead code
Message-Id: <alpine.BSO.2.20.1611221048250.48648@x220.mkb.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161121221702.6438-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161121221702.6438-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: hubcap@omnibond.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 21 Nov 2016, Christophe JAILLET wrote:

> The "perf_counter_reset" case has already been handled above.
> Moreover "ORANGEFS_PARAM_REQUEST_OP_READAHEAD_COUNT_SIZE" is not a really
> consistent.
> It is likely that this (dead) code is a cut and paste left over.

That's exactly what this is.

Reviewed-by: Martin Brandenburg <martin@omnibond.com>

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  fs/orangefs/orangefs-sysfs.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/fs/orangefs/orangefs-sysfs.c b/fs/orangefs/orangefs-sysfs.c
> index a799546a67f7..084954448f18 100644
> --- a/fs/orangefs/orangefs-sysfs.c
> +++ b/fs/orangefs/orangefs-sysfs.c
> @@ -609,15 +609,6 @@ static ssize_t sysfs_service_op_store(struct kobject *kobj,
>  			new_op->upcall.req.param.u.value32[0] = val1;
>  			new_op->upcall.req.param.u.value32[1] = val2;
>  			goto value_set;
> -		} else if (!strcmp(attr->attr.name,
> -				   "perf_counter_reset")) {
> -			if ((val > 0)) {
> -				new_op->upcall.req.param.op > -				ORANGEFS_PARAM_REQUEST_OP_READAHEAD_COUNT_SIZE;
> -			} else {
> -				rc = 0;
> -				goto out;
> -			}
>  		}
>  
>  	} else if (!strcmp(kobj->name, ACACHE_KOBJ_ID)) {
> -- 
> 2.9.3
> 
> 
