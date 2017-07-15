From: Mark D Rustad <mrustad@gmail.com>
Date: Sat, 15 Jul 2017 20:52:35 +0000
Subject: Re: [PATCH 06/11] irqchip: mips-cpu: Drop unnecessary static
Message-Id: <83D70E98-A5D4-48E5-9397-25826083E2A8@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_5DA96EC5-7543-4E4F-8BD2-990F2A42EC34"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-7-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, keescook@chromium.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org


--Apple-Mail=_5DA96EC5-7543-4E4F-8BD2-990F2A42EC34
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 15, 2017, at 1:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> =
wrote:
>=20
> Drop static on a local variable, when the variable is initialized =
before
> any possible use.  Thus, the static has no benefit.

I think this is in error like the other one. I believe that the irq_chip =
structure needs a persistent lifetime.

> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> static T x@p;
> ...
> x =3D <+...x...+>
>=20
> @@
> identifier x;
> expression e;
> type T;
> position p !=3D bad.p;
> @@
> -static
> T x@p;
> ... when !=3D x
>     when strict
> ?x =3D e;
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
> These patches are all independent of each other.
>=20
> drivers/irqchip/irq-mips-cpu.c |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -u -p a/drivers/irqchip/irq-mips-cpu.c =
b/drivers/irqchip/irq-mips-cpu.c
> --- a/drivers/irqchip/irq-mips-cpu.c
> +++ b/drivers/irqchip/irq-mips-cpu.c
> @@ -154,7 +154,7 @@ asmlinkage void __weak plat_irq_dispatch
> static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
> 			     irq_hw_number_t hw)
> {
> -	static struct irq_chip *chip;
> +	struct irq_chip *chip;
>=20
> 	if (hw < 2 && cpu_has_mipsmt) {
> 		/* Software interrupts are used for MT/CMT IPI */
>=20

--
Mark Rustad, MRustad@gmail.com


--Apple-Mail=_5DA96EC5-7543-4E4F-8BD2-990F2A42EC34
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIcBAEBCAAGBQJZaoCTAAoJEDwO/+eO4+5uXXMP/2v73RG4+X9Sa3bQ4U4wxS0K
7Jhjf0HdmV+keXakDsgsOkAVCaF9kqTmLvOyd5nLr39LrsbMovYbqYSJAo2gogK1
2mBWBL26nsYH+WqQuiPYwmCPkFDzUQSvaeuoTnzqUgUi+fBTaDT+b+pU/LhXkD8J
6nXG68Mf1bQOalI5Jf3/joU/eDQkgECCNXk/AKl4hfnh4c92IMXYR12+Ll/IavEV
M9RG0AEC8tecWQHOdrky3iA4yCULaetI74jXKCKYuYzpcS5esrC/qw4KWyQVIxdG
9v1aE02opbEKABSXdxVPPr4srh0ceYjZ9F0pCEGjVkUb0gW8C3SpeeIvbLxIFULf
YlypiWLOTee4iJYtDoMV1GG4nYpD2NF5c1J59rFc0gldCJzDzR/rOSabrceGKh/B
BlAayje4hjGpicsXbX9oQNWwvgIekIECp7jMsFxolGkNFuey99KWv768G6dJ1bzi
LnYN2AM28IYl211ooOFKvHthHbTOGJ6PkWLUeJyZW7s9FhXgN7Jwh3pm/ywNcYTl
uLYyr95vWthi96zz5UnkFSBVw5c1zYxks1DXSwd0T6ULVvAn1y2zznZpLHrQ2QNt
yHYTfUDPwE6fAmvaAVPGuiYPaTje0+7O+//s3tUno240XIMsFgRuEFEN2NZobjKR
eYfwbFAR2dMK933OMES/
=Xll9
-----END PGP SIGNATURE-----

--Apple-Mail=_5DA96EC5-7543-4E4F-8BD2-990F2A42EC34--
