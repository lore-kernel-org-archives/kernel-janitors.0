From: Juergen Gross <jgross@suse.com>
Date: Tue, 18 Jul 2017 07:00:20 +0000
Subject: Re: [PATCH] xen/pvcalls: NULL dereference in error handling
Message-Id: <8cc9622e-9bf5-5d90-4e52-e6068795f78b@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712072506.3lzevgfwuzgs5u2s@mwanda>
In-Reply-To: <20170712072506.3lzevgfwuzgs5u2s@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/07/17 09:25, Dan Carpenter wrote:
> We accidentally dereference "map" when it's NULL.
> 
> Fixes: b535e2b9b78a ("xen/pvcalls: implement connect command")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The patch is okay, but the very same one has already been sent before.
I'll take the first one.


Juergen

> 
> diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
> index d6c4c4aecb41..01b690e1e555 100644
> --- a/drivers/xen/pvcalls-back.c
> +++ b/drivers/xen/pvcalls-back.c
> @@ -424,7 +424,7 @@ static int pvcalls_back_connect(struct xenbus_device *dev,
>  					sock);
>  	if (!map) {
>  		ret = -EFAULT;
> -		sock_release(map->sock);
> +		sock_release(sock);
>  	}
>  
>  out:
> 
> 

