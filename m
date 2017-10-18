From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Wed, 18 Oct 2017 17:13:09 +0000
Subject: Re: [PATCH 0/4] char-TPM: Adjustments for ten function implementations
Message-Id: <20171018171309.f7idf76ccvofpnpk@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d3516a2-a8e6-9e95-d438-f115fac84c7f@users.sourceforge.net>
 <20171016183139.otyh3m5c5yurtmow@linux.intel.com>
 <20171016183512.3bz6x4b6lbhpbkje@linux.intel.com>
 <20171017085124.pkrjzghcf5wmcydc@mwanda>
 <f9b35a67-bd7f-b140-bdc1-cb4886a6b1ea@users.sourceforge.net>
 <1508255833.3129.33.camel@HansenPartnership.com>
 <20171018151010.r4ojcpzs5l7rpt6r@linux.intel.com>
 <1508342988.3958.5.camel@HansenPartnership.com>
In-Reply-To: <1508342988.3958.5.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Dan Carpenter <dan.carpenter@oracle.com>, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Kenneth Goldman <kgold@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nayna Jain <nayna@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Peter =?iso-8859-1?Q?H=FCwe?= <PeterHuewe@gmx.de>, Stefan Berger <stefanb@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Oct 18, 2017 at 09:09:48AM -0700, James Bottomley wrote:
> On Wed, 2017-10-18 at 18:10 +0300, Jarkko Sakkinen wrote:
> > On Tue, Oct 17, 2017 at 08:57:13AM -0700, James Bottomley wrote:
> > >=20
> > > On Tue, 2017-10-17 at 11:25 +0200, SF Markus Elfring wrote:
> > > >=20
> > > > >=20
> > > > >=20
> > > > > Fixes is only for bug fixes.=A0=A0These don't fix any bugs.
> > > >=20
> > > > How do you distinguish these in questionable source code
> > > > from other error categories or software weaknesses?
> > >=20
> > > A style change is one that doesn't change the effect of the
> > > execution.
> > > =A0These don't actually even change the assembly, so there's
> > > programmatic
> > > proof they're not fixing anything.
> > >=20
> > > Bug means potentially user visible fault. =A0In any bug fix commit
> > > you
> > > should document the fault and its effects on users so those
> > > backporting
> > > can decide if they care or not.
> > >=20
> > > James
> >=20
> > OK, I'll adjust my definition of a bug :-)
>=20
> Subsystems are free to define bugs in any reasonable way. =A0However,
> there are two things to note here:
>=20
>    1. The style guide is just that, a guide; it's not hard and fast rules.
>       =A0That means that violations aren't bugs in the usual sense.
>       =A0However, new code should mostly follow it and if it doesn't, the=
re
>       should be a good reason to go against the guide which should be
>       explained in the change log.
>    2. The coding style evolves, so older drivers usually don't conform.
>       =A0Classifying coding style issues as bugs leads to tons of patches
>       "fixing" older drivers, some of which actually end up breaking the
>       drivers in subtle ways which take ages to be found (at least that's
>       what we've seen in SCSI).
>=20
> James

Makes sense. Thanks for verbose explanation.

/Jarkko
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
