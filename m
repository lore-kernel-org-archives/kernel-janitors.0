From: Catherine Sullivan <csully@google.com>
Date: Wed, 21 Aug 2019 17:20:25 +0000
Subject: Re: [PATCH v2 net] gve: Copy and paste bug in gve_get_stats()
Message-Id: <CAH_-1qxhH70xNLd+q4TjzVeT7OoHMfWUJGtBQEPru8xFVnHGsg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820090053.GA24410@mwanda> <20190820090739.GB1845@kadam>
In-Reply-To: <20190820090739.GB1845@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sagi Shahar <sagis@google.com>, Jon Olson <jonolson@google.com>, "David S. Miller" <davem@davemloft.net>, Willem de Bruijn <willemb@google.com>, Luigi Rizzo <lrizzo@google.com>, Chuhong Yuan <hslester96@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 20, 2019 at 2:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There is a copy and paste error so we have "rx" where "tx" was intended
> in the priv->tx[] array.
>
> Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix a typo in the subject: buy -> bug (Thanks Walter Harms)
>
>  drivers/net/ethernet/google/gve/gve_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
> index 497298752381..aca95f64bde8 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -50,7 +50,7 @@ static void gve_get_stats(struct net_device *dev, struct rtnl_link_stats64 *s)
>                                   u64_stats_fetch_begin(&priv->tx[ring].statss);
>                                 s->tx_packets += priv->tx[ring].pkt_done;
>                                 s->tx_bytes += priv->tx[ring].bytes_done;
> -                       } while (u64_stats_fetch_retry(&priv->rx[ring].statss,
> +                       } while (u64_stats_fetch_retry(&priv->tx[ring].statss,
>                                                        start));
>                 }
>         }
> --
> 2.20.1

Thanks!

Reviewed-by: Catherine Sullivan <csully@google.com>
