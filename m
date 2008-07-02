From: Filippo Zangheri <filippo.zangheri@yahoo.it>
Date: Wed, 02 Jul 2008 14:25:19 +0000
Subject: Re: [PATCH]  drivers/net/wireless/iwlwifi/iwl-3945.c
Message-Id: <486B8FCF.8080201@yahoo.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214962647.18261.15.camel@localhost.localdomain>
In-Reply-To: <1214962647.18261.15.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Darren Jenkins <darrenrjenkins@gmail.com>
Cc: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ipw2100-admin@linux.intel.com, yi.zhu@intel.com, reinette.chatre@intel.com, linux-wireless@vger.kernel.org

(Cc'ing linux-wireless)

On 02/07/2008 03:37, Darren Jenkins\ wrote:
> G'day people
>=20
> Coverity CID: 2265 NEGATIVE_RETURNS
>=20
> "rate" is of an unsigned type, and the code requires a signed type.
> The following patch makes it so.
>=20
> Only compile tested.
>=20
> =EF=BB=BFSigned-off-by: Darren Jenkins <darrenrjenkins@gmailcom>
>=20
> diff --git a/drivers/net/wireless/iwlwifi/iwl-3945.c b/drivers/net/wirele=
ss/iwlwifi/iwl-3945.c
> index 62a3d8f..31d38cd 100644
> --- a/drivers/net/wireless/iwlwifi/iwl-3945.c
> +++ b/drivers/net/wireless/iwlwifi/iwl-3945.c
> @@ -449,7 +449,7 @@ static void iwl3945_dbg_report_frame(struct iwl3945_p=
riv *priv,
> =20
>  	if (print_summary) {
>  		char *title;
> -		u32 rate;
> +		int rate;
> =20
>  		if (hundred)
>  			title =3D "100Frames";

--=20
Filippo Zangheri

GPG key ID: 0x6C1F2F2F

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
