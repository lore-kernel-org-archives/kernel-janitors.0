From: Eric Dumazet <edumazet@google.com>
Date: Mon, 09 Nov 2020 17:28:53 +0000
Subject: Re: [PATCH net v4] net: Update window_clamp if SOCK_RCVBUF is set
Message-Id: <CANn89i+ABLMJTEKat=9=qujNwe0BFavphzqYc1CQGtrdkwUnXg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANn89iLVWFgDvkUygK8Sh_H7=qFmuZKo1h=aoq+F57J28r4EUA@mail.gmail.com>
 <1604942276-92635-1-git-send-email-wenan.mao@linux.alibaba.com>
In-Reply-To: <1604942276-92635-1-git-send-email-wenan.mao@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <wenan.mao@linux.alibaba.com>
Cc: David Miller <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Nov 9, 2020 at 6:18 PM Mao Wenan <wenan.mao@linux.alibaba.com> wrote:
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
> Fixes: e88c64f0a425 ("tcp: allow effective reduction of TCP's rcv-buffer via setsockopt")
> Signed-off-by: Mao Wenan <wenan.mao@linux.alibaba.com>
> ---
>  v4: change fixes tag format, and delay the actual call to
>  tcp_full_space().
>  v3: add local variable full_space, add fixes tag.
>  v2: fix for ipv6.
>  net/ipv4/syncookies.c | 8 +++++++-
>  net/ipv6/syncookies.c | 9 ++++++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
> index 6ac473b..8784e1f 100644
> --- a/net/ipv4/syncookies.c
> +++ b/net/ipv4/syncookies.c
> @@ -327,6 +327,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb)
>         struct inet_request_sock *ireq;
>         struct tcp_request_sock *treq;
>         struct tcp_sock *tp = tcp_sk(sk);
> +       int full_space;

SGTM. although you could have avoided adding a variable breaking the almost
correct reverse Christmas tree that some of us prefer.

Something like this would look better :

diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
index 6ac473b47f30d4d5e5e9455424b1a91d84e649ee..78af720f3e2c6dcdc7298178c5d2f02f0e425e04
100644
--- a/net/ipv4/syncookies.c
+++ b/net/ipv4/syncookies.c
@@ -331,7 +331,7 @@ struct sock *cookie_v4_check(struct sock *sk,
struct sk_buff *skb)
        __u32 cookie = ntohl(th->ack_seq) - 1;
        struct sock *ret = sk;
        struct request_sock *req;
-       int mss;
+       int full_space, mss;
        struct rtable *rt;
        __u8 rcv_wscale;
        struct flowi4 fl4;
