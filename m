From: Casey Schaufler <casey@schaufler-ca.com>
Date: Tue, 23 Aug 2016 21:56:20 +0000
Subject: Re: [PATCH] Smack: Use memdup_user() rather than duplicating its implementation
Message-Id: <a78df05f-bd74-a14d-9738-5fc61cd658e0@schaufler-ca.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <eeea6163-7b69-ac3b-223d-8cc1afef6c7f@users.sourceforge.net>
In-Reply-To: <eeea6163-7b69-ac3b-223d-8cc1afef6c7f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-security-module@vger.kernel.org, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>

On 8/21/2016 11:26 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 Aug 2016 20:17:36 +0200
>
> Reuse existing functionality from memdup_user() instead of keeping
> duplicate source code.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Casey Schaufler <casey@schaufler-ca.com>

Applied to git://github.com/cschaufler/smack-next.git#smack-for-4.9

> ---
>  security/smack/smackfs.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index e249a66..6492fe9 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -2523,14 +2523,9 @@ static ssize_t smk_write_revoke_subj(struct file *file, const char __user *buf,
>  	if (count = 0 || count > SMK_LONGLABEL)
>  		return -EINVAL;
>  
> -	data = kzalloc(count, GFP_KERNEL);
> -	if (data = NULL)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(data, buf, count) != 0) {
> -		rc = -EFAULT;
> -		goto out_data;
> -	}
> +	data = memdup_user(buf, count);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
>  
>  	cp = smk_parse_smack(data, count);
>  	if (IS_ERR(cp)) {

