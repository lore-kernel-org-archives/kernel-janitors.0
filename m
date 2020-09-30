From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Wed, 30 Sep 2020 14:35:57 +0000
Subject: Re: [PATCH][next][resend] lib/mpi: fix off-by-one check on index "no"
Message-Id: <CAAUqJDuDsgLZ_7i=knqFNkqWJn+G3FqE3Yv=RBLr27mBMJk1Cg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200930130123.8064-1-colin.king@canonical.com>
In-Reply-To: <20200930130123.8064-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, Herbert Xu <herbert@gondor.apana.org.au>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Waiman Long <longman@redhat.com>, kernel-janitors@vger.kernel.org, linux-crypto@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

st 30. 9. 2020 o 15:04 Colin King <colin.king@canonical.com> nap=C3=ADsal(a=
):
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is an off-by-one range check on the upper limit of
> index "no".  Fix this by changing the > comparison to >=3D

Note that this doesn't completely fix the bug though... (see below)

>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: a8ea8bdd9df9 ("lib/mpi: Extend the MPI library")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>
> resend to Cc linux-crypto
>
> ---
>  lib/mpi/mpiutil.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/mpi/mpiutil.c b/lib/mpi/mpiutil.c
> index 3c63710c20c6..632d0a4bf93f 100644
> --- a/lib/mpi/mpiutil.c
> +++ b/lib/mpi/mpiutil.c
> @@ -69,7 +69,7 @@ postcore_initcall(mpi_init);
>   */
>  MPI mpi_const(enum gcry_mpi_constants no)
>  {
> -       if ((int)no < 0 || no > MPI_NUMBER_OF_CONSTANTS)
> +       if ((int)no < 0 || no >=3D MPI_NUMBER_OF_CONSTANTS)
>                 pr_err("MPI: invalid mpi_const selector %d\n", no);

What the code does is it just logs an error if the value is out of
range, but then it happily continues dereferencing the array anyway...
In the original libgcrypt code [1] (which BTW needs this patch, too),
there is log_bug() instead of pr_err(), which doesn't just log the
error, but also abort()'s the program. BUG() would be the correct
kernel equivalent for log_bug(). It seems the whole kernel's MPI
library clone should be re-audited for other instances of pr_*()'s
that should in fact be BUG()'s (or even better, WARN_ONCE()'s with
proper error handling, but that might diverge the code from libgcrypt
too much...).

[1] https://github.com/gpg/libgcrypt/blob/9cd92ebae21900e54cc3d8b607c8ed1af=
bf2eb9b/mpi/mpiutil.c#L773

>         if (!constants[no])
>                 pr_err("MPI: MPI subsystem not initialized\n");
> --
> 2.27.0
>
