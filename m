From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Sep 2020 16:03:33 +0000
Subject: Re: [PATCH][next][resend] lib/mpi: fix off-by-one check on index "no"
Message-Id: <CAMj1kXF2AzFkcyWzUHagq4xD_4BHpiscrPurndmJmJyp2KgXJg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200930130123.8064-1-colin.king@canonical.com> <CAAUqJDuDsgLZ_7i=knqFNkqWJn+G3FqE3Yv=RBLr27mBMJk1Cg@mail.gmail.com>
In-Reply-To: <CAAUqJDuDsgLZ_7i=knqFNkqWJn+G3FqE3Yv=RBLr27mBMJk1Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, Herbert Xu <herbert@gondor.apana.org.au>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Waiman Long <longman@redhat.com>, kernel-janitors@vger.kernel.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 30 Sep 2020 at 16:36, Ondrej Mosnáček <omosnacek@gmail.com> wrote:
>
> st 30. 9. 2020 o 15:04 Colin King <colin.king@canonical.com> napísal(a):
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is an off-by-one range check on the upper limit of
> > index "no".  Fix this by changing the > comparison to >=
>
> Note that this doesn't completely fix the bug though... (see below)
>

And by the same reasoning, it does not address the coverity issue
either, since the out of bounds read is still executed.


> >
> > Addresses-Coverity: ("Out-of-bounds read")
> > Fixes: a8ea8bdd9df9 ("lib/mpi: Extend the MPI library")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >
> > resend to Cc linux-crypto
> >
> > ---
> >  lib/mpi/mpiutil.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/mpi/mpiutil.c b/lib/mpi/mpiutil.c
> > index 3c63710c20c6..632d0a4bf93f 100644
> > --- a/lib/mpi/mpiutil.c
> > +++ b/lib/mpi/mpiutil.c
> > @@ -69,7 +69,7 @@ postcore_initcall(mpi_init);
> >   */
> >  MPI mpi_const(enum gcry_mpi_constants no)
> >  {
> > -       if ((int)no < 0 || no > MPI_NUMBER_OF_CONSTANTS)
> > +       if ((int)no < 0 || no >= MPI_NUMBER_OF_CONSTANTS)
> >                 pr_err("MPI: invalid mpi_const selector %d\n", no);
>
> What the code does is it just logs an error if the value is out of
> range, but then it happily continues dereferencing the array anyway...
> In the original libgcrypt code [1] (which BTW needs this patch, too),
> there is log_bug() instead of pr_err(), which doesn't just log the
> error, but also abort()'s the program. BUG() would be the correct
> kernel equivalent for log_bug(). It seems the whole kernel's MPI
> library clone should be re-audited for other instances of pr_*()'s
> that should in fact be BUG()'s (or even better, WARN_ONCE()'s with
> proper error handling, but that might diverge the code from libgcrypt
> too much...).
>
> [1] https://github.com/gpg/libgcrypt/blob/9cd92ebae21900e54cc3d8b607c8ed1afbf2eb9b/mpi/mpiutil.c#L773
>
> >         if (!constants[no])
> >                 pr_err("MPI: MPI subsystem not initialized\n");
> > --
> > 2.27.0
> >
