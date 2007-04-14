From: Eric Dumazet <dada1@cosmosbay.com>
Date: Sat, 14 Apr 2007 09:39:11 +0000
Subject: Re: [KJ] [PATCH 03/04]use set_current_state in fs
Message-Id: <4620A13F.6060502@cosmosbay.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070414084956.GD14084@arun.site>
In-Reply-To: <20070414084956.GD14084@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, akpm@linux-foundation.org, nfs@lists.sourceforge.net, linux-kernel@vger.kernel.org, trond.myklebust@fys.uio.no

Milind Arun Choudhary a =E9crit :
> use set_current_state(TASK_*) instead of current->state =3D TASK_*, in fs=
/nfs
>=20
> Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
>=20
>=20
> ---
>  idmap.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/nfs/idmap.c b/fs/nfs/idmap.c
> index 9d4a6b2..054ca15 100644
> --- a/fs/nfs/idmap.c
> +++ b/fs/nfs/idmap.c
> @@ -272,7 +272,7 @@ nfs_idmap_id(struct idmap *idmap, struct idmap_hashta=
ble *h,
>  	set_current_state(TASK_UNINTERRUPTIBLE);
>  	mutex_unlock(&idmap->idmap_im_lock);
>  	schedule();
> -	current->state =3D TASK_RUNNING;
> +	set_current_state(TASK_RUNNING);
>  	remove_wait_queue(&idmap->idmap_wq, &wq);
>  	mutex_lock(&idmap->idmap_im_lock);

Probably a dumb question, so please forgive me.

Why are you  forcing a memory barrier here, (and also on your other patches=
).

Is'nt a  __set_current_state(TASK_RUNNING); appropriate ?


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
