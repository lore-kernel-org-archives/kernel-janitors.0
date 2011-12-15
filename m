From: Felipe Balbi <balbi@ti.com>
Date: Thu, 15 Dec 2011 11:46:13 +0000
Subject: Re: [patch] usb: renesas_usbhs: silence a gcc warning
Message-Id: <20111215114612.GK19539@legolas.emea.dhcp.ti.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="x1F0m3RQhDZyj8sd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215113137.GA4013@elgon.mountain>
In-Reply-To: <20111215113137.GA4013@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--x1F0m3RQhDZyj8sd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2011 at 02:31:37PM +0300, Dan Carpenter wrote:
> Gcc complains about this printk:
> drivers/usb/renesas_usbhs/mod_gadget.c:188:3: warning: format =E2=80=98%x=
=E2=80=99
> 	expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 =
has type
> 	=E2=80=98dma_addr_t=E2=80=99 [-Wformat]
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

applied, thanks

--=20
balbi

--x1F0m3RQhDZyj8sd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJO6d4EAAoJEIaOsuA1yqREZykQALKOYqXtbCJuGVD9zZRkaa+5
muJBOROjLav5Q5F1yuILrx21yLrA+QopDk0qowF+PwuCH8YWyAsFdiNQ8f3Q7q5u
+A/I3z3LSZiVKB3wHxkpTSwgS1UO8m6TZbgjVDkmalR9wKWEPzQ/GN1EAG7S6Lle
I32AxELZgEy+ui55UfOb/ABVxPAIYIprc7W0CegakFPXEQ+1R9o7mf3qzcgIhiQH
zHK5npTczesmTbuVNwhDZ8dy0PQOj4oDFFIxRW1nKYmwOZdtvUMJ6pOZDJj4/7Rs
kdHMZjLxoIb6/3TroeUq9At+sZ0SMJc5mYnNHlwC1MLl6A0JOPvht8FD3rVdvgps
BX9Pr7GJErbzvo5eUM3O2p7IAqFlGZPlyC4jPssDjhPBnO3zGE+YCpZncSOf23eK
A61i313IwD7yKfr/qFOGQADoggwACftMc+xVbKJkoA2MxH6t+kUvtkRa2fPwf+3z
XOAsxasrGLdgDFIzL6Vzf6gIlFPkGfBKfMS99qRfEFNN4Ko7BsntWlBeZ8lGHFq1
6xBJ8iCRTnt32QfEiq/yHox9KaiIcaTLr1cN5ykVOa2/15Gn19BGZQJV7Uy2v5jX
sbDf2njyEeD4Zh+hNuoq+N7jgn4wF3CaEXHBFX3lQ5+Xdbo0DOc77XfwnJk5bJq+
ppRB2ycOj0lWRamLC8DI
=Qcv3
-----END PGP SIGNATURE-----

--x1F0m3RQhDZyj8sd--
