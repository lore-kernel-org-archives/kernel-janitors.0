From: Benson Leung <bleung@google.com>
Date: Tue, 18 Jun 2019 19:49:30 +0000
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer dereference on failed kzalloc
Message-Id: <20190618194930.GA209269@google.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618153924.19491-1-colin.king@canonical.com>
 <CAHX4x85sETNNS8gdQYQniCM=K35DjMjdHOihJ76pGPrAoB9gyA@mail.gmail.com>
In-Reply-To: <CAHX4x85sETNNS8gdQYQniCM=K35DjMjdHOihJ76pGPrAoB9gyA@mail.gmail.com>
To: Nick Crews <ncrews@chromium.org>
Cc: Colin King <colin.king@canonical.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Tue, Jun 18, 2019 at 11:15:03AM -0600, Nick Crews wrote:
> Thanks Colin, good catch.
>=20
> Enric, could you squash this into the real commit?

I've applied this to for-next and for-kernelci in chrome-platform.

Thanks,
Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXQlASgAKCRBzbaomhzOw
wvzvAQCyOTKS1SOAS0+Jun5Ci7dnvQYHXaDKXlumIB/vwgWr0wD/YyL8KgdowZi8
meyb3F1r5KtA3s6FXZ/AN0VbqnHDUws=
=3u8A
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
