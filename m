From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 12 Jul 2018 07:34:09 +0000
Subject: Re: [PATCH -next] drm/sun4i: DW HDMI: Make symbol sun8i_dw_hdmi_pltfm_driver static
Message-Id: <20180712073409.onkrxth7niearorq@flea>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="r3ewoxaupisvl7zi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531315367-190647-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531315367-190647-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org


--r3ewoxaupisvl7zi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 01:22:47PM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
>=20
> drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:228:24: warning:
>  symbol 'sun8i_dw_hdmi_pltfm_driver' was not declared. Should it be stati=
c?
>=20
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--r3ewoxaupisvl7zi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAltHBHAACgkQ0rTAlCFN
r3RDQw//Y0F5/lq5ItRtavzvpMSsv8DMmtympz/s16gF7jRSeztMom2KhqRdKYDY
h90zUIlXHYuuED0n/O7bWK7hRFlx6MxROxI/CqFaEIqj4zaAHO85u2ZnsgAK6jO5
KPb+wlC75Dm01rwnsdcVoiPru2Qtzc6QtcW3TsRlbhc6FpUFcdd035ztntmS2496
UHAkKZViXu5A8y1U47E0ptTZfZUZRi7dSWbqbLfTTLV27IqLWrZ8HfQPZ5SBPkij
LQCR1lFr/ji+He4aDO4MWtH9g7j9vTjQTAbWEzoqxIr5YlU5uTv3HrqibBvghWtu
61OZSRXG9KkNYNeUx6uzJReqpSnqKVF4Jjn4TikI1eFyESDBD5p/uiRTncIEEFxA
9yYxvO+6b8q7t6JbaISBXcY9KVQwQj6cmSTOoXqLIDHE7p7SLNAJIeXgLCnxvWYz
hijo0fWm7onbc8QqqqsBTZG3FAYltTVMOQ/8xO5jauRG2MqAWC7vkOdJt0HRI0ju
YNZW9Odc/xf1X8GIkQkBmFnAH5GFavv2qvxUfi/UaX3B3RmdtH546dgAiYOfCUpT
obLkPdzcUZ63IB0+7UeCk2gJtCNTDoDzQQmiaAVNXbUp/IeVpZWK5Kp9hsdGpFs5
9yCS91R9Hq2b3bXbk+rWyGZOHmRBSDuYgy5dPYNR0lmQnJ+082Q=
=19B8
-----END PGP SIGNATURE-----

--r3ewoxaupisvl7zi--
