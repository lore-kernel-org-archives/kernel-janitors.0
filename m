From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 01 Mar 2020 01:02:19 +0000
Subject: Re: [PATCH resend] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
Message-Id: <20200301120219.22d92d73@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/i6Tur=gNYxaKV0D4z4Cotes"
List-Id: <kernel-janitors.vger.kernel.org>
References: <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
        <20200228172136.h5dvwvrg5yfywxss@kili.mountain>
In-Reply-To: <20200228172136.h5dvwvrg5yfywxss@kili.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Dan Schatzberg <schatzberg.dan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mm@kvack.org

--Sig_/i6Tur=gNYxaKV0D4z4Cotes
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 28 Feb 2020 20:21:36 +0300 Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>
> The alloc_workqueue() function returns NULL on error, it never returns
> error pointers.
>=20
> Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Dan Schatzberg <schatzberg.dan@gmail.com>
> ---
> Resending because this goes through your -mm tree, Andrew.  The
> get_maintainer.pl script lead me astray.
>=20
>  drivers/block/loop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index da8ec0b9d909..a31ca5e04fae 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -897,7 +897,7 @@ static int loop_prepare_queue(struct loop_device *lo)
>  					WQ_UNBOUND | WQ_FREEZABLE |
>  					WQ_MEM_RECLAIM,
>  					lo->lo_number);
> -	if (IS_ERR(lo->workqueue))
> +	if (!lo->workqueue)
>  		return -ENOMEM;
> =20
>  	return 0;

Added to linux-next from tomorrow (in case Andrew has better things to
do with his weekend :-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/i6Tur=gNYxaKV0D4z4Cotes
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5bCZsACgkQAVBC80lX
0GxlMgf/bCW6+K3FJmw7izRTxCApIyjOzBT5pvkC9bnCD7ymNZlTRsRjBrK4rXQP
/Dt8hXSox5yW3SFkh6TuMkxLVk4NMPWSCg1HH9zHANLbcwA6/ZJTg0VzrywxCP71
2A0d7r3MFuK92+NLb84yvz5+q3RfIi1x0+1KvDmtO/9aWbt2yWdicfJu2ZAPUqvY
pCYJZ1g3Y5u7O9cfpazteWKCpn2k0uEtAkosPUx6YkZmQnVvf9w8oMisU3Ke7oVz
VbkkIKJ1+2m/4YgwfFtRZpozWUY8YHvmReaEKNkJ1ZBhY6hiQ+dA075sgWDbket0
pv1Ou9g7BZhzNGTrihXkopxI/f5pAw==
=NCTl
-----END PGP SIGNATURE-----

--Sig_/i6Tur=gNYxaKV0D4z4Cotes--
