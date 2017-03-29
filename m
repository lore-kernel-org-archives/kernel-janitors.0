From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Mar 2017 15:17:09 +0000
Subject: Re: [PATCH 28/46] selinux: Return directly after a failed kzalloc() in user_read()
Message-Id: <CAHC9VhQ5XK2KrEDRKY-6ZsWKmy8uSHx6B41Yfzc8dvgoZY-TLQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
	<3582dff5-b96a-dde7-2d1c-bca7ab4aeb0e@users.sourceforge.net>
In-Reply-To: <3582dff5-b96a-dde7-2d1c-bca7ab4aeb0e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Sun, Jan 15, 2017 at 10:28 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Jan 2017 22:08:22 +0100
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
> index 3e43556e67b8..1c046d39e2a7 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -1542,10 +1542,9 @@ static int user_read(struct policydb *p, struct hashtab *h, void *fp)
>         __le32 buf[3];
>         u32 len;
>
> -       rc = -ENOMEM;
>         usrdatum = kzalloc(sizeof(*usrdatum), GFP_KERNEL);
>         if (!usrdatum)
> -               goto bad;
> +               return -ENOMEM;
>
>         if (p->policyvers >= POLICYDB_VERSION_BOUNDARY)
>                 to_read = 3;
> --
> 2.11.0
>



-- 
paul moore
www.paul-moore.com
