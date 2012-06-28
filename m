From: Alex Williamson <alex.williamson@redhat.com>
Date: Thu, 28 Jun 2012 22:24:52 +0000
Subject: Re: [patch 2/3] vfio: make count unsigned to prevent integer underflow
Message-Id: <1340922292.3179.58.camel@ul30vt>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120628064458.GB11107@elgon.mountain>
In-Reply-To: <20120628064458.GB11107@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2012-06-28 at 09:44 +0300, Dan Carpenter wrote:
> In vfio_pci_ioctl() there is a potential integer underflow where we
> might allocate less data than intended.  We check that hdr.count is not
> too large, but we don't check whether it is negative:
> 
> drivers/vfio/pci/vfio_pci.c
>    312          if (hdr.argsz - minsz < hdr.count * size ||
>    313              hdr.count > vfio_pci_get_irq_count(vdev, hdr.index))
>    314                  return -EINVAL;
>    315
>    316          data = kmalloc(hdr.count * size, GFP_KERNEL);
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 300d49b..86ef2da 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -347,7 +347,7 @@ struct vfio_irq_set {
>  #define VFIO_IRQ_SET_ACTION_TRIGGER	(1 << 5) /* Trigger interrupt */
>  	__u32	index;
>  	__s32	start;
> -	__s32	count;
> +	__u32	count;
>  	__u8	data[];
>  };
>  #define VFIO_DEVICE_SET_IRQS		_IO(VFIO_TYPE, VFIO_BASE + 10)

Good find.  I've actually trickled this through to change a number of
the function params to unsigned from int.  Also in this struct, start
should be unsigned.  Thanks for the report!

Alex

