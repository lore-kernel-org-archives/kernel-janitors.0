From: Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 05 Dec 2017 18:26:45 +0000
Subject: Re: [PATCH] xen/pvcalls: check for xenbus_read() errors
Message-Id: <alpine.DEB.2.10.1712051026390.3403@sstabellini-ThinkPad-X260>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143843.hj7b4ayvbgf5ftzl@mwanda>
In-Reply-To: <20171205143843.hj7b4ayvbgf5ftzl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 5 Dec 2017, Dan Carpenter wrote:
> Smatch complains that "len" is uninitialized if xenbus_read() fails so
> let's add some error handling.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
> index 40caa92bff33..afa3f1b5d807 100644
> --- a/drivers/xen/pvcalls-front.c
> +++ b/drivers/xen/pvcalls-front.c
> @@ -1128,6 +1128,8 @@ static int pvcalls_front_probe(struct xenbus_device *dev,
>  	}
>  
>  	versions = xenbus_read(XBT_NIL, dev->otherend, "versions", &len);
> +	if (IS_ERR(versions))
> +		return PTR_ERR(versions);
>  	if (!len)
>  		return -EINVAL;
>  	if (strcmp(versions, "1")) {
> 
