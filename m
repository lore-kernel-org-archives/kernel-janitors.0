From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2016 18:27:07 +0000
Subject: Re: [PATCH] vfio: Fix handling of error returned by 'vfio_group_get_from_dev()'
Message-Id: <20161130182707.GV6266@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130070612.16073-1-christophe.jaillet@wanadoo.fr>
 <20161130093646.0c68f7be@t450s.home>
In-Reply-To: <20161130093646.0c68f7be@t450s.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>

On Wed, Nov 30, 2016 at 09:36:46AM -0700, Alex Williamson wrote:
> On Wed, 30 Nov 2016 08:06:12 +0100
> Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> > 'vfio_group_get_from_dev()' seems to return only NULL on error, not an error
> > pointer.
> > 
> > Fixes: 2169037dc322 ("vfio iommu: Added pin and unpin callback functions to vfio_iommu_driver_ops")
> > Fixes: c086de818dd8 ("vfio iommu: Add blocking notifier to notify DMA_UNMAP")
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> 
> Dan Carpenter proposed a nearly identical patch:
> 
> http://www.spinics.net/lists/kvm/msg141468.html
> 
> The difference is you return -ENODEV while Dan returns -EINVAL.  I tend
> to prefer -ENODEV to distinguish this error case versus validation of
> the other parameters.  This patch also identifies both commits
> introducing these, so I'm inclined to take this one rather than Dan's
> version.  Dan & Kirti, I welcome any credits you'd like to apply to
> this patch for identifying and reviewing the same issue.  Thanks,
> 

Could I get a Reported-by?

thanks,
dan carpenter

