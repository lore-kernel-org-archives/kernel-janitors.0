From: Paul Moore <paul@paul-moore.com>
Date: Fri, 27 Mar 2020 22:44:49 +0000
Subject: Re: [PATCH] selinux: clean up indentation issue with assignment statement
Message-Id: <CAHC9VhQOdoNXHjymbMCh1p0Bun5+bzxykhWzPNtjcwoEJ0cAjA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200327174402.351334-1-colin.king@canonical.com>
In-Reply-To: <20200327174402.351334-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 27, 2020 at 1:44 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The assignment of e->type_names is indented one level too deep,
> clean this up by removing the extraneous tab.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  security/selinux/ss/policydb.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

I generally dislike style/formatting only changes, but one could argue
that this is just plain wrong regardless of how you like your code to
look.

I also dislike merging changes into selinux/next when we are at -rc7,
but this is trivial and obviously correct.

However, despite not wanting to merge this into selinux/next I decided
to do just that - thanks for the fix. :)

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 932b2b9bcdb2..70ecdc78efbd 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -1219,10 +1219,9 @@ static int read_cons_helper(struct policydb *p,
>                                 if (rc)
>                                         return rc;
>                                 if (p->policyvers >> -                                       POLICYDB_VERSION_CONSTRAINT_NAMES) {
> -                                               e->type_names = kzalloc(sizeof
> -                                               (*e->type_names),
> -                                               GFP_KERNEL);
> +                                   POLICYDB_VERSION_CONSTRAINT_NAMES) {
> +                                       e->type_names = kzalloc(sizeof
> +                                               (*e->type_names), GFP_KERNEL);
>                                         if (!e->type_names)
>                                                 return -ENOMEM;
>                                         type_set_init(e->type_names);
> --
> 2.25.1

-- 
paul moore
www.paul-moore.com
