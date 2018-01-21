From: Joe Perches <joe@perches.com>
Date: Sun, 21 Jan 2018 01:37:52 +0000
Subject: Re: [PATCH] Intel-IOMMU: Delete an error message for a failed memory allocation in init_dmars()
Message-Id: <1516498672.24895.2.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <def26d40-37d3-d594-e17c-53e40a3034b7@users.sourceforge.net>
         <20180120133452.GB28161@8bytes.org>
         <6b452dfb-b2fc-2417-26b3-bbcdf11ed06f@users.sourceforge.net>
         <20180120194004.GC28161@8bytes.org>
In-Reply-To: <20180120194004.GC28161@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 2018-01-20 at 20:40 +0100, J=F6rg R=F6del wrote:
> On Sat, Jan 20, 2018 at 03:55:37PM +0100, SF Markus Elfring wrote:
> > Do you need any more background information for this general
> > transformation pattern?
>=20
> No.
>=20
> > Do you find the Linux allocation failure report insufficient for this
> > use case?
>=20
> Yes, because it can't tell me what the code was trying to allocate.

While Markus' commit messages are nearly universally terrible,
is there really any signficant value in knowing when any
particular OOM condition occurs other than the subsystem that
became OOM?

You're going to be hosed in any case.

Why isn't the generic OOM stack dump good enough?
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
