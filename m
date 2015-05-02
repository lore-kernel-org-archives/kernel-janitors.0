From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 02 May 2015 21:47:07 +0000
Subject: Re: [PATCH] staging: lustre: obd_support: Add obd_cpt_alloc function
Message-Id: <20150502214707.GI14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430601408-12847-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430601408-12847-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Oleg Drokin <oleg.drokin@intel.com>, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org

On Sat, May 02, 2015 at 11:16:48PM +0200, Julia Lawall wrote:

> Some questions: Is the name OK?  Is the NULL test needed?  If not, should
> the call to kzalloc_node with the call to cfs_cpt_spread_node just be
> inlined into the call sites?
> 
>  drivers/staging/lustre/lustre/include/obd_support.h |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/lustre/lustre/include/obd_support.h b/drivers/staging/lustre/lustre/include/obd_support.h
> index 2991d2e..3d380f0 100644
> --- a/drivers/staging/lustre/lustre/include/obd_support.h
> +++ b/drivers/staging/lustre/lustre/include/obd_support.h
> @@ -655,6 +655,15 @@ do {									      \
>  #define OBD_CPT_ALLOC_PTR(ptr, cptab, cpt)				      \
>  	OBD_CPT_ALLOC(ptr, cptab, cpt, sizeof(*(ptr)))
>  
> +static inline void *obd_cpt_alloc(struct cfs_cpt_table *cptab, int cpt,
> +				  size_t size, gfp_t flags)
> +{
> +	return (cptab) = NULL ?

These parens aren't needed any more.

I feel like people shouldn't deliberately call this with dptab = NULL.
I looked at it a bit and wasn't sure, (was sleepy though), so it's maybe
safest to keep the test.

I wish that cfs_cpt_spread_node() accepted NULL pointers so that we
didn't have to have the check for "cptab = NULL".  But your patch seems
like the way forward for now.

> +		kzalloc(size, flags) :
> +		kzalloc_node(size, flags, cfs_cpt_spread_node(cptab, cpt));
> +}
> +

regards,
dan carpenter
