From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 17:07:36 +0000
Subject: Re: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180704170735.hzl2zxx2njv73vik@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
In-Reply-To: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 07:27:43PM +0300, Leon Romanovsky wrote:
> On Wed, Jul 04, 2018 at 08:49:47AM -0600, Jason Gunthorpe wrote:
> > On Wed, Jul 04, 2018 at 12:55:41PM +0200, H=E5kon Bugge wrote:
> > >    Is:
> > >
> > >    if (ret < (int)nents) {
> > >
> > >    a more intuitive fix?
> >
> > That could lead to truncation/force negativeness of nents :(
>=20
> IS_ERROR_VALUE() from include/linux/err.h?
>=20

Heh.  Please, no.  First of all that doesn't work, but also that's not
how IS_ERROR_VALUE() is supposed to be used.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
