From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Sep 2018 02:29:19 +0000
Subject: Re: [PATCH net-next] vhost_net: add a missing error return
Message-Id: <159c9759-08fe-e170-f5ce-814da1818f48@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180920100158.GA9551@mwanda>
In-Reply-To: <20180920100158.GA9551@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2018年09月20日 18:01, Dan Carpenter wrote:
> We accidentally left out this error return so it leads to some use after
> free bugs later on.
>
> Fixes: 0a0be13b8fe2 ("vhost_net: batch submitting XDP buffers to underlayer sockets")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index dd4e0a301635..1bff6bc8161a 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -1244,6 +1244,7 @@ static int vhost_net_open(struct inode *inode, struct file *f)
>   		kfree(vqs);
>   		kvfree(n);
>   		kfree(queue);
> +		return -ENOMEM;
>   	}
>   	n->vqs[VHOST_NET_VQ_TX].xdp = xdp;
>   

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks!
