From: Baolin Wang <baolin.wang@linux.alibaba.com>
Date: Tue, 02 Jun 2020 01:50:44 +0000
Subject: Re: [PATCH] iommu: Improve exception handling in iommu_group_alloc()
Message-Id: <20200602015044.GA89266@VM20190228-100.tbsite.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
In-Reply-To: <9f8d8308-2056-8e33-7b38-0b7d96e51c3c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org

On Mon, Jun 01, 2020 at 02:38:05PM +0200, Markus Elfring wrote:
> > Optimize the error handling to free the resources correctly when
> > failed to allocate an iommu group.
>=20
> * I would not categorise the desired completion of exception handling
>   as a software optimisation.
>=20
> * Would you like to add the tag =A1=B0Fixes=A1=B1 to the commit message?

Sure.

>=20
> * I suggest to avoid the specification of duplicate function calls.
>   Will it be helpful to add a few jump targets?
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/coding-style.rst?id=3D77e6a8804abcc0504c904bd6e5cdf3=
a5cf8162#n455

I don't think it is helpful or readable to add some jump targets here, sinc=
e the exception handling is very simple here.
