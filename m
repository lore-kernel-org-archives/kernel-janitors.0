From: Paul Moore <paul@paul-moore.com>
Date: Fri, 18 Jan 2019 21:28:07 +0000
Subject: Re: [PATCH -next] selinux: Fix error return code in policydb_read()
Message-Id: <CAHC9VhSbtqhiMQdNJ_6yeX5+ggwVNyGYXe-E=bMj2V2z2MmAsA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547821427-157169-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547821427-157169-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, peter enderborg <peter.enderborg@sony.com>, Kent Overstreet <kent.overstreet@gmail.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Ondrej Mosnacek <omosnace@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 18, 2019 at 9:18 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix to return a negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 31696241e96e ("selinux: convert to kvmalloc")

Unfortunately this commit isn't to be found in any of the SELinux
branches, or Linus' master branch; based on the subject line I'm
guessing the original patch is in a -next branch somewhere.  Please
find whoever pushed this patch to linux-next and have them apply the
fix.

Thank you.

> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  security/selinux/ss/policydb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 6b576e5..ef616dd 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -2490,6 +2490,7 @@ int policydb_read(struct policydb *p, void *fp)
>         if (rc)
>                 goto bad;
>
> +       rc = -ENOMEM;
>         p->type_attr_map_array = kvcalloc(p->p_types.nprim,
>                                           sizeof(*p->type_attr_map_array),
>                                           GFP_KERNEL);
>
>
>

-- 
paul moore
www.paul-moore.com
