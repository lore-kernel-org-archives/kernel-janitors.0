From: Andres Lagar-Cavilla <andreslc@gridcentric.ca>
Date: Sun, 09 Sep 2012 19:49:17 +0000
Subject: Re: [patch 1/3] xen/privcmd: check for integer overflow in ioctl
Message-Id: <61BA4F5D-682D-4D29-92E5-70299C0D9A70@gridcentric.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908095208.GA608@elgon.mountain>
In-Reply-To: <20120908095208.GA608@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andres Lagar-Cavilla <andreslc@gridcentric.ca>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On Sep 8, 2012, at 5:52 AM, Dan Carpenter wrote:

> If m.num is too large then the "m.num * sizeof(*m.arr)" multiplication
> could overflow and the access_ok() check wouldn't test the right size.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Andres Lagar-Cavilla <andres@lagarcavilla.org>
> ---
> Only needed in linux-next.
> 
> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> index 215a3c0..fdff8f9 100644
> --- a/drivers/xen/privcmd.c
> +++ b/drivers/xen/privcmd.c
> @@ -325,6 +325,8 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
> 			return -EFAULT;
> 		/* Returns per-frame error in m.arr. */
> 		m.err = NULL;
> +		if (m.num > SIZE_MAX / sizeof(*m.arr))
> +			return -EINVAL;
> 		if (!access_ok(VERIFY_WRITE, m.arr, m.num * sizeof(*m.arr)))
> 			return -EFAULT;
> 		break;
> @@ -332,6 +334,8 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
> 		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
> 			return -EFAULT;
> 		/* Returns per-frame error code in m.err. */
> +		if (m.num > SIZE_MAX / sizeof(*m.err))
> +			return -EINVAL;
> 		if (!access_ok(VERIFY_WRITE, m.err, m.num * (sizeof(*m.err))))
> 			return -EFAULT;
> 		break;

