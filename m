From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Jul 2014 07:53:13 +0000
Subject: Re: [PATCH] kernel/debug/kdb/kdb_bp.c: fix argument range check
Message-Id: <20140722075207.GN25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405705224-32171-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405705224-32171-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net, dcb314@hotmail.com, jason.wessel@windriver.com, wharms@bfs.de

On Fri, Jul 18, 2014 at 08:40:24PM +0300, Andrey Utkin wrote:
> Dropped negativity check; enhanced upper limit check as proposed by
> Walter Harms <wharms@bfs.de>
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80591
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>  kernel/debug/kdb/kdb_bp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
> index 70a5046..371150f 100644
> --- a/kernel/debug/kdb/kdb_bp.c
> +++ b/kernel/debug/kdb/kdb_bp.c
> @@ -39,7 +39,7 @@ static char *kdb_rwtypes[] =3D {
> =20
>  static char *kdb_bptype(kdb_bp_t *bp)
>  {
> -	if (bp->bp_type < 0 || bp->bp_type > 4)
> +	if (bp->bp_type >=3D ARRAY_SIZE(kdb_rwtypes))
>  		return "";

I like this version of the patch because it silences the static checker
warning like the first one does but it also makes the code more
readable.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
