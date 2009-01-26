From: Manish Katiyar <mkatiyar@gmail.com>
Date: Mon, 26 Jan 2009 15:35:38 +0000
Subject: Re: [PATCH] : Fix compilation warnings when CONFIG_FILE_LOCKING is
Message-Id: <ea11fea30901260723l546b5d93u6027e111eb565ce@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30901160221u2f8dfb08m1e40f44345d1818c@mail.gmail.com>
In-Reply-To: <ea11fea30901160221u2f8dfb08m1e40f44345d1818c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 16, 2009 at 3:51 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
> Below patch removes the following compilation warnings.
>
> fs/lockd/svclock.c:719: warning: unused variable 'file'
> fs/nfsd/nfsxdr.c:154: warning: unused variable 'dentry'

Hi,

Any feedback on this ?

Thanks -
Manish

>
>
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index 6063a8e..c4a08e2 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -716,7 +716,9 @@ struct lock_manager_operations nlmsvc_lock_operations = {
>  static void
>  nlmsvc_grant_blocked(struct nlm_block *block)
>  {
> +#ifdef CONFIG_FILE_LOCKING
>        struct nlm_file         *file = block->b_file;
> +#endif
>        struct nlm_lock         *lock = &block->b_call->a_args.lock;
>        int                     error;
>
> diff --git a/fs/nfsd/nfsxdr.c b/fs/nfsd/nfsxdr.c
> index afd08e2..70219c9 100644
> --- a/fs/nfsd/nfsxdr.c
> +++ b/fs/nfsd/nfsxdr.c
> @@ -151,7 +151,9 @@ static __be32 *
>  encode_fattr(struct svc_rqst *rqstp, __be32 *p, struct svc_fh *fhp,
>             struct kstat *stat)
>  {
> +#ifdef CONFIG_FILE_LOCKING
>        struct dentry   *dentry = fhp->fh_dentry;
> +#endif
>        int type;
>        struct timespec time;
>        u32 f;
>
>
> Thanks -
> Manish
>
