From: NeilBrown <neilb@suse.com>
Date: Sat, 12 May 2018 21:31:45 +0000
Subject: Re: [PATCH] staging: lustre: Use 'kvfree()' for memory allocated by 'kvzalloc()'
Message-Id: <87y3go8sse.fsf@notabene.neil.brown.name>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180512121426.22988-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180512121426.22988-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, oleg.drokin@intel.com, andreas.dilger@intel.com, jsimmons@infradead.org, gregkh@linuxfoundation.org, aastha.gupta4104@gmail.com
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, lustre-devel@lists.lustre.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, May 12 2018, Christophe JAILLET wrote:

> 'buf' is allocated with 'kvzalloc()'. 'kvfree()' must be used to free it.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: NeilBrown <neilb@suse.com>

Thanks.
We could possible add:
Fixes: 11c647caf74b ("staging: lustre: obdclass: variable llog chunk size")

just for completeness.

NeilBrown

> ---
>  drivers/staging/lustre/lustre/obdclass/llog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/lustre/lustre/obdclass/llog.c b/drivers/stag=
ing/lustre/lustre/obdclass/llog.c
> index 693e1129f1f9..5e04d133b596 100644
> --- a/drivers/staging/lustre/lustre/obdclass/llog.c
> +++ b/drivers/staging/lustre/lustre/obdclass/llog.c
> @@ -385,7 +385,7 @@ static int llog_process_thread(void *arg)
>  	if (cd)
>  		cd->lpcd_last_idx =3D last_called_index;
>=20=20
> -	kfree(buf);
> +	kvfree(buf);
>  	lpi->lpi_rc =3D rc;
>  	return 0;
>  }
> --=20
> 2.17.0

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlr3XUIACgkQOeye3VZi
gbmjwg/+JuSwFsPnPrC23r7O/pDHVq73Y/wJKJJPc67j6iaAJFq3VcL/jCoEzpe1
2xWs9dYP30JphzA4F2W39gqLURP3xzaFEUZFZYRF/bwYrXiJB9Px+bf0yA+f1yvW
TWOcYdWvIQCvCECRAo8z9IMCCtSvjf154gmyx/fJLnmk7wAyoI66M7EwOdk1SrJz
vdtFRX+xxm1giMRR7StG4TiWc7NIGKJIHhsbrU+Xf7QLc1X0e+D4NTEexf0NFKSG
hVyyFr+N2QOQ2PPYPGfAQBTr9nEGyC1XFQ0KLH0bHS9BofXRQVEX0TW8QIisF9OX
vp7dTY75AXiKqL0yKp8FbCKAoOu8vIDQtTT3czGilmi8LlWEYCv8WXlz0HNeKl3U
vpc2Wf9B03bFvQOL5fbVOtliFH54X0a/qx5sy9HsdLgFv/pCiH/gPCSsypZPOuwP
ON28GmTzNMvc5u4bN+L3dfHJdl/TEH2cd0QfHt8O4afKXEzKrqYb3pj3r4SfB0jh
ygFosVuKVRR3Xvbunht6IMwqyBqivR5ctr+NYwIEydw7NQgiaIQUKwA4seSXgFMy
Z1sbjn8YH5I7BBc6sqWjJh1dIevL2CvGntp3EGG3nJAC1f4ikKHDidZLjZbd5y1j
B8sIFogTlopW9IxnzKfsKLjQiGWlu2lj6ervUIeWw1o0dQc/XGY=
=M43m
-----END PGP SIGNATURE-----
--=-=-=--
