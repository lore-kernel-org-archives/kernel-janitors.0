From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Mar 2017 22:07:04 +0000
Subject: Re: [PATCH 16/46] selinux: Move two assignments for the variable "rc" in filename_trans_read()
Message-Id: <CAHC9VhS_cFfopAaWO8OLzdJT-+2py60G=hmxTQ=sOUzGX1d_cw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
	<d7e6f9c9-c6dc-5fd5-5537-85fe1617abb1@users.sourceforge.net>
In-Reply-To: <d7e6f9c9-c6dc-5fd5-5537-85fe1617abb1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Sun, Jan 15, 2017 at 10:16 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 14 Jan 2017 18:50:52 +0100
>
> One local variable was set to an error code in two cases before
> a concrete error situation was detected. Thus move the corresponding
> assignments into if branches to indicate a software failure there.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  security/selinux/ss/policydb.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

See previous comments.

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index e7b882251da8..106a1da1d68a 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -1930,16 +1930,17 @@ static int filename_trans_read(struct policydb *p, void *fp)
>                 ft = NULL;
>                 otype = NULL;
>                 name = NULL;
> -
> -               rc = -ENOMEM;
>                 ft = kzalloc(sizeof(*ft), GFP_KERNEL);
> -               if (!ft)
> +               if (!ft) {
> +                       rc = -ENOMEM;
>                         goto out;
> +               }
>
> -               rc = -ENOMEM;
>                 otype = kmalloc(sizeof(*otype), GFP_KERNEL);
> -               if (!otype)
> +               if (!otype) {
> +                       rc = -ENOMEM;
>                         goto out;
> +               }
>
>                 /* length of the path component string */
>                 rc = next_entry(buf, fp, sizeof(u32));
> --
> 2.11.0
>



-- 
paul moore
www.paul-moore.com
