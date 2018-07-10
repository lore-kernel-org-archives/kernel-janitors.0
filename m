From: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 10 Jul 2018 10:42:01 +0000
Subject: Re: [PATCH][next] drm/panel: ILI9881c: fix missing assignment to error return ret
Message-Id: <20180710104201.GJ1504@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="HcccYpVZDxQ8hzPO"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180626160354.1363-1-colin.king@canonical.com>
In-Reply-To: <20180626160354.1363-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--HcccYpVZDxQ8hzPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2018 at 05:03:54PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently, ret is being checked for an error condition however it
> is not being assigned in the previous statement on the call of
> function mipi_dsi_dcs_exit_sleep_mode.  Add in the missing assignment
> of ret.
>=20
> Detected by CoverityScan, CID#1470174, 1470178 ("Unchecked return value")
>=20
> Fixes: 26aec25593c2 ("drm/panel: Add Ilitek ILI9881c panel driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--HcccYpVZDxQ8hzPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltEjXkACgkQ3SOs138+
s6HLFRAAp0RfH9dXdPIBTsFKGhAnjEGXIByABT4ePuVE48uwunerFYt8UCeBkRTR
RxQjfMEij4yRhOK18BM7yFNYZHTrFfN6C0TlUGxqA0HmIew1X0XCLh1AEZTwfz2b
ZSQhkIW4nCMnyCSNkz2e50sKhhBw/rUyggOtdInj9HJHprFBGU6NCAIbwPdHQYG/
+pJaXVdQq8X1ZuRx/tLy5+BMuLua/0swCU5Tqd9JsbL1kpWtoiX/wjYuDLEj3zUf
4uBoWmm+kAFlZg2722Am3UmonLavdpl0Uh9Q2Suq6zSpAUqnNmVqgBNXgroDbOsF
74Prk+pDtP7RLZYJ/ParuvonR6yZv3aYU+SpJw5fBHcrKv7AHrqUoGwvX/SZsKPM
hPJ79rFK+8Ob5lGEbGFb5zebvnRFJ3KP/RTb/1WPBUJYUILwEZR9VXdu0vVXMvel
RYvlS9ITDBLsSVr4ktJrWxP9ONlo746+6EHhtlsnFFaab3D2BYrpSrZ1IQCdnZu3
k+pgTKtdnXsavBqliE3FVA8ijQ+dDpeQkJMKWZTj9OjNjLxCIzL3nauoHSdpGvjY
i9jg7BYbREZmhOJhvR5ISWuVXY5DyEjZ2fHF++BAJyu5Z+dE+Vrn+cKr+Z6EHRjY
UteLVk8HQEwRjFEiXbMjUSVZhhkIedA9LMeVn6U19suUjDW2LTg=
=kp2D
-----END PGP SIGNATURE-----

--HcccYpVZDxQ8hzPO--
