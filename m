From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 10 Aug 2020 14:00:35 +0000
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Avoid GFP_ATOMIC where it is not needed
Message-Id: <20200810140035.GA808811@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Qxx1br4bt0+wmkIi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809072948.743269-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809072948.743269-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, yuehaibing@huawei.com, heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2020 at 09:29:48AM +0200, Christophe JAILLET wrote:
> There is no need to use GFP_ATOMIC here. It is a probe function, no
> spinlock is taken.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good to me. I can't think of any reason why this would have to be
an atomic allocation. Nagarjuna, please shout if this is really needed,
otherwise:

Acked-by: Thierry Reding <treding@nvidia.com>

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8xUvcACgkQ3SOs138+
s6F9rw/+PeuqljJiA32vQ8TM7tR5BDd66QmCNhEsxxi8d8jhOXoun3IBvCmN4640
xy5z+K7q4m36vAZ62TpE7PGzuIRdYINZfPFryH1746ZJ5oIBYPvVIgnB9PL1Zxrb
SPAmxYAWic9t9zxgRUKYyX2vA2MZ6usvF1VoQ5/3QrJDU9EWBAT3QLCOQG4xkHaJ
66pkAKvNU807JFHz6DnFwJJO+OO3kqcmiZkvrrblDARIf4FiMXo+V1rn4TSBf+aj
vGI6H2FwBx7ye/sTKUutk0UayG3yyh12tZ51rPibwOPzmU/nfQPVD2Pg66Og5H5A
9UpScutoVDK4mEzriaZIVhY6qIfwuiYB0EQlVF3wQJaOC5tihmt+BJiLj5C568oR
HS8Qtq3i0IDf8jao36zTItstFn94UdgkmSI/Tib9XasfQqdw1oUo1huOCC2734bj
osFeqlVWoqOz9fL7T26owy29Rqe/X/4aMkch/8ngs7bqWC/+yU/GsXCo6pjw/byz
PH9BipZhJAKfpkdPTstA9Ghmt96eWIG7BkKuGj1bvP+xk57DD8JhATVURKr9QnJV
VUVI5sAnX3YLmwZ2EQoZ8K9hoDg6yuxkzVsXfMy5Pf2Z5mU9EbTOVEm1d5Atq68v
JKX6VIpWehZ9PK73SDRAP175Ll77CAu4y7NTNrcloNbpJq65OyY=
=6BAu
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
