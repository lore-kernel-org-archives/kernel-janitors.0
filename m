From: Jan Kara <jack@suse.cz>
Date: Wed, 11 Nov 2015 07:35:48 +0000
Subject: Re: [patch v2] ncpfs: don't allow negative timeouts
Message-Id: <20151111073548.GA19064@quack.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151110091923.GE26699@quack.suse.cz>
 <20151110221441.GA30281@mwanda>
In-Reply-To: <20151110221441.GA30281@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Petr Vandrovec <petr@vandrovec.name>, David Howells <dhowells@redhat.com>, Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 11-11-15 01:14:41, Dan Carpenter wrote:
> This code causes a static checker warning because it's a user controlled
> variable where we cap the upper bound but not the lower bound.  Let's
> return an -EINVAL for negative timeouts.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.com>

								Honza

> ---
> v2: in the original I just ignored the invalid data and went with the
>     default but now it returns -EINVAL.
> 
> diff --git a/fs/ncpfs/ioctl.c b/fs/ncpfs/ioctl.c
> index 79b1130..ebf45d2 100644
> --- a/fs/ncpfs/ioctl.c
> +++ b/fs/ncpfs/ioctl.c
> @@ -525,7 +525,9 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
>  			switch (rqdata.cmd) {
>  				case NCP_LOCK_EX:
>  				case NCP_LOCK_SH:
> -						if (rqdata.timeout = 0)
> +						if (rqdata.timeout < 0)
> +							return -EINVAL;
> +						else if (rqdata.timeout = 0)
>  							rqdata.timeout = NCP_LOCK_DEFAULT_TIMEOUT;
>  						else if (rqdata.timeout > NCP_LOCK_MAX_TIMEOUT)
>  							rqdata.timeout = NCP_LOCK_MAX_TIMEOUT;
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
