From: James Hogan <jhogan@kernel.org>
Date: Fri, 11 May 2018 12:47:53 +0000
Subject: Re: [PATCH] MIPS: VPE: fix spelling mistake: "uneeded" -> "unneeded"
Message-Id: <20180511124752.GA9014@jamesdev>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510165900.13733-1-colin.king@canonical.com>
In-Reply-To: <20180510165900.13733-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2018 at 05:59:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Trivial fix to spelling mistake in pr_warn message text
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

> -		pr_warn("VPE loader: elf size too big. Perhaps strip uneeded symbols\n=
");
> +		pr_warn("VPE loader: elf size too big. Perhaps strip unneeded symbols\=
n");

Applied for 4.18

thanks
James

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS7lRNBWUYtqfDOVL41zuSGKxAj8gUCWvWQ9wAKCRA1zuSGKxAj
8hZHAPwOzorxqzdhC0mAmwifelQKD5g4nHGCxd6ieKGXdNWW+wEAwuNvsZ5g325T
Soc3Jo1u4U5SIZr1VuYiu/RHB85Vegw=
=kRJ6
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
