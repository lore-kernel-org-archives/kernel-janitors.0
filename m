From: Felipe Balbi <balbi@kernel.org>
Date: Mon, 12 Feb 2018 08:48:04 +0000
Subject: Re: [PATCH 0/4] usb: gadget: fotg210-udc: Fixes and cleanup
Message-Id: <871shqbnln.fsf@linux.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1515791144.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1515791144.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, gregkh@linuxfoundation.org, bhumirks@gmail.com, leoyang.li@nxp.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> This serie aims to fix 2 issues. (path 2 & 4)
>
> The 2nd patch fixes a memory leak. It uses devm_ function a simplify the
> handling of the memory.
>
> The 4th patch fixes a potential invalid pointer dereference.
>
> The 2 other ones, are just clean-ups to remove useless code and add other
> uses of devm_ function to simplify code.
>
> I've left the request_irq/free_irq because I'm unsure of potential side
> effects if some other resources are freed while an IRQ can still be
> triggered. So I've preferred to leave it as-is.
>
> Christophe JAILLET (4):
>   usb: gadget: fotg210-udc: Remove a useless
>   usb: gadget: fotg210-udc: Fix a memory leak
>   usb: gadget: fotg210-udc: Simplify code
>   usb: gadget: fotg210-udc: Fix a potential invalid pointer dereference

you should NEVER make fixes depend on cleanups. It should be the other
way around :-) First fixes, then cleanups. The reason is that fixes can
get accepted during -rc cycle, but cleanups must wait until the next
merge window.

Please fix up your patches, otherwise I'll have to apply the entire
series for v4.17

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlqBVMQACgkQzL64meEa
mQZQlQ/+M0CfPqushKipcO7SiVf+SgbJRb1EYgDd/UuJjTDk+PjicsI4X3CY9Edi
5RRia83bO6umVFFWl6iJFdGBNjxlnouPJbKioR1rW0CFcu17EsD0bbUMzrQ9v3b9
a3eU6X5yvOcdOHcIZDzsuOXmk24SG68HuIIPyYDKYBkrVI6LQVYOKYkYldahAJJ/
AxV1ebcCIhoeIG21V8NBC5xKTj+zP3S/Oz9vJ4ReD/iRLl7U5yQaK1p+sCE8yKFe
QiolaqDdPpATvv4Ppj37GWx2tJfFh6w/Tva9pXj/hzMjKJvaOTlWGO8i2Q2KL82F
ls6M/V9DnkMBEpbZWAhsfOryBuDDwY+TTWkgh5yg9xOU6VDRcWs9zhzyo3Eh3wgW
kbOjI6j0iKJW9RQM9YrZ+uva20grE+pO8aqRrlrhw2s3dt7k18KfToLNbnBYFl/v
Rcjp/v8GNl1xrV2cgJmKWFV98/Anc4X1C1OXgQItAYC8fxOw3NtdPHpIWelpFtB9
3uUIncVXYQe80iArV/dBYmLYVwRZtG+ghx+LMJXP4WhIgolpB7Mc7LSoHYDL7BSM
36vIP7A4fZvhD37DUBe6lPT8JeLIfPPhEmuBPdzW2iTxD9khF/8Q/he0Il8Dce5H
Bf+QqXGL4XyFBMcbY04nJENSHKEax3y3Qc/qHi6rbdQe2FERXEM=
=WDQL
-----END PGP SIGNATURE-----
--=-=-=--
