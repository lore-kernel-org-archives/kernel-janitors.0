From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 31 May 2018 17:37:39 +0000
Subject: Re: [PATCH net-next] virtio_net: fix error return code in virtnet_probe()
Message-Id: <20180531203733-mutt-send-email-mst@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527732307-145609-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527732307-145609-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jason Wang <jasowang@redhat.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 31, 2018 at 02:05:07AM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the failover create fail error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: ba5e4426e80e ("virtio_net: Extend virtio to use VF datapath when available")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/net/virtio_net.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 8f08a3e..2d55e2a 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2935,8 +2935,10 @@ static int virtnet_probe(struct virtio_device *vdev)
>  
>  	if (virtio_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
>  		vi->failover = net_failover_create(vi->dev);
> -		if (IS_ERR(vi->failover))
> +		if (IS_ERR(vi->failover)) {
> +			err = PTR_ERR(vi->failover);
>  			goto free_vqs;
> +		}
>  	}
>  
>  	err = register_netdev(dev);
