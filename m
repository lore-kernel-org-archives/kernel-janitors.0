From: David Vrabel <david.vrabel@citrix.com>
Date: Mon, 10 Sep 2012 10:35:11 +0000
Subject: Re: [Xen-devel] [patch 1/3] xen/privcmd: check for integer overflow in	ioctl
Message-Id: <504DC25F.7000508@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908095208.GA608@elgon.mountain>
In-Reply-To: <20120908095208.GA608@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andres Lagar-Cavilla <andreslc@gridcentric.ca>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On 08/09/12 10:52, Dan Carpenter wrote:
> If m.num is too large then the "m.num * sizeof(*m.arr)" multiplication
> could overflow and the access_ok() check wouldn't test the right size.

m.num is range checked later on so it doesn't matter that the
access_ok() checks might be wrong.  A bit subtle, perhaps.

David

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Only needed in linux-next.
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 215a3c0..fdff8f9 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -325,6 +325,8 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
>  			return -EFAULT;
>  		/* Returns per-frame error in m.arr. */
>  		m.err = NULL;
> +		if (m.num > SIZE_MAX / sizeof(*m.arr))
> +			return -EINVAL;
>  		if (!access_ok(VERIFY_WRITE, m.arr, m.num * sizeof(*m.arr)))
>  			return -EFAULT;
>  		break;
> @@ -332,6 +334,8 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
>  		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
>  			return -EFAULT;
>  		/* Returns per-frame error code in m.err. */
> +		if (m.num > SIZE_MAX / sizeof(*m.err))
> +			return -EINVAL;
>  		if (!access_ok(VERIFY_WRITE, m.err, m.num * (sizeof(*m.err))))
>  			return -EFAULT;
>  		break;
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xen.org
> http://lists.xen.org/xen-devel

