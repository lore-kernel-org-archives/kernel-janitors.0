From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Date: Fri, 27 Jan 2017 12:39:24 +0000
Subject: Re: [PATCH 3/3] ima_fs: Move three error code assignments in ima_write_policy()
Message-Id: <1485520764.2596.89.camel@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e06d5392-5262-2d88-aa6b-79e53a20fc8b@users.sourceforge.net>
         <b6339fa4-69b3-afc4-18a8-254369fec074@users.sourceforge.net>
In-Reply-To: <b6339fa4-69b3-afc4-18a8-254369fec074@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-ima-devel@lists.sourceforge.net, linux-ima-user@lists.sourceforge.net, linux-security-module@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, 2017-01-25 at 10:34 +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Jan 2017 22:47:07 +0100
> 
> A local variable was set to an error code in three cases before a concrete
> error situation was detected. Thus move the corresponding assignments into
> if branches to indicate a software failure there.
> 
> This issue was detected by using the Coccinelle software.

This coding style was pretty common.  I assume the compiler is smart
enough to do the right thing.  Is this a FYI, letting us know for the
future the preferred coding style, or are we really upstreaming these
sorts of coding style changes?

Mimi

> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  security/integrity/ima/ima_fs.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/security/integrity/ima/ima_fs.c b/security/integrity/ima/ima_fs.c
> index 98304411915d..a50c26f9772c 100644
> --- a/security/integrity/ima/ima_fs.c
> +++ b/security/integrity/ima/ima_fs.c
> @@ -317,21 +317,24 @@ static ssize_t ima_write_policy(struct file *file, const char __user *buf,
> 
>  	/* No partial writes. */
>  	result = -EINVAL;
> -	if (*ppos != 0)
> +	if (*ppos != 0) {
> +		result = -EINVAL;
>  		goto reset_validity;
> +	}
> 
> -	result = -ENOMEM;
>  	if (datalen >= PAGE_SIZE)
>  		datalen = PAGE_SIZE - 1;
>  	data = kmalloc(datalen + 1, GFP_KERNEL);
> -	if (!data)
> +	if (!data) {
> +		result = -ENOMEM;
>  		goto reset_validity;
> +	}
> 
>  	*(data + datalen) = '\0';
> -
> -	result = -EFAULT;
> -	if (copy_from_user(data, buf, datalen))
> +	if (copy_from_user(data, buf, datalen)) {
> +		result = -EFAULT;
>  		goto out_free;
> +	}
> 
>  	result = mutex_lock_interruptible(&ima_write_mutex);
>  	if (result < 0)


