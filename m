From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 22 May 2017 09:37:02 +0000
Subject: Re: [PATCH 1/2] vhost/scsi: Improve a size determination in four functions
Message-Id: <20170522093702.GD12205@stefanha-x1.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sgneBHv3152wZ8jf"
List-Id: <kernel-janitors.vger.kernel.org>
References: <bafa65e4-08fe-efdb-d836-7657e8a64749@users.sourceforge.net>
	<68e78c4b-9b18-7607-f8c8-327fdd51f20b@users.sourceforge.net>
In-Reply-To: <68e78c4b-9b18-7607-f8c8-327fdd51f20b@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 20, 2017 at 04:31:13PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 May 2017 13:48:44 +0200
>=20
> Replace the specification of four data structures by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/vhost/scsi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZIrE+AAoJEJykq7OBq3PI7NUIAJRqk4L9pEmGl/h4UnMMo4sv
oWi8DRxeI/X0z18VfHeIitB90AIHiH0nkhIYcjoIbA+BX+vI5iDHGeOg5oFkYoBs
Jz7BMyA0PMD2ej2K4eQgvfK+hfieZMRUpLGcFwIzZnhJKZNUDwh1BLTnH7IyejgN
x07PCKkWhiNXXzV9/lnXd62h1M0fTPEjvVZVC3wqtj+nMiUosqD26fSSNj4b6xnX
QDhxIU/lvyPAXRx95FtjqzdbRe9apoT6r0T3/Y3QyZY+WmlCgBB4quascvWxKAq1
LYf48MteIT30aZg0sHzj3avOmlnxyLmfdNSfQ2ip2F586bIAnYro8gBl+dBBkM0=
=NEHr
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
