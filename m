From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 04 Dec 2019 17:39:24 +0000
Subject: Re: [PATCH] net/decnet: fix -EFAULT error that is not getting returned
Message-Id: <b75479fd-055e-3758-fc59-3385185a705b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204151144.1434209-1-colin.king@canonical.com>
In-Reply-To: <20191204151144.1434209-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 12/4/19 7:11 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently an -EFAULT error on a memcpy_to_msg is not being returned
> because it is being overwritten when variable rv is being re-assigned
> to the number of bytes copied after breaking out of a loop. Fix this
> by instead assigning the error to variable copied so that this error
> code propegated to rv and hence is returned at the end of the function.
> 
> [ This bug was was introduced before the current git history ]
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/decnet/af_decnet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/decnet/af_decnet.c b/net/decnet/af_decnet.c
> index e19a92a62e14..e23d9f219597 100644
> --- a/net/decnet/af_decnet.c
> +++ b/net/decnet/af_decnet.c
> @@ -1759,7 +1759,7 @@ static int dn_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>  			chunk = size - copied;
>  
>  		if (memcpy_to_msg(msg, skb->data, chunk)) {
> -			rv = -EFAULT;
> +			copied = -EFAULT;

This does not look right.

We probably want :
		if (!copied)
			copied = -EFAULT;

>  			break;
>  		}
>  		copied += chunk;
> 
