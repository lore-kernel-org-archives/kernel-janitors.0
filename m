From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Mar 2017 15:40:13 +0000
Subject: Re: [PATCH 40/46] selinux: Return directly after a failed kzalloc() in roles_init()
Message-Id: <CAHC9VhStS59YiUoBhKqWPgN17wQ_5iXGfDgY2QTQPdUkWip3EA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
	<2c370330-a80c-9879-2013-3a99a21dc06d@users.sourceforge.net>
In-Reply-To: <2c370330-a80c-9879-2013-3a99a21dc06d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Sun, Jan 15, 2017 at 10:40 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Jan 2017 12:10:09 +0100
>
> Return directly after a call of the function "kzalloc" failed
> at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  security/selinux/ss/policydb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Merged, thanks.

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 8b9ed3f1b132..ccc146bfd4c2 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -178,10 +178,9 @@ static int roles_init(struct policydb *p)
>         int rc;
>         struct role_datum *role;
>
> -       rc = -ENOMEM;
>         role = kzalloc(sizeof(*role), GFP_KERNEL);
>         if (!role)
> -               goto out;
> +               return -ENOMEM;
>
>         rc = -EINVAL;
>         role->value = ++p->p_roles.nprim;
> --
> 2.11.0
>



-- 
paul moore
www.paul-moore.com
