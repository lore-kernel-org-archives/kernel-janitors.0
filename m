From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Tue, 19 Apr 2016 17:57:51 +0000
Subject: Re: [patch -next] geneve: testing the wrong variable in geneve6_build_skb()
Message-Id: <CAKgT0UdNL57YV9qJstjzpqbr9WutUvPRZ5VaPwCnUNV_hMRgdw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160419143056.GD4876@mwanda>
In-Reply-To: <20160419143056.GD4876@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexander Duyck <aduyck@mirantis.com>, Jesse Gross <jesse@kernel.org>, "John W. Linville" <linville@tuxdriver.com>, Pravin B Shelar <pshelar@nicira.com>, Jiri Benc <jbenc@redhat.com>, Daniel Borkmann <daniel@iogearbox.net>, Tom Herbert <tom@herbertland.com>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 19, 2016 at 7:30 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We intended to test "err" and not "skb".
>
> Fixes: aed069df099c ('ip_tunnel_core: iptunnel_handle_offloads returns int and doesn't free skb')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
> index efbc7ce..512dbe0 100644
> --- a/drivers/net/geneve.c
> +++ b/drivers/net/geneve.c
> @@ -733,7 +733,7 @@ static int geneve6_build_skb(struct dst_entry *dst, struct sk_buff *skb,
>                 goto free_dst;
>
>         err = udp_tunnel_handle_offloads(skb, udp_sum);
> -       if (IS_ERR(skb))
> +       if (err)
>                 goto free_dst;
>
>         gnvh = (struct genevehdr *)__skb_push(skb, sizeof(*gnvh) + opt_len);


Yeah, this looks like I missed a spot.  Thanks for catching this.

Acked-by: Alexander Duyck <aduyck@mirantis.com>
