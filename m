From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Mon, 27 Apr 2020 13:32:22 +0000
Subject: Re: [PATCH -next] selinux: fix error return code in cond_read_list()
Message-Id: <CAFqZXNvWYK4pdcYTH3Zp-4c3K6oeP2D+K2AMRH3jFcN8XgOFoQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427124935.130432-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427124935.130432-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, SElinux list <selinux@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 2:48 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 60abd3181db2 ("selinux: convert cond_list to array")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/conditional.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
> index 939a74fd8fb4..da94a1b4bfda 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -429,7 +429,7 @@ int cond_read_list(struct policydb *p, void *fp)
>
>         p->cond_list = kcalloc(len, sizeof(*p->cond_list), GFP_KERNEL);
>         if (!p->cond_list)
> -               return rc;
> +               return -ENOMEM;
>
>         rc = avtab_alloc(&(p->te_cond_avtab), p->te_avtab.nel);
>         if (rc)
>
>
>

Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>

Thanks!

-- 
Ondrej Mosnacek <omosnace at redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.
