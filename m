From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 15 Aug 2013 14:04:49 +0000
Subject: Re: [patch] tun: signedness bug in tun_get_user()
Message-Id: <20130815140449.GA8064@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130815125257.GA16932@elgon.mountain>
In-Reply-To: <20130815125257.GA16932@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jason Wang <jasowang@redhat.com>, Eric Dumazet <edumazet@google.com>, Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 15, 2013 at 03:52:57PM +0300, Dan Carpenter wrote:
> The recent fix d9bf5f1309 "tun: compare with 0 instead of total_len" is
> not totally correct.  Because "len" and "sizeof()" are size_t type, that
> means they are never less than zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> 
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index af987f0..7ed13cc 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -977,8 +977,9 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
>  	u32 rxhash;
>  
>  	if (!(tun->flags & TUN_NO_PI)) {
> -		if ((len -= sizeof(pi)) < 0)
> +		if (len < sizeof(pi))
>  			return -EINVAL;
> +		len -= sizeof(pi);
>  
>  		if (memcpy_fromiovecend((void *)&pi, iv, 0, sizeof(pi)))
>  			return -EFAULT;
> @@ -986,8 +987,9 @@ static ssize_t tun_get_user(struct tun_struct *tun, struct tun_file *tfile,
>  	}
>  
>  	if (tun->flags & TUN_VNET_HDR) {
> -		if ((len -= tun->vnet_hdr_sz) < 0)
> +		if (len < tun->vnet_hdr_sz)
>  			return -EINVAL;
> +		len -= tun->vnet_hdr_sz;
>  
>  		if (memcpy_fromiovecend((void *)&gso, iv, offset, sizeof(gso)))
>  			return -EFAULT;
