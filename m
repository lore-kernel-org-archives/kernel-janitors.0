From: Ying Xue <ying.xue@windriver.com>
Date: Wed, 01 Aug 2018 06:10:02 +0000
Subject: Re: [PATCH] net/tipc: remove redundant variables 'tn' and 'oport'
Message-Id: <34f9d78b-cce8-469a-3f5c-a96c1a6a4197@windriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180731160137.5850-1-colin.king@canonical.com>
In-Reply-To: <20180731160137.5850-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jon Maloy <jon.maloy@ericsson.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/01/2018 12:01 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables 'tn' and 'oport'  are being assigned but are never used hence
> they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'oport' set but not used [-Wunused-but-set-variable]
> warning: variable 'tn' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Ying Xue <ying.xue@windriver.com>

> ---
>  net/tipc/socket.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/net/tipc/socket.c b/net/tipc/socket.c
> index 3763bedecf5f..c1e93c9515bc 100644
> --- a/net/tipc/socket.c
> +++ b/net/tipc/socket.c
> @@ -411,7 +411,6 @@ static int tipc_sk_sock_err(struct socket *sock, long *timeout)
>  static int tipc_sk_create(struct net *net, struct socket *sock,
>  			  int protocol, int kern)
>  {
> -	struct tipc_net *tn;
>  	const struct proto_ops *ops;
>  	struct sock *sk;
>  	struct tipc_sock *tsk;
> @@ -446,7 +445,6 @@ static int tipc_sk_create(struct net *net, struct socket *sock,
>  	INIT_LIST_HEAD(&tsk->publications);
>  	INIT_LIST_HEAD(&tsk->cong_links);
>  	msg = &tsk->phdr;
> -	tn = net_generic(sock_net(sk), tipc_net_id);
>  
>  	/* Finish initializing socket data structures */
>  	sock->ops = ops;
> @@ -1117,7 +1115,7 @@ void tipc_sk_mcast_rcv(struct net *net, struct sk_buff_head *arrvq,
>  	u32 self = tipc_own_addr(net);
>  	u32 type, lower, upper, scope;
>  	struct sk_buff *skb, *_skb;
> -	u32 portid, oport, onode;
> +	u32 portid, onode;
>  	struct sk_buff_head tmpq;
>  	struct list_head dports;
>  	struct tipc_msg *hdr;
> @@ -1133,7 +1131,6 @@ void tipc_sk_mcast_rcv(struct net *net, struct sk_buff_head *arrvq,
>  		user = msg_user(hdr);
>  		mtyp = msg_type(hdr);
>  		hlen = skb_headroom(skb) + msg_hdr_sz(hdr);
> -		oport = msg_origport(hdr);
>  		onode = msg_orignode(hdr);
>  		type = msg_nametype(hdr);
>  
> 
