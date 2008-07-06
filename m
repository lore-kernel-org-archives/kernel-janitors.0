From: Jaswinder Singh <jaswinder@infradead.org>
Date: Sun, 06 Jul 2008 15:25:44 +0000
Subject: Re: [PATCH] dsp56k: use request_firmware
Message-Id: <1215357224.2817.2.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215253496.7816.7.camel@jaswinder.satnam>
	 <A3D470E0-953E-40D6-BF5A-D06B76451154@nocrew.org>
In-Reply-To: <A3D470E0-953E-40D6-BF5A-D06B76451154@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Fredrik Noring <noring@nocrew.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, lars@nocrew.org, tomas@nocrew.org

Hello =EF=BB=BFFredrik,

On Sun, 2008-07-06 at 15:36 +0200, Fredrik Noring wrote:
> Hi Jaswinder,
>=20
> 5 jul 2008 kl. 12.24 skrev Jaswinder Singh:
> > +	for (i =3D 0; i < fw->size; i + 3) {
>=20
> Are you sure about "i + 3" in this loop? Isn't GCC complaining, =20
> something like "statement with no effect"?
>=20

Fixed, Thanks.

> > +Driver: ATARI_DSP56K - Atari DSP56k support
> > +
> > +File: dsp56k/bootstap.bin
> > +
> > +Licence: Unknown
> > +
> > +Found in hex form in kernel source.
>=20
> I wrote this DSP56k assembler code in 1995. It's a trivial copy loop =20
> that loads the main DSP program into memory. Please consider it GPL =20
> like the driver code it came from.
>=20
> A disassembler would easily recreate the original ~50 lines of =20
> assembler source code, in case you'd like to assemble it with the rest =20
> of kernel. :)
>=20

Fixed.

Updated patch :
http://git.infradead.org/users/jaswinder/firm-jsr-2.6.git?a=3Dcommitdiff;hO=
5b8828113ea857a7b590b7dbb8a5ee78103de4

Thanks for you comments.

Thank you,

Jaswinder Singh.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
