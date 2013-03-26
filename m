From: Alex Williamson <alex.williamson@redhat.com>
Date: Tue, 26 Mar 2013 15:03:02 +0000
Subject: Re: [patch] vfio-pci: integer overflow in vfio_pci_ioctl()
Message-Id: <1364310182.24132.728.camel@bling.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130326131358.GA11516@longonot.mountain>
In-Reply-To: <20130326131358.GA11516@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiang Liu <jiang.liu@huawei.com>, Vijay Mohan Pandarathil <vijaymohan.pandarathil@hp.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2013-03-26 at 16:13 +0300, Dan Carpenter wrote:
> The worry here is that a large value of hdr.start would cause a
> read before the start of the array and a crash in
> vfio_msi_set_vector_signal().
> 
> The check in vfio_msi_set_block() is not enough:
> 
> 	if (start + count > vdev->num_ctx)
> 		return -EINVAL;
> 
> A large value of "start" would lead to an integer overflow.
> 
> The check in vfio_msi_set_vector_signal() doesn't work either:
> 
> 	if (vector >= vdev->num_ctx)
> 		return -EINVAL;
> 
> Here "vector" is "count" casted to a signed int so it would be negative
> and thus smaller than "vdev->num_ctx" which is also a signed int.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis stuff.  Untested.
> 
> This patch is not beautiful.  There is probably a better limit to use if
> I knew the code.
> 
> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index acfcb1a..de54f69 100644
> --- a/drivers/vfio/pci/vfio_pci.c
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -371,6 +371,9 @@ static long vfio_pci_ioctl(void *device_data,
>  			    hdr.count > vfio_pci_get_irq_count(vdev, hdr.index))
>  				return -EINVAL;
>  
> +			if (hdr.start > INT_MAX - hdr.count)
> +				return -EINVAL;
> +
>  			data = memdup_user((void __user *)(arg + minsz),
>  					   hdr.count * size);
>  			if (IS_ERR(data))

Thanks Dan.  Is this more like what you're looking for?

commit 16deadb9d424c0af2162a5be2935fbc4e0f09b98
Author: Alex Williamson <alex.williamson@redhat.com>
Date:   Tue Mar 26 08:59:22 2013 -0600

    vfio-pci: Fix possible integer overflow
    
    The VFIO_DEVICE_SET_IRQS ioctl takes a start and count parameter, both
    of which are unsigned.  We attempt to bounds check these, but fail to
    account for the case where start is a very large number, allowing
    start + count to wrap back into the valid range.  Bounds check both
    start and start + count.
    
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
    Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index acfcb1a..866bde1 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -359,6 +359,7 @@ static long vfio_pci_ioctl(void *device_data,
 
 		if (!(hdr.flags & VFIO_IRQ_SET_DATA_NONE)) {
 			size_t size;
+			int max = vfio_pci_get_irq_count(vdev, hdr.index);
 
 			if (hdr.flags & VFIO_IRQ_SET_DATA_BOOL)
 				size = sizeof(uint8_t);
@@ -368,7 +369,7 @@ static long vfio_pci_ioctl(void *device_data,
 				return -EINVAL;
 
 			if (hdr.argsz - minsz < hdr.count * size ||
-			    hdr.count > vfio_pci_get_irq_count(vdev, hdr.index))
+			    hdr.start >= max || hdr.start + hdr.count > max)
 				return -EINVAL;
 
 			data = memdup_user((void __user *)(arg + minsz),


