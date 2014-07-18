From: walter harms <wharms@bfs.de>
Date: Fri, 18 Jul 2014 17:18:13 +0000
Subject: Re: [PATCH 4/5] kernel/debug/kdb/kdb_bp.c: drop negativity check on unsigned value
Message-Id: <53C956D5.50809@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405697692-23816-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405697692-23816-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, dcb314@hotmail.com, jason.wessel@windriver.com



Am 18.07.2014 17:34, schrieb Andrey Utkin:
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80591
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>  kernel/debug/kdb/kdb_bp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
> index 70a5046..f27dfb8 100644
> --- a/kernel/debug/kdb/kdb_bp.c
> +++ b/kernel/debug/kdb/kdb_bp.c
> @@ -39,7 +39,7 @@ static char *kdb_rwtypes[] =3D {
> =20
>  static char *kdb_bptype(kdb_bp_t *bp)
>  {
> -	if (bp->bp_type < 0 || bp->bp_type > 4)
> +	if (bp->bp_type > 4)
>  		return "";
> =20
>  	return kdb_rwtypes[bp->bp_type];

i would expect a ckeck for the upper limit with ARRAY_SIZE(bp->bp_type) her=
e.

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
