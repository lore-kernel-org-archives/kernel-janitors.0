From: Mark D Rustad <mrustad@gmail.com>
Date: Sun, 16 Jul 2017 06:04:45 +0000
Subject: Re: [PATCH 06/11] irqchip: mips-cpu: Drop unnecessary static
Message-Id: <625139C1-2C64-4BC1-B36E-D8BFBCD179A3@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail=_127AE37B-4A5B-487C-89B5-D856C1C53D91"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-7-git-send-email-Julia.Lawall@lip6.fr>
 <83D70E98-A5D4-48E5-9397-25826083E2A8@gmail.com>
 <alpine.DEB.2.20.1707152258060.5105@hadrien>
In-Reply-To: <alpine.DEB.2.20.1707152258060.5105@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, keescook@chromium.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org


--Apple-Mail=_127AE37B-4A5B-487C-89B5-D856C1C53D91
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

> On Jul 15, 2017, at 1:59 PM, Julia Lawall <julia.lawall@lip6.fr> =
wrote:
>=20
> On Sat, 15 Jul 2017, Mark D Rustad wrote:
>=20
>>=20
>>> On Jul 15, 2017, at 1:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> =
wrote:
>>>=20
>>> Drop static on a local variable, when the variable is initialized =
before
>>> any possible use.  Thus, the static has no benefit.
>>=20
>> I think this is in error like the other one. I believe that the =
irq_chip structure needs a persistent lifetime.
>=20
> I'm not following in this case.  chip is a pointer to a structure, not =
a
> structure.  Its address is not taken.  irq_set_chip_and_handler that =
uses
> it below is a fnuction, so it just gets the value.
>=20
> julia

Sorry. My mistake. I didn't look quite hard enough at this one.

>>=20
>>> The semantic patch that fixes this problem is as follows:
>>> (http://coccinelle.lip6.fr/)
>>>=20
>>> // <smpl>
>>> @bad exists@
>>> position p;
>>> identifier x;
>>> type T;
>>> @@
>>> static T x@p;
>>> ...
>>> x =3D <+...x...+>
>>>=20
>>> @@
>>> identifier x;
>>> expression e;
>>> type T;
>>> position p !=3D bad.p;
>>> @@
>>> -static
>>> T x@p;
>>> ... when !=3D x
>>>    when strict
>>> ?x =3D e;
>>> // </smpl>
>>>=20
>>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>>=20
>>> ---
>>> These patches are all independent of each other.
>>>=20
>>> drivers/irqchip/irq-mips-cpu.c |    2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff -u -p a/drivers/irqchip/irq-mips-cpu.c =
b/drivers/irqchip/irq-mips-cpu.c
>>> --- a/drivers/irqchip/irq-mips-cpu.c
>>> +++ b/drivers/irqchip/irq-mips-cpu.c
>>> @@ -154,7 +154,7 @@ asmlinkage void __weak plat_irq_dispatch
>>> static int mips_cpu_intc_map(struct irq_domain *d, unsigned int irq,
>>> 			     irq_hw_number_t hw)
>>> {
>>> -	static struct irq_chip *chip;
>>> +	struct irq_chip *chip;
>>>=20
>>> 	if (hw < 2 && cpu_has_mipsmt) {
>>> 		/* Software interrupts are used for MT/CMT IPI */
>>>=20
>>=20
>> --
>> Mark Rustad, MRustad@gmail.com

--
Mark Rustad, MRustad@gmail.com


--Apple-Mail=_127AE37B-4A5B-487C-89B5-D856C1C53D91
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIcBAEBCAAGBQJZawIBAAoJEDwO/+eO4+5u0/YP/A0l0FM1iSGBHB0WlzC+9NvO
FFlhcwzSnOn3eUwmhVD+YaOvhX3TObS0EQxZRNzIeA1pv7z+XuCgJXdzXHaa3DL3
S9hJnl/wTB0wEef7Kv5iomVbOYT6msK4M4rgkYqXLf5LCdgQuGN8XmYZ3f30XE5G
+7YEq8KBgujKKwQA7TF8e/cJX5AUMY/BFgsSSOpMkYmKnlzCjAvGr+xPriV/lv44
N03VfNXnbVsa0LTN0fD6cnb/20/fswcHE0bj954R/bUqvd6nVcfWWZup+mDaxVd+
wpOk8dL1S5zYayFW0nRhc3CdGs1RiZdnbKjf/Dd4IrZGu2KEC9jbdncozzVfkAdY
/a5dEk6ElUmfq8OEA5SfoiyQG//k/mDi0orT0+bnJbl0eTJ9rNF+tJ4+1nlSJx6p
78CWen6GrA/AaV+mokLdjwMkJtMlsizMd/zdMJRrsC/EHYd/LuAazqig+nwZHXC7
VsE0k71KnZUUH3LbdVwgvZ8m2oTcyPQoopqa8/Ka4vnKnIWSxX3LGQ6hD8VhPJ2n
3r/pgrvn35uRqfIVrqCKsOenUP6/Wws9/3dTdsij8J8deblRLoWErkjSKvunvKGW
tdnE7/5PFgDKiVgiIJgKITOl1Lmes7qho2wbThEvpDvYJAoB1L8b7Q465FRzC3Bl
cLgF0bhOfg3LKsLqesHA
=D2cL
-----END PGP SIGNATURE-----

--Apple-Mail=_127AE37B-4A5B-487C-89B5-D856C1C53D91--
