From: Leon Romanovsky <leon@kernel.org>
Date: Tue, 05 Dec 2017 15:53:18 +0000
Subject: Re: [PATCH] IB/mlx4: Potential buffer overflow in _mlx4_set_path()
Message-Id: <20171205155318.GH2110@mtr-leonro.local>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="TKYYegg/GYAC5JIZ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143923.26dqc3ekhbmtmsgt@mwanda>
In-Reply-To: <20171205143923.26dqc3ekhbmtmsgt@mwanda>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--TKYYegg/GYAC5JIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 05, 2017 at 05:39:23PM +0300, Dan Carpenter wrote:
> Smatch complains about this code:
>
>     drivers/infiniband/hw/mlx4/qp.c:1827 _mlx4_set_path()
>     error: buffer overflow 'dev->dev->caps.gid_table_len' 3 <= 255
>
> The mlx4_ib_gid_index_to_real_index() does check that "port" is within
> bounds, but we don't check the return value for errors.  It seems simple
> enough to add a check for that.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>

--TKYYegg/GYAC5JIZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlomwO4ACgkQ5GN7iDZy
WKdRIRAAj1eb+sN6jiVjyp20LbFFXkURc64+I+EARd7HTw+DpHhsFregOPaN7PEO
bs2EjJn3FZ2fKudljGaRFbAxNbntsY4074SLQYNqw2KN36m0ReUS1nU98SJBODrY
Sj32ablhP5ODihVdiZCevoMvRvEClC524uX8NoAlowN9yF8FtUGKq1C1MX+3tTG4
bximJfme9GrCKeLH0Yq7hBoQHDmLTb6cDAlZt32M98Edj7K2KytEq/z/5LC5loam
i+wRUc/ngvAQRC3ucuCUNU22r4LWUfrugDXjoK62h8z97xly+eIebMahC80evJ/8
Pa7720E+usYL7uCR4pFgKFVzz980W0E47N5Y9Dip94efoWCQkv1dRHgOplnOkgyM
/FytTlC91CtXBwZF6QOnXmxtcVSkYOdsT/OofeijogfAE9oaAL2axiA4pCsEVbsW
UNmNn5siLIkBgjX4T/hCjbWjErpS7oMMHWldOp2UU7wTyIb9pC7YTRtibpoVYHY6
jvpMR1raALfh8FModaWooLTJoQObP81X+nSkUwnVTuNp2A/bpXVxMEuSqjAwfZEk
4BMSNbX9YoH6BWsP/IYp3FhphE6o/YmDDKes8oUqjmetPdLz1A+AdUs3B3K+0gvj
mQhkFOKlnrz2l+746K3NGBamubf9ONb1JHqyzTlscr7Go44YbVM=
=m4Uz
-----END PGP SIGNATURE-----

--TKYYegg/GYAC5JIZ--
