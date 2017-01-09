From: Kirti Wankhede <kwankhede@nvidia.com>
Date: Mon, 09 Jan 2017 18:54:32 +0000
Subject: Re: [patch 3/3] vfio-mdev: remove some dead code
Message-Id: <b4067b37-f9af-78a6-a9a3-84a9834cf21d@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170107063008.GC26959@elgon.mountain>
In-Reply-To: <20170107063008.GC26959@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>


CC += Alex.

I think I wrote some code and then removed it, but forgot to remove this
code. Thanks for cleaning up.

Reviewed by: Kirti Wankhede <kwankhede@nvidia.com>

Thanks,
Kirti

On 1/7/2017 12:00 PM, Dan Carpenter wrote:
> We set info.count to 1 in mtty_get_irq_info() so static checkers
> complain that, "Why do we have impossible conditions?"  The answer is
> that it seems to be left over dead code that can be safely removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index 353666d68207..d6ddc31fa729 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -1230,9 +1230,6 @@ static long mtty_ioctl(struct mdev_device *mdev, unsigned int cmd,
>  		if (ret)
>  			return ret;
>  
> -		if (info.count = -1)
> -			return -EINVAL;
> -
>  		if (copy_to_user((void __user *)arg, &info, minsz))
>  			return -EFAULT;
>  
> 
