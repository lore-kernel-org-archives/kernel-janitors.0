From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Apr 2020 21:59:14 +0000
Subject: Re: [PATCH -next] selinux: fix error return code in cond_read_list()
Message-Id: <CAHC9VhQdoGgoQGio2_ezjDZe1-AiRAMmQ7Q9Tp8AVEYt2kkjMg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427124935.130432-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427124935.130432-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 8:48 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 60abd3181db2 ("selinux: convert cond_list to array")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/conditional.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good to me too, thanks for fixing this.  I've merge this into
selinux/stable-5.7 and I'll send it up to Linus later this week
assuming testing goes well.

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

-- 
paul moore
www.paul-moore.com
