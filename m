From: Michael =?UTF-8?B?QsO8c2No?= <m@bues.ch>
Date: Mon, 09 Sep 2019 17:53:12 +0000
Subject: Re: [PATCH] ssb: make array pwr_info_offset static const, makes object smaller
Message-Id: <20190909195312.1873c0f7@wiggum>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/Gh5rJFI_YvQsdaAQbg3kPxs"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906154053.32218-1-colin.king@canonical.com>
In-Reply-To: <20190906154053.32218-1-colin.king@canonical.com>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Colin King <colin.king@canonical.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/Gh5rJFI_YvQsdaAQbg3kPxs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  6 Sep 2019 16:40:53 +0100
Colin King <colin.king@canonical.com> wrote:

> diff --git a/drivers/ssb/pci.c b/drivers/ssb/pci.c
> index da2d2ab8104d..7c3ae52f2b15 100644
> --- a/drivers/ssb/pci.c
> +++ b/drivers/ssb/pci.c
> @@ -595,7 +595,7 @@ static void sprom_extract_r8(struct ssb_sprom *out, c=
onst u16 *in)
>  {
>  	int i;
>  	u16 o;
> -	u16 pwr_info_offset[] =3D {
> +	static const u16 pwr_info_offset[] =3D {
>  		SSB_SROM8_PWR_INFO_CORE0, SSB_SROM8_PWR_INFO_CORE1,
>  		SSB_SROM8_PWR_INFO_CORE2, SSB_SROM8_PWR_INFO_CORE3
>  	};

Thanks for your contribution. This change makes sense.

Kalle, can you please take it?

Acked-by: Michael B=C3=BCsch <m@bues.ch>

--=20
Michael

--Sig_/Gh5rJFI_YvQsdaAQbg3kPxs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAl12kYgACgkQ9TK+HZCN
iw4dkg//RkZq55Col2WsmizgjsdDYipwL9loeVjtw64YjtT2ZVcwSzQfooPf253D
BKLbB6AbBNc3oniPuicHJZGxNX5ppfO6teIcHvzd1gtlNIDyRRU+dFA4DoqskKlK
9n7JWAWmXxLhpw8121mQmtV5MYbHJRR6fhemrDJPtKRwJLfcZSLF5ENUu3VCifw2
/G5PqA7Lsu7llxd6Cl5uz3fD4wX3o9LRaVsF/QZvmGoV6FdqUgf/cRGXtOGYzCQ4
2DVxrykaS8VTWqvbJQ1LIlDv1u2cGxIWlvAlI3t40CCR6md914C9abWj+o48wDPd
DE/kCQeJy6uHqcc3yYTp888a4tnWnsAovNySHNwefvRCbcU3q5fKbluX5Zth9r1u
6JqQoAglH3wNUaUJ1nXuASWz9l7J9IkJakzHZzzxy1cQ5uvZXeP5T1FPbrlKOSJX
cvICP9T79dtDR9XmjRd5jKLpXCHNO0ZVgo6PfxoRJtxD60cwLtKMKlNjP+9Hto23
sKnQ6wuEhIluxun1x4pb73+8WLzL8f9u9nlh/HVSvnh39QlarMUMAbWXAH/J182J
O/65KfRCcUkoBxMIvwtnCckj08NmrHrS5DVIp2YaMbzjlLpKvFSCxf+65pB2CREt
EeG3/vOb9ElEjrJdWXy+BB4rOCLoxk4Ks07DZXbrq0FJPjg5DbI=
=/ENb
-----END PGP SIGNATURE-----

--Sig_/Gh5rJFI_YvQsdaAQbg3kPxs--
