From: Nathan Chancellor <natechancellor@gmail.com>
Date: Fri, 13 Nov 2020 18:36:49 +0000
Subject: Re: [PATCH] ipv6: remove unused function ipv6_skb_idev()
Message-Id: <20201113183649.GA1436199@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113135012.32499-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201113135012.32499-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 13, 2020 at 02:50:12PM +0100, Lukas Bulwahn wrote:
> Commit bdb7cc643fc9 ("ipv6: Count interface receive statistics on the
> ingress netdev") removed all callees for ipv6_skb_idev(). Hence, since
> then, ipv6_skb_idev() is unused and make CC=clang W=1 warns:
> 
>   net/ipv6/exthdrs.c:909:33:
>     warning: unused function 'ipv6_skb_idev' [-Wunused-function]
> 
> So, remove this unused function and a -Wunused-function warning.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> Alexey, Hideaki-san, please ack.
> 
> David, Jakub, please pick this minor non-urgent clean-up patch.
> 
>  net/ipv6/exthdrs.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/net/ipv6/exthdrs.c b/net/ipv6/exthdrs.c
> index 374105e4394f..584d1b06eb90 100644
> --- a/net/ipv6/exthdrs.c
> +++ b/net/ipv6/exthdrs.c
> @@ -906,10 +906,6 @@ void ipv6_exthdrs_exit(void)
>  /*
>   * Note: we cannot rely on skb_dst(skb) before we assign it in ip6_route_input().
>   */
> -static inline struct inet6_dev *ipv6_skb_idev(struct sk_buff *skb)
> -{
> -	return skb_dst(skb) ? ip6_dst_idev(skb_dst(skb)) : __in6_dev_get(skb->dev);
> -}
>  
>  static inline struct net *ipv6_skb_net(struct sk_buff *skb)
>  {
> -- 
> 2.17.1
> 
