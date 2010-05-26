From: Marek Vasut <marek.vasut@gmail.com>
Date: Wed, 26 May 2010 17:07:06 +0000
Subject: Re: [PATCH 7/17] arch/arm/common: Add missing spin_unlock_irqrestore
Message-Id: <201005261907.06198.marek.vasut@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261756000.23743@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005261756000.23743@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Dne St 26. kv=C4=9Btna 2010 17:56:14 Julia Lawall napsal(a):
> From: Julia Lawall <julia@diku.dk>
>=20
> Add a spin_unlock_irqrestore missing on the error path.  Although the lock
> is destroyed with the rest of the sachip structure in the function
> __sa1111_remove, it still seems useful to restore the interrupt state.
>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression E1;
> @@
>=20
> * spin_lock_irqsave(E1,...);
>   <+... when !=3D E1
>   if (...) {
>     ... when !=3D E1
> *   return ...;
>   }
>   ...+>
> * spin_unlock_irqrestore(E1,...);
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>
>=20
> ---
> Perhaps the unlock is now too early?
>=20
>  arch/arm/common/sa1111.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/common/sa1111.c b/arch/arm/common/sa1111.c
> index a52a27c..59e38ff 100644
> --- a/arch/arm/common/sa1111.c
> +++ b/arch/arm/common/sa1111.c
> @@ -959,6 +959,7 @@ static int sa1111_resume(struct platform_device *dev)
>  	 */
>  	id =3D sa1111_readl(sachip->base + SA1111_SKID);
>  	if ((id & SKID_ID_MASK) !=3D SKID_SA1111_ID) {
> +		spin_unlock_irqrestore(&sachip->lock, flags);
>  		__sa1111_remove(sachip);
>  		platform_set_drvdata(dev, NULL);
>  		kfree(save);

Why are "readl"s protected by spinlock anyway ? Can't we just move the lock=
ing=20
past the code above ?

I'm no sa1111 expert though, Russell ?

Cheers
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
