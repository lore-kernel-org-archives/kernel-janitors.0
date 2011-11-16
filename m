From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Wed, 16 Nov 2011 08:42:07 +0000
Subject: Re: [patch -next v2] 6LoWPAN: double free in lowpan_fragment_xmit()
Message-Id: <CAJmB2rBTHCTcetstpZkNkxX4CAxYF3Sd=Vrg3dmTMDzFQK0vqg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111116083254.GB4349@mwanda>
	<20111116083643.GA25612@mwanda>
In-Reply-To: <20111116083643.GA25612@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

2011/11/16 Dan Carpenter <dan.carpenter@oracle.com>:
> dev_queue_xmit() consumes its own skb, so the call to dev_kfree_skb()
> in lowpan_fragment_xmit() is a double free.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fixed commit message.
>
> diff --git a/net/ieee802154/6lowpan.c b/net/ieee802154/6lowpan.c
> index 602f318..e4ecc1e 100644
> --- a/net/ieee802154/6lowpan.c
> +++ b/net/ieee802154/6lowpan.c
> @@ -980,9 +980,6 @@ lowpan_fragment_xmit(struct sk_buff *skb, u8 *head,
>
> =A0 =A0 =A0 =A0ret =3D dev_queue_xmit(frag);
>
> - =A0 =A0 =A0 if (ret < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_kfree_skb(frag);
> -
> =A0 =A0 =A0 =A0return ret;
> =A0}
>
>
>

Acked-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
