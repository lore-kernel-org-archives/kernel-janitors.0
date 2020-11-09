From: Eric Dumazet <edumazet@google.com>
Date: Mon, 09 Nov 2020 09:56:33 +0000
Subject: Re: [PATCH net v2] net: Update window_clamp if SOCK_RCVBUF is set
Message-Id: <CANn89iKiNdtxaL_yMF6=_8=m001vXVaxvECMGbAiXTYZjfj3oQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1604913614-19432-1-git-send-email-wenan.mao@linux.alibaba.com> <1604914417-24578-1-git-send-email-wenan.mao@linux.alibaba.com>
In-Reply-To: <1604914417-24578-1-git-send-email-wenan.mao@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <wenan.mao@linux.alibaba.com>
Cc: David Miller <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Nov 9, 2020 at 10:33 AM Mao Wenan <wenan.mao@linux.alibaba.com> wrote:
>
> When net.ipv4.tcp_syncookies=1 and syn flood is happened,
> cookie_v4_check or cookie_v6_check tries to redo what
> tcp_v4_send_synack or tcp_v6_send_synack did,
> rsk_window_clamp will be changed if SOCK_RCVBUF is set,
> which will make rcv_wscale is different, the client
> still operates with initial window scale and can overshot
> granted window, the client use the initial scale but local
> server use new scale to advertise window value, and session
> work abnormally.

What is not working exactly ?

Sending a 'big wscale' should not really matter, unless perhaps there
is a buggy stack at the remote end ?

>
> Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>
> ---
>  v2: fix for ipv6.
>  net/ipv4/syncookies.c | 4 ++++
>  net/ipv6/syncookies.c | 5 +++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 6ac473b..57ce317 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c
> @@ -427,6 +427,10 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
>
>         /* Try to redo what tcp_v4_send_synack did. */
>         req->rsk_window_clamp = tp->window_clamp ? :dst_metric(&rt->dst, RTAX_WINDOW);
> +       /* limit the window selection if the user enforce a smaller rx buffer */
> +       if (sk->sk_userlocks & SOCK_RCVBUF_LOCK &&
> +           (req->rsk_window_clamp > tcp_full_space(sk) || req->rsk_window_clamp = 0))
> +               req->rsk_window_clamp = tcp_full_space(sk);

This seems not needed to me.

We call tcp_select_initial_window() with tcp_full_space(sk) passed as
the 2nd parameter.

tcp_full_space(sk) will then apply :

space = min(*window_clamp, space);

Please cook a packetdrill test to demonstrate what you are seeing ?
