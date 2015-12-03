From: Casey Schaufler <casey@schaufler-ca.com>
Date: Thu, 03 Dec 2015 22:23:22 +0000
Subject: Re: [patch] Smack: harmless underflow in smk_set_cipso()
Message-Id: <5660C0DA.90503@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151103221539.GC19280@mwanda>
In-Reply-To: <20151103221539.GC19280@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/3/2015 2:15 PM, Dan Carpenter wrote:
> This causes a static checker warning because "maplevel" is set by the
> user and we cap the upper bound but not the lower bound.  It seems
> harmless to me and it's root only but we may as well make the static
> checker happy.
>
> Also checkpatch complains that we should use kstrtouint() instead of
> sscanf here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This no longer parses cipso specifications correctly.
I haven't investigated why. It looks as if it should
work. Does kstrtouint() allow for leading whitespace?
If not, that's the problem.
  

>
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index 94bd9e4..ebb1241 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -862,7 +862,7 @@ static ssize_t smk_set_cipso(struct file *file, const char __user *buf,
>   	struct smack_known *skp;
>   	struct netlbl_lsm_secattr ncats;
>   	char mapcatset[SMK_CIPSOLEN];
> -	int maplevel;
> +	unsigned int maplevel;
>   	unsigned int cat;
>   	int catlen;
>   	ssize_t rc = -EINVAL;
> @@ -912,8 +912,8 @@ static ssize_t smk_set_cipso(struct file *file, const char __user *buf,
>   	else
>   		rule += strlen(skp->smk_known) + 1;
>   
> -	ret = sscanf(rule, "%d", &maplevel);
> -	if (ret != 1 || maplevel > SMACK_CIPSO_MAXLEVEL)
> +	ret = kstrtouint(rule, 10, &maplevel);
> +	if (ret || maplevel > SMACK_CIPSO_MAXLEVEL)
>   		goto out;
>   
>   	rule += SMK_DIGITLEN;
>

