From: walter harms <wharms@bfs.de>
Date: Thu, 28 Jun 2012 07:15:12 +0000
Subject: Re: [patch 1/3] vfio: signedness bug in vfio_config_do_rw()
Message-Id: <4FEC0480.7010508@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120628064425.GA11107@elgon.mountain>
In-Reply-To: <20120628064425.GA11107@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 28.06.2012 08:44, schrieb Dan Carpenter:
> The "count" variable is unsigned here so the test for errors doesn't
> work.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
> index a4f7321..10bc6a8 100644
> --- a/drivers/vfio/pci/vfio_pci_config.c
> +++ b/drivers/vfio/pci/vfio_pci_config.c
> @@ -1487,7 +1487,7 @@ static ssize_t vfio_config_do_rw(struct vfio_pci_device *vdev, char __user *buf,
>  		if (perm->readfn) {
>  			count = perm->readfn(vdev, *ppos, count,
>  					     perm, offset, &val);
> -			if (count < 0)
> +			if ((ssize_t)count < 0)
>  				return count;
>  		}
>  

hi,
I can only find a few references to vfio_config_do_rw(). From the patchit seems to me this is a wrapper
for perm->readfn since both return ssize_t so why i count unsigned in the first place ?

re,
 wh

