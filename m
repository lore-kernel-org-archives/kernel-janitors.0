From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Sun, 02 Aug 2020 06:26:16 +0000
Subject: Re: [PATCH -next v2] virtio_net: Avoid loop in virtnet_poll
Message-Id: <20200802022549-mutt-send-email-mst@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802003818-mutt-send-email-mst@kernel.org>
 <1596347793-55894-1-git-send-email-wenan.mao@linux.alibaba.com>
In-Reply-To: <1596347793-55894-1-git-send-email-wenan.mao@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <wenan.mao@linux.alibaba.com>
Cc: jasowang@redhat.com, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Just noticed the subject is wrong: this is no longer
a virtio_net patch.

On Sun, Aug 02, 2020 at 01:56:33PM +0800, Mao Wenan wrote:
> The loop may exist if vq->broken is true,
> virtqueue_get_buf_ctx_packed or virtqueue_get_buf_ctx_split
> will return NULL, so virtnet_poll will reschedule napi to
> receive packet, it will lead cpu usage(si) to 100%.
> 
> call trace as below:
> virtnet_poll
> 	virtnet_receive
> 		virtqueue_get_buf_ctx
> 			virtqueue_get_buf_ctx_packed
> 			virtqueue_get_buf_ctx_split
> 	virtqueue_napi_complete
> 		virtqueue_poll           //return true
> 		virtqueue_napi_schedule //it will reschedule napi
> 
> To fix this, return false if vq is broken in virtqueue_poll.
> 
> Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>
> ---
>  v1->v2: fix it in virtqueue_poll suggested by Michael S. Tsirkin <mst@redhat.com>
>  drivers/virtio/virtio_ring.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 58b96ba..4f7c73e 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1960,6 +1960,9 @@ bool virtqueue_poll(struct virtqueue *_vq, unsigned last_used_idx)
>  {
>  	struct vring_virtqueue *vq = to_vvq(_vq);
>  
> +	if (unlikely(vq->broken))
> +		return false;
> +
>  	virtio_mb(vq->weak_barriers);
>  	return vq->packed_ring ? virtqueue_poll_packed(_vq, last_used_idx) :
>  				 virtqueue_poll_split(_vq, last_used_idx);
> -- 
> 1.8.3.1
