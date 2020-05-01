From: Paul Moore <paul@paul-moore.com>
Date: Fri, 01 May 2020 19:54:55 +0000
Subject: Re: [PATCH] selinux: fix return value on error in policydb_read()
Message-Id: <CAHC9VhT7EDa_HJpeq476G=euHz3=p5b4u2KONeMEAMef=ASy8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501195111.3335258-1-omosnace@redhat.com>
In-Reply-To: <20200501195111.3335258-1-omosnace@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: selinux@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On Fri, May 1, 2020 at 3:51 PM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> The value of rc is still zero from the last assignment when the error
> path is taken. Fix it by setting it to -ENOMEM before the
> hashtab_create() call.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: e67b2ec9f617 ("selinux: store role transitions in a hash table")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>  security/selinux/ss/policydb.c | 1 +
>  1 file changed, 1 insertion(+)

Here I was just about to reply to your other patches that patch 2/4
looked fine to me but I was going to hold off on applying it until
this patch came through :)

Merged into selinux/next, thanks.

-- 
paul moore
www.paul-moore.com
