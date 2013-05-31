From: Felipe Balbi <balbi@ti.com>
Date: Fri, 31 May 2013 21:13:58 +0000
Subject: Re: [PATCH v2] usb: musb: Fix format specifier warning
Message-Id: <20130531211358.GC11520@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="i7F3eY7HS/tUJxUd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370033389-27131-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1370033389-27131-1-git-send-email-emilgoode@gmail.com>
To: Emil Goode <emilgoode@gmail.com>
Cc: balbi@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 31, 2013 at 10:49:49PM +0200, Emil Goode wrote:
> This patch fixes a format specifier warning. dma_addr_t can be either
> u32 or u64 so we should cast to the largest type and change the format
> specifier to %llx.
> The addition of urb->transfer_dma and urb->actual_length is also done a
> few lines below. I have moved this code up and pass the variable buf to
> dev_dbg.
>=20
> Sparse output:
> drivers/usb/musb/musb_host.c:1761:4: warning:
> 	format =E2=80=98%x=E2=80=99 expects argument of type =E2=80=98unsigned i=
nt=E2=80=99,
> 	but argument 6 has type =E2=80=98dma_addr_t=E2=80=99 [-Wformat]
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

already sent this one yesterday:

http://marc.info/?l=3Dlinux-usb&m=3D136987256218081

--=20
balbi

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRqRKWAAoJEIaOsuA1yqRErn4QAKw9IO81oFtXWLd3YlbkobIf
YUs87SlrDnk+yvpv7gvNkoQi5Bk5OryA15dYvmy1ZXtmRIlJ8I+BYfqoL6Ojj5KL
uIRJlKgIuVbPB5CcCxPWFGHUudi57QtrgFpg6leDwDe/606KlBsvLor+UlYaQlVn
NUnPvzkUmRbSZJhkQEJTzg5TZaE/c94Lip+eFLM8ozEkYcWS+QaNUSBi80V+fQF+
9oLChG/oexDQr7RSJC87rB9TwAXxsjQmouDcCdC6xLOntHLC7HycYkFUjC1MOwoW
djL79T13vZ4alb16Q6DR8gqzdQh7e6KZhvptEoCOs6aSj9B5qk72d20JKHvN2nLF
ZpAWmhLGLxTLXerTqxIGFCnWDACHgs/Zu3bpnlE42JKbC3s8Kunp0TvCNo8m+VjM
5MVVi/8N9a/PKjRr89jRveiWC1SDwW6zwN4f5qwpqwrnSy3Ew42H7EYRnCvUPRPA
LRVDVvzEqufK+JlC2gggc1sTBhbDAzCfa9GaYCY9lneLhQ4rqXAAKfQqDxGP1fLd
bqFJ8DL9Aq3O5yh4ERS8i8dpvQflNHFtigHdAX3Nc4y5zI0WQVkAi+HVVQQQtsSC
Ki3LFgq2sdNXHGVz+jiH0GR5H2DkoIQ1KzUGWjF9LWuNoCKQGm/3FC50PUzmEFVS
kOmAbDD4tsJmFgP28kR3
=/ltM
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
