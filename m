From: Peter Oskolkov <posk@google.com>
Date: Mon, 06 Aug 2018 19:29:10 +0000
Subject: Re: [PATCH net-next] ipv4: frags: precedence bug in ip_expire()
Message-Id: <CAPNVh5cbi37-ioegbGdO20R8LNRMOepuG_d3wRRMkaqvofuD4A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180806191735.c5miffnrhl2w2ljh@kili.mountain>
In-Reply-To: <20180806191735.c5miffnrhl2w2ljh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Ack. Thanks, Dan!
On Mon, Aug 6, 2018 at 12:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We accidentally removed the parentheses here, but they are required
> because '!' has higher precedence than '&'.
>
> Fixes: fa0f527358bd ("ip: use rb trees for IP frag queue.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
> index 0e8f8de77e71..7cb7ed761d8c 100644
> --- a/net/ipv4/ip_fragment.c
> +++ b/net/ipv4/ip_fragment.c
> @@ -154,7 +154,7 @@ static void ip_expire(struct timer_list *t)
>         __IP_INC_STATS(net, IPSTATS_MIB_REASMFAILS);
>         __IP_INC_STATS(net, IPSTATS_MIB_REASMTIMEOUT);
>
> -       if (!qp->q.flags & INET_FRAG_FIRST_IN)
> +       if (!(qp->q.flags & INET_FRAG_FIRST_IN))
>                 goto out;
>
>         /* sk_buff::dev and sk_buff::rbnode are unionized. So we
