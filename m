From: Stephen Hemminger <shemminger@linux-foundation.org>
Date: Thu, 15 Jul 2010 19:21:44 +0000
Subject: Re: [PATCH 7/8] net: bridge: fix sign bug
Message-Id: <20100715122144.0f2cf5cf@nehalam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219653-12791-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279219653-12791-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.hengli.com.au>, YOSHIFUJI Hideaki <yoshfuji@linux-ipv6.org>, Eric Dumazet <eric.dumazet@gmail.com>, bridge@lists.linux-foundation.org, netdev@vger.kernel.org

On Thu, 15 Jul 2010 22:47:33 +0400
Kulikov Vasiliy <segooon@gmail.com> wrote:

> ipv6_skip_exthdr() can return error code that is below zero.
> 'offset' is unsigned, so it makes no sense.
> ipv6_skip_exthdr() returns 'int' so we can painlessly change type of
> offset to int.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  net/bridge/br_multicast.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
> index 27ae946..85afcda 100644
> --- a/net/bridge/br_multicast.c
> +++ b/net/bridge/br_multicast.c
> @@ -1435,7 +1435,7 @@ static int br_multicast_ipv6_rcv(struct net_bridge *br,
>  	struct icmp6hdr *icmp6h;
>  	u8 nexthdr;
>  	unsigned len;
> -	unsigned offset;
> +	int offset;
>  	int err;
>  
>  	if (!pskb_may_pull(skb, sizeof(*ip6h)))

Acked-by: Stephen Hemminger <shemminger@vyatta.com>

-- 
