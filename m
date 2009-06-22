From: Peter Huewe <PeterHuewe@gmx.de>
Date: Mon, 22 Jun 2009 22:00:51 +0000
Subject: Re: [PATCH] mtd: adding __init/__exit macros to init/exitfunctions of mtd drivers
Message-Id: <200906230000.51917.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200906110223.33397.PeterHuewe@gmx.de>
In-Reply-To: <200906110223.33397.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Am Freitag 12 Juni 2009 11:03:19 schrieb Jiri Kosina:
> [ CCing dmmw2 -- please either Ack the patch so that I can take it through
>   trivial tree, or take it through your tree. Thanks.
>
> On Thu, 11 Jun 2009, Peter H=C3=BCwe wrote:
> > From: Peter Huewe <peterhuewe@gmx.de>
> >
> > Trivial patch which adds the __init and __exit macros to the module_init
> > / module_exit functions to the following modules from drivers/mtd/
> > devices/m25p80.c
> >  devices/slram.c
> >  linux version 2.6.30
> >  ftl.c
> >  nand/cafe_nand.c
> >  nand/cmx270_nand.c
> >
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Hi,
@ dwmw2: can you please have a look at the trivial patch and if there is no=
=20
problem with it ack it so Jiri can take it through the trivial tree or even=
=20
better you take it through one of yours?
Would be very kind of you.

Thanks,
Peter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
