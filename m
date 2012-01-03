From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Tue, 03 Jan 2012 15:31:28 +0000
Subject: Re: [patch] virtio_blk: lock() => unlock() typo in
Message-Id: <20120103153127.GA8440@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120103144513.GB21712@elgon.mountain>
In-Reply-To: <20120103144513.GB21712@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On Tue, Jan 03, 2012 at 05:45:13PM +0300, Dan Carpenter wrote:
> This will deadlock.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index f3d77b3..ba73661 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -352,7 +352,7 @@ static void virtblk_config_changed_work(struct work_struct *work)
>  
>  	set_capacity(vblk->disk, capacity);
>  done:
> -	mutex_lock(&vblk->config_lock);
> +	mutex_unlock(&vblk->config_lock);
>  }
>  
>  static void virtblk_config_changed(struct virtio_device *vdev)

Good catch.
Acked-by: Michael S. Tsirkin <mst@redhat.com>

