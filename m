From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 25 Feb 2016 11:33:55 +0000
Subject: Re: [patch] vfio/pci: return -EFAULT if copy_to_user fails
Message-Id: <20160225132107-mutt-send-email-mst@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225075212.GD7333@mwanda>
 <20160225111630-mutt-send-email-mst@redhat.com>
 <20160225110944.GH5273@mwanda>
In-Reply-To: <20160225110944.GH5273@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, Eric Auger <eric.auger@linaro.org>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Antonios Motakis <a.motakis@virtualopensystems.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 25, 2016 at 02:09:44PM +0300, Dan Carpenter wrote:
> On Thu, Feb 25, 2016 at 11:28:54AM +0200, Michael S. Tsirkin wrote:
> > On Thu, Feb 25, 2016 at 10:52:12AM +0300, Dan Carpenter wrote:
> > > The copy_to_user() function returns the number of bytes that were not
> > > copied but we want to return -EFAULT on error here.
> > > 
> > > Fixes: 188ad9d6cbbc ('vfio/pci: Include sparse mmap capability for MSI-X table regions')
> > 
> > Where's this commit? In which tree?
> 
> linux-next.  It only has Alex's signed off by.  So likely my patch will
> be folded in?
> 
> regards,
> dan carpenter

BTW, vfio repeats this in otherplaces.
I'll fix it up.

-- 
MST
