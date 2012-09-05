From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 05 Sep 2012 13:11:44 +0000
Subject: Re: [patch] virtio-blk: fix NULL checking in virtblk_alloc_req()
Message-Id: <20120905131144.GA10738@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120905123252.GE6128@elgon.mountain>
In-Reply-To: <20120905123252.GE6128@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On Wed, Sep 05, 2012 at 03:32:53PM +0300, Dan Carpenter wrote:
> Smatch complains about the inconsistent NULL checking here.  Fix it to
> return NULL on failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

ACK

> ---
> This is only needed in linux-next.

Yes upstream is OK.

linux-next picks up stuff from rusty's patch queue so
presumably this can be folded into patch that
triggered this.

> 
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

Smatch is right to complain: on memory allocation
failure this will dereference NULL.

> +	if (use_bio)
> +		sg_init_table(vbr->sg, vblk->sg_elems);
>  
>  	return vbr;
>  }
