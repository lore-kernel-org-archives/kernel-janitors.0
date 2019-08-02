From: Oliver Hartkopp <socketcan@hartkopp.net>
Date: Fri, 02 Aug 2019 08:10:20 +0000
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-Id: <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802033643.84243-1-maowenan@huawei.com>
In-Reply-To: <20190802033643.84243-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, davem@davemloft.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/08/2019 05.36, Mao Wenan wrote:
> There are two warings in net/can, fix them by setting bcm_sock_no_ioctlcmd
> and raw_sock_no_ioctlcmd as static.
> 
> net/can/bcm.c:1683:5: warning: symbol 'bcm_sock_no_ioctlcmd' was not declared. Should it be static?
> net/can/raw.c:840:5: warning: symbol 'raw_sock_no_ioctlcmd' was not declared. Should it be static?
> 
> Fixes: 473d924d7d46 ("can: fix ioctl function removal")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>

Thanks Mao!

Btw. what kind of compiler/make switches are you using so that I can see 
these warnings myself the next time?

Best regards,
Oliver

> ---
>   net/can/bcm.c | 2 +-
>   net/can/raw.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/can/bcm.c b/net/can/bcm.c
> index bf1d0bbecec8..b8a32b4ac368 100644
> --- a/net/can/bcm.c
> +++ b/net/can/bcm.c
> @@ -1680,7 +1680,7 @@ static int bcm_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>   	return size;
>   }
>   
> -int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
> +static int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
>   			 unsigned long arg)
>   {
>   	/* no ioctls for socket layer -> hand it down to NIC layer */
> diff --git a/net/can/raw.c b/net/can/raw.c
> index da386f1fa815..a01848ff9b12 100644
> --- a/net/can/raw.c
> +++ b/net/can/raw.c
> @@ -837,7 +837,7 @@ static int raw_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>   	return size;
>   }
>   
> -int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
> +static int raw_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
>   			 unsigned long arg)
>   {
>   	/* no ioctls for socket layer -> hand it down to NIC layer */
> 
