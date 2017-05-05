From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Fri, 05 May 2017 07:14:15 +0000
Subject: Re: [PATCH] cxl: Unlock on error in probe
Message-Id: <a4c0a3f6-f631-0998-ddd0-ca2efd4f1bfd@au1.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505053622.0670F124037@b01ledav002.gho.pok.ibm.com>
In-Reply-To: <20170505053622.0670F124037@b01ledav002.gho.pok.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>

On 05/05/17 15:34, Dan Carpenter wrote:
> We should unlock if get_cxl_adapter() fails.
>
> Fixes: 594ff7d067ca ("cxl: Support to flash a new image on the adapter from a guest")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
> index 7c61c70ba3f6..37475abea3e6 100644
> --- a/drivers/misc/cxl/flash.c
> +++ b/drivers/misc/cxl/flash.c
> @@ -401,8 +401,10 @@ static int device_open(struct inode *inode, struct file *file)
>  	if (down_interruptible(&sem) != 0)
>  		return -EPERM;
>
> -	if (!(adapter = get_cxl_adapter(adapter_num)))
> -		return -ENODEV;
> +	if (!(adapter = get_cxl_adapter(adapter_num))) {
> +		rc = -ENODEV;
> +		goto err_unlock;
> +	}
>
>  	file->private_data = adapter;
>  	continue_token = 0;
> @@ -446,6 +448,8 @@ static int device_open(struct inode *inode, struct file *file)
>  		free_page((unsigned long) le);
>  err:
>  	put_device(&adapter->dev);
> +err_unlock:
> +	up(&sem);
>
>  	return rc;
>  }

sem is a global and it looks like it's intended to be held after 
device_open() returns and only released in device_close(), so this looks 
wrong.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

