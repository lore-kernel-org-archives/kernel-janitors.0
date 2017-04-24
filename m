From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Apr 2017 10:24:37 +0000
Subject: Re: [PATCH 1/2] lightnvm: potential underflow in pblk_read_rq()
Message-Id: <20170424102437.wqht5g2r2z5upyoo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421205301.3ds7jrgcktuldvrp@mwanda>
 <E2348B07-559F-4874-A3A4-C1079A2A09D2@lightnvm.io>
In-Reply-To: <E2348B07-559F-4874-A3A4-C1079A2A09D2@lightnvm.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Javier =?iso-8859-1?Q?Gonz=E1lez?= <jg@lightnvm.io>
Cc: Matias =?iso-8859-1?Q?Bj=F8rling?= <mb@lightnvm.io>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Apr 22, 2017 at 12:24:50AM +0200, Javier Gonz=E1lez wrote:
> > On 21 Apr 2017, at 22.53, Dan Carpenter <dan.carpenter@oracle.com> wrot=
e:
> >=20
> > This is a static checker fix, and perhaps not a real bug.  The static
> > checker thinks that nr_secs could be negative.  It would result in
> > zeroing more memory than intended.  Anyway, even if it's not a bug,
> > changing this variable to unsigned makes the code easier to audit.
> >=20
> > Fixes: a4bd217b4326 ("lightnvm: physical block device (pblk) target")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > diff --git a/drivers/lightnvm/pblk-read.c b/drivers/lightnvm/pblk-read.c
> > index bce7ed5fc73f..c9daa33e8d9c 100644
> > --- a/drivers/lightnvm/pblk-read.c
> > +++ b/drivers/lightnvm/pblk-read.c
> > @@ -288,7 +288,7 @@ static void pblk_read_rq(struct pblk *pblk, struct =
nvm_rq *rqd,
> > int pblk_submit_read(struct pblk *pblk, struct bio *bio)
> > {
> > 	struct nvm_tgt_dev *dev =3D pblk->dev;
> > -	int nr_secs =3D pblk_get_secs(bio);
> > +	unsigned int nr_secs =3D pblk_get_secs(bio);
> > 	struct nvm_rq *rqd;
> > 	unsigned long read_bitmap; /* Max 64 ppas per request */
> > 	unsigned int bio_init_idx;
>=20
> Thanks Dan. While you are at it, can you also modify the type on the
> other 2 calls to pblk_get_secs in pblk-cache and pblk-core?
>=20

Ugh...  My patch wasn't needed at all.  I should have looked more
carefully.  pblk_get_secs() can only return up to UINT_MAX / 4096 so
it can't overflow to negative.

pblk_get_secs() should probably return sector_t instead of unsigned int?

I do get another static checker warning caused by the pblk-cache code.
drivers/lightnvm/pblk-rl.c:30 pblk_rl_user_may_insert() XXX: potential inte=
ger overflow from user 'rb_user_cnt + nr_entries'

It's seems like a true warning but harmless.

drivers/lightnvm/pblk-rb.c
   425  /*
   426   * Atomically check that (i) there is space on the write buffer for=
 the
   427   * incoming I/O, and (ii) the current I/O type has enough budget in=
 the write
   428   * buffer (rate-limiter).
   429   */
   430  int pblk_rb_may_write_user(struct pblk_rb *rb, struct bio *bio,
   431                             unsigned int nr_entries, unsigned int *p=
os)
                                                ^^^^^^^^^^
Assume this is very high.

   432  {
   433          struct pblk *pblk =3D container_of(rb, struct pblk, rwb);
   434          int flush_done;
   435 =20
   436          spin_lock(&rb->w_lock);
   437          if (!pblk_rl_user_may_insert(&pblk->rl, nr_entries)) {
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We can have an integer overflow in here so this passes.

   438                  spin_unlock(&rb->w_lock);
   439                  return NVM_IO_REQUEUE;
   440          }
   441 =20
   442          if (!pblk_rb_may_write_flush(rb, nr_entries, pos, bio, &flu=
sh_done)) {
                     ^^^^^^^^^^^^^^^^^^^^^^^
But this check won't pass, so it's harmless.

   443                  spin_unlock(&rb->w_lock);
   444                  return NVM_IO_REQUEUE;
   445          }
   446 =20
   447          pblk_rl_user_in(&pblk->rl, nr_entries);
   448          spin_unlock(&rb->w_lock);
   449 =20
   450          return flush_done;
   451  }

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
