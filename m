From: Mukesh Ojha <mojha@codeaurora.org>
Date: Fri, 05 Apr 2019 06:59:04 +0000
Subject: Re: [PATCH] tcp: remove redundant check on tskb
Message-Id: <b4c8d1bc-0ecf-21cb-fe11-ebe5d7e91712@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404144603.27682-1-colin.king@canonical.com>
In-Reply-To: <20190404144603.27682-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/4/2019 8:16 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The non-null check on tskb is always false because it is in an else
> path of a check on tskb and hence tskb is null in this code block.
> This is check is therefore redundant and can be removed as well
> as the label coalesc.
>
> if (tsbk) {
>          ...
> } else {
>          ...
>          if (unlikely(!skb)) {
>                  if (tskb)       /* can never be true, redundant code */
>                          goto coalesc;
>                  return;
>          }
> }
>
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   net/ipv4/tcp_output.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index e265d1aeeb66..32061928b054 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -3088,7 +3088,6 @@ void tcp_send_fin(struct sock *sk)
>   		tskb = skb_rb_last(&sk->tcp_rtx_queue);
>   
>   	if (tskb) {
> -coalesce:
>   		TCP_SKB_CB(tskb)->tcp_flags |= TCPHDR_FIN;
>   		TCP_SKB_CB(tskb)->end_seq++;
>   		tp->write_seq++;
> @@ -3104,11 +3103,9 @@ void tcp_send_fin(struct sock *sk)
>   		}
>   	} else {
>   		skb = alloc_skb_fclone(MAX_TCP_HEADER, sk->sk_allocation);
> -		if (unlikely(!skb)) {
> -			if (tskb)
> -				goto coalesce;
> +		if (unlikely(!skb))
>   			return;
> -		}
> +
>   		INIT_LIST_HEAD(&skb->tcp_tsorted_anchor);
>   		skb_reserve(skb, MAX_TCP_HEADER);
>   		sk_forced_mem_schedule(sk, skb->truesize);
