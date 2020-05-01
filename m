From: Paul Moore <paul@paul-moore.com>
Date: Fri, 01 May 2020 19:04:47 +0000
Subject: Re: [PATCH -next] selinux: fix error return code in policydb_read()
Message-Id: <CAHC9VhTEHJiRm-9zkic1mUyVJ6WNLL8AhzRsbq+bf7q2GDdCgA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429073053.83660-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429073053.83660-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, Jeff Vander Stoep <jeffv@google.com>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 29, 2020 at 3:29 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return negative error code -ENOMEM from the kvcalloc() error
> handling case instead of 0, as done elsewhere in this function.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/policydb.c | 1 +
>  1 file changed, 1 insertion(+)

Regardless of the other error, this patch fixes a legitimate problem
so I've merged it into selinux/next with the appropriate fixes tag.
Thanks.

-- 
paul moore
www.paul-moore.com
