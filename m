From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Wed, 27 Jun 2012 06:57:18 +0000
Subject: Re: [patch -next] 6lowpan: double unlock on an error path
Message-Id: <CAJmB2rCwYo1KR_gOQFrvMn2A2px1mPEN5DV+KGtjV914p-o7NA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627065309.GA25774@elgon.mountain>
In-Reply-To: <20120627065309.GA25774@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

2012/6/27 Dan Carpenter <dan.carpenter@oracle.com>:
> We already unlocked a few lines earlier here, so we can go directly to
> drop without passing through unlock. =A0This was introduced recently in
> c5d3687f6c ('6lowpan: read data from skb safely').
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
> index ad0c226..cd5007f 100644
> --- a/net/ieee802154/6lowpan.c
> +++ b/net/ieee802154/6lowpan.c
> @@ -771,7 +771,7 @@ lowpan_process_data(struct sk_buff *skb)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(frame);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (lowpan_fetch_skb_u8(sk=
b, &iphc0))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto unlock=
_and_drop;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto drop;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}

Acked-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
