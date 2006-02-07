From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Tue, 07 Feb 2006 23:24:10 +0000
Subject: Re: [KJ] [Patch] BUG_ON() Conversion in drivers/net/
Message-Id: <a01a16b50602071524p7efe3c66xec75affa44f63d2b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/7/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> --- linux-2.6.16-rc2-git2/drivers/net/b44.c.orig        2006-02-07 21:46:=
01.000000000 +0100
> +++ linux-2.6.16-rc2-git2/drivers/net/b44.c     2006-02-07 21:46:11.00000=
0000 +0100
> @@ -608,8 +608,7 @@ static void b44_tx(struct b44 *bp)
>                 struct ring_info *rp =3D &bp->tx_buffers[cons];
>                 struct sk_buff *skb =3D rp->skb;
>
> -               if (unlikely(skb =3D NULL))
> -                       BUG();
> +               BUG_ON(unlikely(skb =3D NULL);
>
>                 pci_unmap_single(bp->pdev,
>                                  pci_unmap_addr(rp, mapping),

I think unlikely can be removed here.

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
