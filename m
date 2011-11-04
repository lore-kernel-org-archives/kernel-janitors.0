From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 04 Nov 2011 18:35:54 +0000
Subject: Re: [patch 1/2] xen-gntalloc: integer overflow in
Message-Id: <20111104183554.GA1616@phenom.dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111104182408.GD5796@elgon.mountain>
In-Reply-To: <20111104182408.GD5796@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org

On Fri, Nov 04, 2011 at 09:24:08PM +0300, Dan Carpenter wrote:
> On 32 bit systems a high value of op.count could lead to an integer
> overflow in the kzalloc() and gref_ids would be smaller than
> expected.  If the you triggered another integer overflow in
> "if (gref_size + op.count > limit)" then you'd probably get memory
> corruption inside add_grefs().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Great! Keep them coming!  Will push for stable and 3.2.

> 
> diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
> index f6832f4..23c60cf 100644
> --- a/drivers/xen/gntalloc.c
> +++ b/drivers/xen/gntalloc.c
> @@ -280,7 +280,7 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
>  		goto out;
>  	}
>  
> -	gref_ids = kzalloc(sizeof(gref_ids[0]) * op.count, GFP_TEMPORARY);
> +	gref_ids = kcalloc(op.count, sizeof(gref_ids[0]), GFP_TEMPORARY);
>  	if (!gref_ids) {
>  		rc = -ENOMEM;
>  		goto out;
