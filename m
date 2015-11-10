From: Jan Kara <jack@suse.cz>
Date: Tue, 10 Nov 2015 09:19:23 +0000
Subject: Re: [patch] ncpfs: don't allow negative timeouts
Message-Id: <20151110091923.GE26699@quack.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151110090924.GB2934@mwanda>
In-Reply-To: <20151110090924.GB2934@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Petr Vandrovec <petr@vandrovec.name>, Jan Kara <jack@suse.cz>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue 10-11-15 12:09:24, Dan Carpenter wrote:
> This code causes a static checker warning because it's a user controlled
> variable where we cap the upper bound but not the lower bound.  If
> someone passes us a negative timeout then I guess lets set it to the
> default.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

IMHO it would be better to return error from the ioctl. Currently it would
just wrap when converting to u16 anyway...

								Honza
> 
> diff --git a/fs/ncpfs/ioctl.c b/fs/ncpfs/ioctl.c
> index 79b1130..c07498a 100644
> --- a/fs/ncpfs/ioctl.c
> +++ b/fs/ncpfs/ioctl.c
> @@ -525,7 +525,7 @@ static long __ncp_ioctl(struct inode *inode, unsigned int cmd, unsigned long arg
>  			switch (rqdata.cmd) {
>  				case NCP_LOCK_EX:
>  				case NCP_LOCK_SH:
> -						if (rqdata.timeout = 0)
> +						if (rqdata.timeout <= 0)
>  							rqdata.timeout = NCP_LOCK_DEFAULT_TIMEOUT;
>  						else if (rqdata.timeout > NCP_LOCK_MAX_TIMEOUT)
>  							rqdata.timeout = NCP_LOCK_MAX_TIMEOUT;
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
