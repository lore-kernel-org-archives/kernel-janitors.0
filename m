From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 04 Jul 2018 14:49:47 +0000
Subject: Re: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180704144947.GB30037@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
In-Reply-To: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:55:41PM +0200, H=C3=A5kon Bugge wrote:
>    Is:
>=20
>    if (ret < (int)nents) {
>=20
>    a more intuitive fix?

That could lead to truncation/force negativeness of nents :(

I wonder how many bugs like this we have.

Jason
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
