From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 14 Nov 2017 19:40:14 +0000
Subject: Re: [PATCH][net-next] tcp: remove the now redundant non-null check on tskb
Message-Id: <1510688414.2849.179.camel@edumazet-glaptop3.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171114184144.11239-1-colin.king@canonical.com>
In-Reply-To: <20171114184144.11239-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-11-14 at 18:41 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The non-null check on tskb is redundant as it is in an else
> section of a check on tskb where tskb is always null. Remove
> the redundant if statement and the label coalesce.
> 
> Detected by CoverityScan, CID#1457751 ("Logically dead code")
> 
> Fixes: 75c119afe14f ("tcp: implement rb-tree based retransmit queue")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ipv4/tcp_output.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 071bdd34f8eb..b58c986b2b27 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -3053,7 +3053,6 @@ void tcp_send_fin(struct sock *sk)
>  		tskb = skb_rb_last(&sk->tcp_rtx_queue);
>  
>  	if (tskb) {
> -coalesce:
>  		TCP_SKB_CB(tskb)->tcp_flags |= TCPHDR_FIN;
>  		TCP_SKB_CB(tskb)->end_seq++;
>  		tp->write_seq++;
> @@ -3069,11 +3068,8 @@ void tcp_send_fin(struct sock *sk)
>  		}
>  	} else {
>  		skb = alloc_skb_fclone(MAX_TCP_HEADER, sk->sk_allocation);
> -		if (unlikely(!skb)) {
> -			if (tskb)
> -				goto coalesce;
> +		if (unlikely(!skb))
>  			return;
> -		}
>  		INIT_LIST_HEAD(&skb->tcp_tsorted_anchor);
>  		skb_reserve(skb, MAX_TCP_HEADER);
>  		sk_forced_mem_schedule(sk, skb->truesize);

Hmm... I would rather try to use skb_rb_last(), because
alloc_skb_fclone() might fail even if tcp_under_memory_pressure() is
false.

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 76dbe884f2469660028684a46fc19afa000a1353..eea017b8a8918815226fd1412c0a7b8e484aeca8 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3070,6 +3070,7 @@ void tcp_send_fin(struct sock *sk)
 	} else {
 		skb = alloc_skb_fclone(MAX_TCP_HEADER, sk->sk_allocation);
 		if (unlikely(!skb)) {
+			tskb = skb_rb_last(&sk->tcp_rtx_queue);
 			if (tskb)
 				goto coalesce;
 			return;


