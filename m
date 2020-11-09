From: Eric Dumazet <edumazet@google.com>
Date: Mon, 09 Nov 2020 16:59:42 +0000
Subject: Re: [PATCH net v3] net: Update window_clamp if SOCK_RCVBUF is set
Message-Id: <CANn89iLVWFgDvkUygK8Sh_H7=qFmuZKo1h=aoq+F57J28r4EUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANn89iLhCjh7ZQRanVEj6Sytzn6LhFOb9Xo7O=teLHPouoeopw@mail.gmail.com>
 <1604940830-74688-1-git-send-email-wenan.mao@linux.alibaba.com>
In-Reply-To: <1604940830-74688-1-git-send-email-wenan.mao@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <wenan.mao@linux.alibaba.com>
Cc: David Miller <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Nov 9, 2020 at 5:54 PM Mao Wenan <wenan.mao@linux.alibaba.com> wrote:
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
>
> Fixes: e88c64f0a425 ("tcp: allow effective reduction of TCP's
> rcv-buffer via setsockopt")

Please put this tag in a single line (no line wrap)
And do not add an empty line after it.
The Fixes: tag is part of the official tags, all grouped together.
>
> Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>
> ---
>  v3: add local variable full_space, add fixes tag.
>  v2: fix for ipv6.
>  net/ipv4/syncookies.c | 7 ++++++-
>  net/ipv6/syncookies.c | 8 +++++++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 6ac473b..eea4698 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c
> @@ -327,6 +327,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
>         struct inet_request_sock *ireq;
>         struct tcp_request_sock *treq;
>         struct tcp_sock *tp = tcp_sk(sk);
> +       int full_space = tcp_full_space(sk);

Please delay the actual call to tcp_full_space() until we need it.
If a packet does not validate the cookie, no need to init @full_space.

>         const struct tcphdr *th = tcp_hdr(skb);
>         __u32 cookie = ntohl(th->ack_seq) - 1;
>         struct sock *ret = sk;
> @@ -427,8 +428,12 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
>
>         /* Try to redo what tcp_v4_send_synack did. */
>         req->rsk_window_clamp = tp->window_clamp ? :dst_metric(&rt->dst, RTAX_WINDOW);
> +       /* limit the window selection if the user enforce a smaller rx buffer */

eg:
      full_space = tcp_full_space(sk);

> +       if (sk->sk_userlocks & SOCK_RCVBUF_LOCK &&
> +           (req->rsk_window_clamp > full_space || req->rsk_window_clamp = 0))
> +               req->rsk_window_clamp = full_space;
>
> -       tcp_select_initial_window(sk, tcp_full_space(sk), req->mss,
> +       tcp_select_initial_window(sk, full_space, req->mss,
>                                   &req->rsk_rcv_wnd, &req->rsk_window_clamp,
>                                   ireq->wscale_ok, &rcv_wscale,
>                                   dst_metric(&rt->dst, RTAX_INITRWND));
> diff --git a/net/ipv6/syncookies.c b/net/ipv6/syncookies.c
> index e796a64..5b09bb6 100644
> --- a/net/ipv6/syncookies.c
> +++ b/net/ipv6/syncookies.c
> @@ -132,6 +132,7 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
>         struct tcp_request_sock *treq;
>         struct ipv6_pinfo *np = inet6_sk(sk);
>         struct tcp_sock *tp = tcp_sk(sk);
> +       int full_space = tcp_full_space(sk);

Same remark here.

>         const struct tcphdr *th = tcp_hdr(skb);
>         __u32 cookie = ntohl(th->ack_seq) - 1;
>         struct sock *ret = sk;
> @@ -241,7 +242,12 @@ struct sock *cookie_v6_check(struct sock *sk, struct sk_buff *skb)
>         }
>
>         req->rsk_window_clamp = tp->window_clamp ? :dst_metric(dst, RTAX_WINDOW);
> -       tcp_select_initial_window(sk, tcp_full_space(sk), req->mss,
> +       /* limit the window selection if the user enforce a smaller rx buffer */
> +       if (sk->sk_userlocks & SOCK_RCVBUF_LOCK &&
> +           (req->rsk_window_clamp > full_space || req->rsk_window_clamp = 0))
> +               req->rsk_window_clamp = full_space;
> +
> +       tcp_select_initial_window(sk, full_space, req->mss,
>                                   &req->rsk_rcv_wnd, &req->rsk_window_clamp,
>                                   ireq->wscale_ok, &rcv_wscale,
>                                   dst_metric(dst, RTAX_INITRWND));
> --
> 1.8.3.1
>

Thanks !
