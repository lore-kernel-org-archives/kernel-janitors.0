From: Joe Perches <joe@perches.com>
Date: Sat, 13 Aug 2016 17:31:18 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <1471109478.3467.33.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
	 <530A086E.8010901@users.sourceforge.net>
	 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
	 <530A72AA.3000601@users.sourceforge.net>
	 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
	 <530B5FB6.6010207@users.sourceforge.net>
	 <alpine.DEB.2.10.1402241710370.2074@hadrien>
	 <530C5E18.1020800@users.sourceforge.net>
	 <alpine.DEB.2.10.1402251014170.2080@hadrien>
	 <530CD2C4.4050903@users.sourceforge.net>
	 <alpine.DEB.2.10.1402251840450.7035@hadrien>
	 <530CF8FF.8080600@users.sourceforge.net>
	 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	 <530DD06F.4090703@users.sourceforge.net>
	 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	 <5317A59D.4@users.sourceforge.net>
	 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
	 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
	 <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
	 <1471031030.18251.18.camel@perches.com>
	 <a6b96b51-a602-f22d-b853-0ee2f142fb67@users.sourceforge.net>
In-Reply-To: <a6b96b51-a602-f22d-b853-0ee2f142fb67@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

On Sat, 2016-08-13 at 13:10 +0200, SF Markus Elfring wrote:
> > > Prefer usage of the macro "pr_err" over the interface "printk".
> > Not correct
> A checkpatch warning like "PREFER_PR_LEVEL" can point additional possibil=
ities out
> for this use case.
> Would you like to introduce any of the higher level logging functions ins=
tead?

I think pr_<level> is OK if reworking the code
to support dev_<level> is not easy.

> > > diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/k=
s7010/ks7010_sdio.c
> > []
> > >=20
> > > @@ -998,11 +998,11 @@ static int ks7010_sdio_probe(struct sdio_func *=
func,
> > > =A0	/* private memory allocate */
> > > =A0	netdev =3D alloc_etherdev(sizeof(*priv));
> > > =A0	if (netdev =3D NULL) {
> > > -		printk(KERN_ERR "ks7010 : Unable to alloc new net device\n");
> > > +		pr_err(pr_fmt("Unable to alloc new net device\n"));
> > All of these pr_fmt uses are redundant as pr_err already does pr_fmt
> Thanks for your reminder.
>=20
> Would you accept that another update will be appended to the discussed pa=
tch series?

No. =A0Patches should not knowingly introduce defects
that are corrected in follow-on patches.

> > alloc_etherdev already does a dump_stack so the OOM isn't useful.
> Does this information indicate that this printk() (or pr_err()) call
> should be deleted?

Markus, I don't know if it's your lack of English
comprehension or not, but it's fairly obvious from
my reply that this line should be deleted, either
in this patch or a follow-on.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
