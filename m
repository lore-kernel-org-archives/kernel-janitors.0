From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sat, 30 Oct 2010 14:35:50 +0000
Subject: Re: [PATCH] net: core: sock: fix information leak to userland
Message-Id: <1288449350.2680.970.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448801-6303-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288448801-6303-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>, Herbert Xu <herbert@gondor.hengli.com.au>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Le samedi 30 octobre 2010 à 18:26 +0400, Vasiliy Kulikov a écrit :
> "Address" variable might be not fully initialized in sock->ops->get_name().
> The only current implementation is get_name(), it leaves some padding
> fields of sockaddr_tipc uninitialized.  It leads to leaking of contents
> of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  net/core/sock.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/net/core/sock.c b/net/core/sock.c
> index 3eed542..759dd81 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -930,6 +930,7 @@ int sock_getsockopt(struct socket *sock, int level, int optname,
>  	{
>  		char address[128];
>  
> +		memset(&address, 0, sizeof(address));
>  		if (sock->ops->getname(sock, (struct sockaddr *)address, &lv, 2))
>  			return -ENOTCONN;
>  		if (lv < len)

???

Please fix the real bug.



