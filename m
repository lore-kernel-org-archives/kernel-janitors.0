From: Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 28 Jun 2012 22:25:21 +0000
Subject: Re: [patch 3/3] vfio: return -EFAULT on failure
Message-Id: <1340922321.3179.59.camel@ul30vt>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120628064524.GC11107@elgon.mountain>
In-Reply-To: <20120628064524.GC11107@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2012-06-28 at 09:45 +0300, Dan Carpenter wrote:
> This ioctl function is supposed to return a negative error code or zero
> on success.  copy_to_user() returns zero or the number of bytes
> remaining to be copied.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 457acf3..1aa373f 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1159,6 +1159,8 @@ static long vfio_group_fops_unl_ioctl(struct file *filep,
>  			status.flags |= VFIO_GROUP_FLAGS_CONTAINER_SET;
>  
>  		ret = copy_to_user((void __user *)arg, &status, minsz);
> +		if (ret)
> +			ret = -EFAULT;
>  
>  		break;
>  	}

Yes, thank you!  I've folded all of these into the commits on my next
branch, so they should be cleaned up in tomorrow's tree.  Thanks for the
reports, please let me know if you find more.

Alex

