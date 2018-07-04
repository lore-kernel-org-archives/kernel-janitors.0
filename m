From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 04 Jul 2018 18:05:18 +0000
Subject: Re: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180704180518.GD30037@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
In-Reply-To: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 08:01:57PM +0300, Dan Carpenter wrote:
> On Wed, Jul 04, 2018 at 08:49:47AM -0600, Jason Gunthorpe wrote:
> > On Wed, Jul 04, 2018 at 12:55:41PM +0200, H=C3=A5kon Bugge wrote:
> > >    Is:
> > >=20
> > >    if (ret < (int)nents) {
> > >=20
> > >    a more intuitive fix?
> >=20
> > That could lead to truncation/force negativeness of nents :(
> >=20
>=20
> In this case, if nents is over INT_MAX we're already toasted.

Ugh, yes, functions accepting int for unsigned values is any
alarmingly common mistake too.

> > I wonder how many bugs like this we have.
>=20
> This is a static checker fix, so Julia fixed 3 and I fixed 6...

Leon found another case of implicit casting creating a user space
triggerable bug last week..

Jason
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
