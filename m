From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Feb 2012 12:46:55 +0000
Subject: Re: [PATCH] Staging:android: Silence some compiler warnings
Message-Id: <20120224124655.GB3649@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="yNb1oOkm5a9FJOVX"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330084320-15557-1-git-send-email-ruan.zhengwang@gmail.com>
In-Reply-To: <1330084320-15557-1-git-send-email-ruan.zhengwang@gmail.com>
To: kernel-janitors@vger.kernel.org


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Not bad.

On Fri, Feb 24, 2012 at 07:52:00PM +0800, Zhengwang Ruan wrote:
> There are some compiler warnings, this is to silence them.

When there are compiler warnings, cut and paste the compiler
warnings into the message here.

>=20
> Signed-off-by: Zhengwang Ruan <ruan.zhengwang@gmail.com>
> ---
>  drivers/staging/android/binder.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/b=
inder.c
> index f0b7e66..c4e616c 100644
> --- a/drivers/staging/android/binder.c
> +++ b/drivers/staging/android/binder.c
> @@ -104,7 +104,7 @@ static uint32_t binder_debug_mask =3D BINDER_DEBUG_US=
ER_ERROR |
>  module_param_named(debug_mask, binder_debug_mask, uint, S_IWUSR | S_IRUG=
O);
> =20
>  static int binder_debug_no_lock;
> -module_param_named(proc_no_lock, binder_debug_no_lock, bool, S_IWUSR | S=
_IRUGO);
> +module_param_named(proc_no_lock, binder_debug_no_lock, int, S_IWUSR | S_=
IRUGO);

Instead of doing this, it would be better to change the line before
and declare binder_debug_no_lock as a bool.

> =20
>  static DECLARE_WAIT_QUEUE_HEAD(binder_user_error_wait);
>  static int binder_stop_on_user_error;
> @@ -716,8 +716,8 @@ static struct binder_buffer *binder_alloc_buf(struct =
binder_proc *proc,
>  					      size_t offsets_size, int is_async)
>  {
>  	struct rb_node *n =3D proc->free_buffers.rb_node;
> -	struct binder_buffer *buffer;
> -	size_t buffer_size;
> +	struct binder_buffer *buffer =3D NULL;
> +	size_t buffer_size =3D 0;

The other option would be to use the uninitialized_var() macro.  On
fast paths we would probably insist on that, but for this probably
no one cares.

When you fix uninitialized variable warnings, please comment in the
changelog whether the variable can ever be used uninitialized in
real life.  (Is GCC correct?).

This should probably be split into two patches.  One for the type
change and one for the uninitialized variables.  We could probably
merge it as is, but definitely no one will complain if you split it
apart.

Use the ./scripts/get_maintainer.pl to find where to resend this
patch.  Every kernel patch has to be CC'd to a mailing list.  I
wouldn't CC lkml for this.  They don't care about trivial patches
to staging.  Just devel@driverdev.osuosl.org is fine.

regards,
dan carpenter


--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPR4a+AAoJEOnZkXI/YHqRYwAP/R/t7DFY4noyMoislraOUO/2
Kmk2gvUShstsorlq7CyKszKRCsmuxw724190DQBqsUpXl1KLQzf7FZFvWrPZKYr5
dB5VZh/j0pvqa4QwY1KzLLwvGoIICCNDPv1fWYmnyGMKCqDmc786v8QnPXjeXEyb
PKIhIaZ4X9viXx47uIh6yZAxN9I6XtDOHAIpkZoaTYmYM+6CYXJfcukR1xqZg303
5PJox2ExPO212l7fZqpWRWC2BahDKDYyrke8ozrzHJM0D6ng+Jgl4T4t2Ep3fcQ6
GLQ1PfA7ePVauGqR145W4Ucj/Gpm7fFcw+C3Xn8QYeUeNuRjasGs2vxfaJZirb3m
5p2DPgjVnazj5KIL2d+oG6RLmALki3ZtSgnV+kV+yVGTWSKTMxFSuFGfK+eCZh1d
CKPqCQNymHB/Obon0hbiLxmV6ezqRB+fAbu4aiLjr6mFYi3JbIENk5qVNknFMR0S
i+qSI5pThcwd6PEgdp0EbdSJbsi+85mizWpVeDafbpujkuPC6Qa5iD7Ou7hptYd+
xyo9FrbVFL6exbXt6Mw3OoBtx81N3C9U/TdIqOMEPHoZJxhFzixiVD/QgBNyRPju
H5GH0guJwUM2NYbSVcEIc/kWzYF8iUmDCka37rAsAfbHvmOyumRJGCnzPEZTLA8V
lBw7wkmoEh1ZDEAdD95d
=nI5w
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--
