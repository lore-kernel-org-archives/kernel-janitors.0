From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Mar 2017 15:32:11 +0000
Subject: Re: [PATCH 36/46] selinux: Move an assignment for the variable "rc" in mls_read_range_helper()
Message-Id: <CAHC9VhTxotWNL8XaOGUS5E8xvBFLaJp7Gi2xfvzu92K7gvmh=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
	<02c3392e-3507-4d91-a8c0-6d933a034058@users.sourceforge.net>
In-Reply-To: <02c3392e-3507-4d91-a8c0-6d933a034058@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

On Sun, Jan 15, 2017 at 10:36 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Jan 2017 11:22:23 +0100
>
> A local variable was set to an error code in one case before a concrete
> error situation was detected. Thus move the corresponding assignment into
> an if branch to indicate a software failure there.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  security/selinux/ss/policydb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Dropped as previously discussed.

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 9b595f2e0d9f..7cf635c650dc 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -996,10 +996,10 @@ static int mls_read_range_helper(struct mls_range *r, void *fp)
>         if (rc)
>                 goto out;
>
> -       rc = -EINVAL;
>         items = le32_to_cpu(buf[0]);
>         if (items > ARRAY_SIZE(buf)) {
>                 printk(KERN_ERR "SELinux: mls:  range overflow\n");
> +               rc = -EINVAL;
>                 goto out;
>         }
>
> --
> 2.11.0
>



-- 
paul moore
www.paul-moore.com
