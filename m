From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 02 Feb 2012 16:05:02 +0000
Subject: Re: [PATCH 2/3 v2] drivers/net/ethernet/ti: Move call to PTR_ERR after reassignment
Message-Id: <alpine.DEB.2.02.1202021702500.1928@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-508108714-1328198703=:1928"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328194382-32465-1-git-send-email-Julia.Lawall@lip6.fr> <1328194382-32465-3-git-send-email-Julia.Lawall@lip6.fr> <CABPrwzf0hH+2OOFQ2Q6ZVHwn=Ws3SvxbwVn0LwKjfkYVdP8zgg@mail.gmail.com>
In-Reply-To: <CABPrwzf0hH+2OOFQ2Q6ZVHwn=Ws3SvxbwVn0LwKjfkYVdP8zgg@mail.gmail.com>
To: D A <runezcape@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-508108714-1328198703=:1928
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Feb 2012, D A wrote:

> hello all,
>=20
> im in the janitors for a while now and i keep looking at the emails you k=
eep
> sending to eachother, but i m lost, i have a back ground in C how can i be
> part of this, any body can give some help to start, a small task that i c=
an
> begin with ?

There are hundreds of places where the various devm_ functions, eg=20
devm_kzalloc, could be used.  Proceed slowly and carefully...

Documentation/driver-model/devres.txt

julia


>=20
> there must be a way or a strategy to absorb new members, i m 3 months now=
 or
> more.
>=20
>=20
> On Thu, Feb 2, 2012 at 4:53 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>       From: Julia Lawall <Julia.Lawall@lip6.fr>
>
>       PTR_ERR should be called before its argument is cleared.
>
>       The semantic match that finds this problem is as follows:
>       (http://coccinelle.lip6.fr/)
>
>       // <smpl>
>       @@
>       expression e,e1;
>       constant c;
>       @@
>
>       *e =3D c
>       ... when !=3D e =3D e1
>       =A0 =A0when !=3D &e
>       =A0 =A0when !=3D true IS_ERR(e)
>       *PTR_ERR(e)
>       // </smpl>
>
>       Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>       Reported-by: Josh Triplett <josh@joshtriplett.org>
>
>       ---
>       v2: correct commit message.
>
>       =A0drivers/net/ethernet/ti/davinci_emac.c | =A0 =A03 ++-
>       =A0drivers/net/ethernet/ti/davinci_mdio.c | =A0 =A02 +-
>       =A02 files changed, 3 insertions(+), 2 deletions(-)
>
>       diff --git a/drivers/net/ethernet/ti/davinci_emac.c
>       b/drivers/net/ethernet/ti/davinci_emac.c
>       index efd4f3e..922a937 100644
>       --- a/drivers/net/ethernet/ti/davinci_emac.c
>       +++ b/drivers/net/ethernet/ti/davinci_emac.c
>       @@ -1600,8 +1600,9 @@ static int emac_dev_open(struct net_device
>       *ndev)
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (IS_ERR(priv->phydev)) {
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(emac_dev, "c=
ould not connect to
>       phy %s\n",
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0priv=
->phy_id);
>       + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(priv-=
>phydev);
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0priv->phydev =3D NUL=
L;
>       - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return PTR_ERR(priv->=
phydev);
>       + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0priv->link =3D 0;
>       diff --git a/drivers/net/ethernet/ti/davinci_mdio.c
>       b/drivers/net/ethernet/ti/davinci_mdio.c
>       index ef7c9c1..af8b8fc 100644
>       --- a/drivers/net/ethernet/ti/davinci_mdio.c
>       +++ b/drivers/net/ethernet/ti/davinci_mdio.c
>       @@ -318,9 +318,9 @@ static int __devinit
>       davinci_mdio_probe(struct platform_device *pdev)
>
>       =A0 =A0 =A0 =A0data->clk =3D clk_get(dev, NULL);
>       =A0 =A0 =A0 =A0if (IS_ERR(data->clk)) {
>       - =A0 =A0 =A0 =A0 =A0 =A0 =A0 data->clk =3D NULL;
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "failed to get device c=
lock\n");
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D PTR_ERR(data->clk);
>       + =A0 =A0 =A0 =A0 =A0 =A0 =A0 data->clk =3D NULL;
>       =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto bail_out;
>       =A0 =A0 =A0 =A0}
>=20
>
>       --
>       To unsubscribe from this list: send the line "unsubscribe
>       kernel-janitors" in
>       the body of a message to majordomo@vger.kernel.org
>       More majordomo info at
>       =A0http://vger.kernel.org/majordomo-info.html
>=20
>=20
>=20
>
--8323328-508108714-1328198703=:1928--
