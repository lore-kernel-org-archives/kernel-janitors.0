From: Rusty Russell <rusty@rustcorp.com.au>
Date: Thu, 06 Sep 2012 03:07:52 +0000
Subject: Re: [patch] virtio-blk: fix NULL checking in virtblk_alloc_req()
Message-Id: <871uifj1vr.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123252.GE6128@elgon.mountain>
In-Reply-To: <20120905123252.GE6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Asias He <asias@redhat.com>
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch complains about the inconsistent NULL checking here.  Fix it to
> return NULL on failure.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is only needed in linux-next.

Nice!

> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 2edfb5c..457db0c 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -90,10 +90,11 @@ static inline struct virtblk_req *virtblk_alloc_req(struct virtio_blk *vblk,
>  	struct virtblk_req *vbr;
>  
>  	vbr = mempool_alloc(vblk->pool, gfp_mask);
> -	if (vbr && use_bio)
> -		sg_init_table(vbr->sg, vblk->sg_elems);
> +	if (!vbr)
> +		return NULL;
>  
> -	vbr->vblk = vblk;
> +	if (use_bio)
> +		sg_init_table(vbr->sg, vblk->sg_elems);
>  
>  	return vbr;
>  }

But it turns out that "vbr->vblk = vblk;" assignment is important :)

Fixed and applied,
Rusty.
