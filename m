From: Paul Moore <paul@paul-moore.com>
Date: Mon, 16 Oct 2017 22:37:54 +0000
Subject: Re: [PATCH] selinux: remove redundant assignment to len
Message-Id: <CAHC9VhQZPeYf30o6cUr194-ttT46dZDfMDehYVExdbdEmtn_XA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171014150049.1053-1-colin.king@canonical.com>
In-Reply-To: <20171014150049.1053-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Sat, Oct 14, 2017 at 11:00 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable len is being set to zero and this value is never
> being read since len is being set to a different value just
> a few lines later.  Remove this redundant assignment. Cleans
> up clang warning: Value stored to 'len' is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/selinux/ss/conditional.c | 1 -
>  1 file changed, 1 deletion(-)

Merged.

> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
> index 771c96afe1d5..c91543a617ac 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -361,7 +361,6 @@ static int cond_read_av_list(struct policydb *p, void *fp, struct cond_av_list *
>
>         *ret_list = NULL;
>
> -       len = 0;
>         rc = next_entry(buf, fp, sizeof(u32));
>         if (rc)
>                 return rc;
> --
> 2.14.1
>

-- 
paul moore
www.paul-moore.com
