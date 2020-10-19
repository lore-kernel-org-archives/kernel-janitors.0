From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Mon, 19 Oct 2020 09:43:36 +0000
Subject: Re: [PATCH] staging: wfx: make a const array static, makes object smaller
Message-Id: <1800171.ETUgnxhFMb@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201016223303.687278-1-colin.king@canonical.com>
 <09cd7e609324d460afdf14829baf3c2f1a9cb9cd.camel@perches.com>
 <048fded745634e369fa2646f87a05ec4@AcuMS.aculab.com>
In-Reply-To: <048fded745634e369fa2646f87a05ec4@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: 'Joe Perches' <joe@perches.com>, Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, David Laight <David.Laight@aculab.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Monday 19 October 2020 10:09:19 CEST David Laight wrote:
> From: Joe Perches
> > Sent: 17 October 2020 01:12
> >
> > On Fri, 2020-10-16 at 23:33 +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > Don't populate const array filter_ies on the stack but instead
> > > make it static. Makes the object code smaller by 261 bytes.
> > >
> > > Before:
> > >    text        data     bss     dec     hex filename
> > >   21674        3166     448   25288    62c8 drivers/staging/wfx/sta.o
> > >
> > > After:
> > >    text        data     bss     dec     hex filename
> > >   21349        3230     448   25027    61c3 drivers/staging/wfx/sta.o
> >
> > Thanks.
> >
> > It's odd to me it's so large a change as it's only
> > 24 bytes of initialization. (3 entries, each 8 bytes)
>=20
> Perhaps the 'stack protector' crap?
>=20
> Interestingly, loading the data from the 'readonly' section
> is probably a data cache miss.
> Which might end up being slower than the extra code to
> update the on-stack data.
> The extra code might get prefetched...

I had never realized the difference between "const" and "static const" in
this case.

With my gcc fro arm, the output of "objdump -h sta.o" gives:

Before:
  0 .text         000019fc  00000000  00000000  00000034  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  [...]
  7 .rodata       00000015  00000000  00000000  00001e78  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA

After:
  0 .text         00001974  00000000  00000000  00000034  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  [...]
  7 .rodata       0000002d  00000000  00000000  00001dd4  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA

The difference of .rodata is exactly what is expected (24 bytes) and we
save 115 bytes of code.

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>


--=20
J=E9r=F4me Pouiller
