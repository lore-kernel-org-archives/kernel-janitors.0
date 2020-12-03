From: Joe Perches <joe@perches.com>
Date: Thu, 03 Dec 2020 19:04:11 +0000
Subject: Re: [RFC PATCH] checkpatch: correctly detect lines of help text
Message-Id: <40543766190a1d5e054e6573ae00112467acf964.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <133ac827-c0d2-c5c7-39d8-7d2c17de7c76@fau.de>
 <8436bc4191d92af283ea6aa7ca450e36da653e2e.camel@perches.com>
 <16f0bfd4-61ca-48d8-c9ab-10bfc9a233ad@infradead.org>
 <a83033e9fcc706be129e9c4c0d30a0542f13d406.camel@perches.com>
 <7a81a3c0-2734-4799-5b34-0a6279c1e59d@infradead.org>
In-Reply-To: <7a81a3c0-2734-4799-5b34-0a6279c1e59d@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Randy Dunlap <rdunlap@infradead.org>, Nicolai Fischer <nicolai.fischer@fau.de>, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Cc: apw@canonical.com, johannes.czekay@fau.de, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@i4.cs.fau.de

On Thu, 2020-12-03 at 10:31 -0800, Randy Dunlap wrote:
> On 12/3/20 9:58 AM, Joe Perches wrote:
> > On Wed, 2020-12-02 at 10:59 -0800, Randy Dunlap wrote:
> >=20
> > > There are also large hunks of block/Kconfig and drivers/hid/Kconfig
> > > that don't use any indentation for help text...
> > > in case that matters here.
> >=20
> > Maybe something like this could help.
> >=20
> > Indent the unindented help blocks by 2 spaces and reflow where appropri=
ate.
> >=20
> > ---
> > =A0block/Kconfig       | 105 +++++-----
> > =A0drivers/hid/Kconfig | 549 +++++++++++++++++++++++++++---------------=
----------
> > =A02 files changed, 335 insertions(+), 319 deletions(-)
>=20
>=20
> LGTM. Thanks.

btw: there appears to be ~750 help sections in Kconfig files
that do not use 2 space indentation for the help content vs
the ~14000 help sections that do use 2 space indentation.

Maybe there's some value in standardizing on the 2 space style.

A trivial script to show the sections that don't use 2 spaces:

$ git grep -n -A1 -P "^\s*help\s*$" -- '*/Kconfig*' |
  grep -v '^--$' |
  perl -e 'while (<>) {
    my $line1 =3D $_;
    my $line2 =3D <>;

    my $l1 =3D $line1;
    my $l2 =3D $line2;

    chomp($l1);
    chomp($l2);

    $l1 =3D~ s/^.*:\d+:(\s*).*/$1/;
    $l2 =3D~ s/^.*-\d+-(\s*).*/$1/;

    if ("$l1  " ne "$l2") {
	print "$line1";
	print "$line2";
    }
}'

Change the ne to eq to see the matches.

For instance, a head -50 of the above is:

arch/Kconfig:84:	help
arch/Kconfig-85-	 This option enables a transparent branch optimization that
arch/Kconfig:127:	help
arch/Kconfig-128-	 If function tracer is enabled and the arch supports full
arch/Kconfig:167:	help
arch/Kconfig-168-	 Modern versions of GCC (since 4.4) have builtin functions
arch/Kconfig:1056:       help
arch/Kconfig-1057-          An architecture should select this if its sysca=
ll numbering is sparse
arch/alpha/Kconfig:147:	help
arch/alpha/Kconfig-148-	  XL-233 and XL-266-based Alpha systems.
arch/arm/Kconfig:1001:       help
arch/arm/Kconfig-1002-	 This option enables the workaround for the 775420 C=
ortex-A9 (r2p2,
arch/arm/Kconfig-nommu:9:	help
arch/arm/Kconfig-nommu-10-	 Say Y to manually set the base addresses and si=
zes.
arch/arm/Kconfig.debug:24:	help
arch/arm/Kconfig.debug-25-		Generate a warning if any W+X mappings are foun=
d at boot.
arch/arm/mach-aspeed/Kconfig:21:	help
arch/arm/mach-aspeed/Kconfig-22-	 Say yes if you intend to run on an Aspeed=
 ast2400 or similar
arch/arm/mach-aspeed/Kconfig:31:	help
arch/arm/mach-aspeed/Kconfig-32-	 Say yes if you intend to run on an Aspeed=
 ast2500 or similar
arch/arm/mach-aspeed/Kconfig:42:	help
arch/arm/mach-aspeed/Kconfig-43-	 Say yes if you intend to run on an Aspeed=
 ast2600 or similar
arch/arm/mach-imx/Kconfig:230:	help
arch/arm/mach-imx/Kconfig-231-		This enables support for Freescale i.MX7 Du=
al processor.
arch/arm/mach-ixp4xx/Kconfig:41:    help
arch/arm/mach-ixp4xx/Kconfig-42-	  Say 'Y' here if you want your kernel to =
support the Giant
arch/arm/mach-ixp4xx/Kconfig:178:	help
arch/arm/mach-ixp4xx/Kconfig-179-		This board is currently inside the Links=
ys WRV54G Gateways.
arch/arm/mach-ixp4xx/Kconfig:216:	help
arch/arm/mach-ixp4xx/Kconfig-217-          IXP4xx provides two methods of a=
ccessing PCI memory space:
arch/arm/mach-omap1/Kconfig:61:	help
arch/arm/mach-omap1/Kconfig-62-          TI OMAP 1510 or 1610 Innovator boa=
rd support. Say Y here if you
arch/arm/mach-omap1/Kconfig:68:    	help
arch/arm/mach-omap1/Kconfig-69-	  TI OMAP 1610/1611B H2 board support. Say =
Y here if you have such
arch/arm/mach-omap1/Kconfig:75:    	help
arch/arm/mach-omap1/Kconfig-76-	  TI OMAP 1710 H3 board support. Say Y here=
 if you have such
arch/arm/mach-omap1/Kconfig:88:    	help
arch/arm/mach-omap1/Kconfig-89-	  TI OMAP 5912 OSK (OMAP Starter Kit) board=
 support. Say Y here
arch/arm/mach-omap1/Kconfig:95:    	help
arch/arm/mach-omap1/Kconfig-96-	  The OSK supports an optional add-on board=
 with a Quarter-VGA
arch/arm/mach-omap1/Kconfig:103:    	help
arch/arm/mach-omap1/Kconfig-104-	  Support for TI OMAP 730 Perseus2 board. =
Say Y here if you have such
arch/arm/mach-omap1/Kconfig:110:    	help
arch/arm/mach-omap1/Kconfig-111-	  Support for TI OMAP 850 F-Sample board. =
Say Y here if you have such
arch/arm/mach-omap1/Kconfig:126:	help
arch/arm/mach-omap1/Kconfig-127-	 Support for the Palm Zire71 PDA. To boot =
the kernel,
arch/arm/mach-omap1/Kconfig:175:	help
arch/arm/mach-omap1/Kconfig-176-          Support for generic OMAP-1510, 16=
10 or 1710 board with
arch/arm/mach-prima2/Kconfig:24:	help
arch/arm/mach-prima2/Kconfig-25-          Support for CSR SiRFSoC ARM Corte=
x A9 Platform
