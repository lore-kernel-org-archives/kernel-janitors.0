From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Fri, 06 Nov 2020 20:33:16 +0000
Subject: Re: [PATCH] net/sunrpc: clean up error checking in proc_do_xprt()
Message-Id: <20201106203316.GA26028@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <031F93AC-744F-4E02-9948-1C1F5939714B@gmail.com>
 <20201027141758.GA3488087@mwanda>
In-Reply-To: <20201027141758.GA3488087@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Artur Molchanov <arturmolchanov@gmail.com>, Anna Schumaker <anna.schumaker@netapp.com>, Chuck Lever <chuck.lever@oracle.com>, Jakub Kicinski <kuba@kernel.org>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>

On Tue, Oct 27, 2020 at 05:17:58PM +0300, Dan Carpenter wrote:
> There are three changes but none of them should affect run time:
> 
> 1)  You can't write to this file because the permissions are 0444.  But
>     it sort of looked like you could do a write and it would result in
>     a read.  Then it looked like proc_sys_call_handler() just ignored
>     it.  Which is confusing.  It's more clear if the "write" just
>     returns zero.
> 2)  The "lenp" pointer is never NULL so that check can be removed.
> 3)  In the original code, the "if (*lenp < 0)" check didn't work because
>     "*lenp" is unsigned.  Fortunately, the memory_read_from_buffer()
>     call will never fail in this context so it doesn't affect runtime.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  net/sunrpc/sysctl.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/net/sunrpc/sysctl.c b/net/sunrpc/sysctl.c
> index a18b36b5422d..04526bab4a06 100644
> --- a/net/sunrpc/sysctl.c
> +++ b/net/sunrpc/sysctl.c
> @@ -63,19 +63,19 @@ static int proc_do_xprt(struct ctl_table *table, int write,
>  			void *buffer, size_t *lenp, loff_t *ppos)
>  {
>  	char tmpbuf[256];
> -	size_t len;
> +	ssize_t len;
>  
> -	if ((*ppos && !write) || !*lenp) {
> -		*lenp = 0;
> +	*lenp = 0;
> +
> +	if (write || *ppos)
>  		return 0;
> -	}
> +
>  	len = svc_print_xprts(tmpbuf, sizeof(tmpbuf));
> -	*lenp = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);
> +	len = memory_read_from_buffer(buffer, *lenp, ppos, tmpbuf, len);

Except now we're passing *lenp = 0, that can't be right.

Though I actually kind of prefer this to Colin King's patch which just
casts (*lenp) in the comparison below.

--b.

> +	if (len < 0)
> +		return len;
>  
> -	if (*lenp < 0) {
> -		*lenp = 0;
> -		return -EINVAL;
> -	}
> +	*lenp = len;
>  	return 0;
>  }
>  
> -- 
> 2.28.0
