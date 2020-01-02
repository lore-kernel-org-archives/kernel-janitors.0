From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 02 Jan 2020 16:45:47 +0000
Subject: Re: [PATCH net-next] tcp: use REXMIT_NEW instead of magic number
Message-Id: <CADVnQy=osX-HAnRduPid27tNZHLrzudT+5C4-+K3ERY-BMW3VA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200102140227.77780-1-maowenan@huawei.com>
In-Reply-To: <20200102140227.77780-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Yuchung Cheng <ycheng@google.com>

On Thu, Jan 2, 2020 at 9:07 AM Mao Wenan <maowenan@huawei.com> wrote:
>
> REXMIT_NEW is a macro for "FRTO-style
> transmit of unsent/new packets", this patch
> makes it more readable.
>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  net/ipv4/tcp_input.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 88b987ca9ebb..1d1e3493965f 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -3550,7 +3550,7 @@ static void tcp_xmit_recovery(struct sock *sk, int rexmit)
>         if (rexmit = REXMIT_NONE || sk->sk_state = TCP_SYN_SENT)
>                 return;
>
> -       if (unlikely(rexmit = 2)) {
> +       if (unlikely(rexmit = REXMIT_NEW)) {
>                 __tcp_push_pending_frames(sk, tcp_current_mss(sk),
>                                           TCP_NAGLE_OFF);
>                 if (after(tp->snd_nxt, tp->high_seq))
> --

Acked-by: Neal Cardwell <ncardwell@google.com>

Thanks for sending this patch!

neal
