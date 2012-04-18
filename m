From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 18 Apr 2012 15:43:46 +0000
Subject: Re: [PATCH] fs/fuse: Convert to kstrtoul_from_user
Message-Id: <8762cx9hal.fsf@tucsk.pomaz.szeredi.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334449227-12011-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1334449227-12011-1-git-send-email-peterhuewe@gmx.de> (Peter
	Huewe's message of "Sun, 15 Apr 2012 02:20:27 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <peterhuewe@gmx.de>
Cc: fuse-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Peter Huewe <peterhuewe@gmx.de> writes:

> This patch replaces the code for getting an number from a
> userspace buffer by a simple call to kstroul_from_user.
> This makes it easier to read and less error prone.

Thanks, applied.

Miklos

>
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  fs/fuse/control.c |   10 ++--------
>  1 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 42593c5..03ff5b1 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -75,19 +75,13 @@ static ssize_t fuse_conn_limit_write(struct file *file, const char __user *buf,
>  				     unsigned global_limit)
>  {
>  	unsigned long t;
> -	char tmp[32];
>  	unsigned limit = (1 << 16) - 1;
>  	int err;
>  
> -	if (*ppos || count >= sizeof(tmp) - 1)
> -		return -EINVAL;
> -
> -	if (copy_from_user(tmp, buf, count))
> +	if (*ppos)
>  		return -EINVAL;
>  
> -	tmp[count] = '\0';
> -
> -	err = strict_strtoul(tmp, 0, &t);
> +	err = kstrtoul_from_user(buf, count, 0, &t);
>  	if (err)
>  		return err;
