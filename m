From: Sebastian Reichel <sre@kernel.org>
Date: Fri, 01 Dec 2017 15:29:18 +0000
Subject: Re: [PATCH] power: supply: charger-manager: Fix typo in condition
Message-Id: <20171201152918.qjmo6i5bk3ij5myj@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="lu7nzxjvfwnwza6j"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171121042712.3035-1-raitosyo@gmail.com>
In-Reply-To: <20171121042712.3035-1-raitosyo@gmail.com>
To: raitosyo@gmail.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--lu7nzxjvfwnwza6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 01:27:12PM +0900, raitosyo@gmail.com wrote:
> From: Ryosuke Saito <raitosyo@gmail.com>
>=20
> Should be discharging_max_duration_ms, not charging_max_duration_ms.
>=20
> Signed-off-by: Ryosuke Saito <raitosyo@gmail.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/charger-manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/charger-manager.c b/drivers/power/suppl=
y/charger-manager.c
> index 6502fa7..1de4b44 100644
> --- a/drivers/power/supply/charger-manager.c
> +++ b/drivers/power/supply/charger-manager.c
> @@ -578,7 +578,7 @@ static int check_charging_duration(struct charger_man=
ager *cm)
>  	} else if (is_ext_pwr_online(cm) && !cm->charger_enabled) {
>  		duration =3D curr - cm->charging_end_time;
> =20
> -		if (duration > desc->charging_max_duration_ms &&
> +		if (duration > desc->discharging_max_duration_ms &&
>  				is_ext_pwr_online(cm)) {
>  			dev_info(cm->dev, "Discharging duration exceed %ums\n",
>  				 desc->discharging_max_duration_ms);
> --=20
> 2.9.5
>=20

--lu7nzxjvfwnwza6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlohdU4ACgkQ2O7X88g7
+po0vRAAqGBtE9EQOzJ+R2/s9Z7cWupJVQV1PIgf0xXdJC4ORCwVn1iVB5olywBJ
CwLTBvUYT79wMaBL4f6tYB6wIFK+k2Z+nt0ntxl98ltEQCn/YMMwXBRL+6T00i2F
/QyeOcghZ/4tSUdodLUc/FydOzbf1yVaeK0jjC4kP4CA8LVKOfCpqngD1i4Y8DPN
X1KGJK3Uvr979nxVi7XUoUg3Fom3oRrUEYP2EG2nhDPKmaMxUqcfyeS2fl5PrzS0
9ULpjFSGpYXI+ODtUQTd/2GlPJhtJgsQbzfx0SbAGKEQepNuU4cdZoJN4FSV/eKn
IhZBHGmUCeUvs4QHSt7w8ze8XmidHesSGyNe/atLclQVL/RCiYwtOfwIUdPOsTwE
mrl5QUF8zVpkvIfvUAhnrDMH43UMA4KHMcAQ4/vN30nIPji3DH8ysZ1OxtWf2Yy5
c2pGdamoFtvQ1xQ4OySO2TQUXw6PSp9GQ6IrzhDsxHk5yfhzbp13+S7Xsrxpwnhl
hUOtyMLX+ZHr/J9ACT86GRqzziyis+qRJpgGZRlRVHGR0TCw079baEIWq1Qqn26h
TLPxwluPQrszqK8VbrXMRiF7+FDCKXubl9j3cqULURIvy/FvUJR/d5CX5hTnPPe5
EknbGwtAQD2NaiKsjYd/1uwyFmzEDrYTHGDNhrJ2i9sACdRVeTU=
=Pkmg
-----END PGP SIGNATURE-----

--lu7nzxjvfwnwza6j--
