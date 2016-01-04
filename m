From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Mon, 04 Jan 2016 14:34:32 +0000
Subject: Re: [patch] drm/etnaviv: unlock on error in etnaviv_gem_get_iova()
Message-Id: <20160104143432.GF19062@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104131024.GA13563@mwanda>
 <20160104135445.GD19062@n2100.arm.linux.org.uk>
 <1451916802.6048.6.camel@lynxeye.de>
In-Reply-To: <1451916802.6048.6.camel@lynxeye.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <dev@lynxeye.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, Jan 04, 2016 at 03:13:22PM +0100, Lucas Stach wrote:
> Am Montag, den 04.01.2016, 13:54 +0000 schrieb Russell King - ARM
> Linux:
> > On Mon, Jan 04, 2016 at 04:10:24PM +0300, Dan Carpenter wrote:
> > > We have to drop a lock before returning -ENOMEM here.
> > > 
> > > Fixes: a8c21a5451d8 ('drm/etnaviv: add initial etnaviv DRM driver')
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diffstat missing?
> > 
> > In any case, the patch is correct, thanks.
> > 
> > Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > 
> > Lucas,
> > 
> > I guess you'll be picking this patch up, or shall we ask David to
> > take
> > it directly?
> > 
> I'm still on vacation until Wednesday, but after this I'll start to
> sort through the outstanding etnaviv requests that need attention. I'll
> pick up this patch along with some other things that I need to send out
> for review and will issue a pull to Dave then.

I'm not aware of any other changes which are outstanding for etnaviv.
If we're supposed to be working together, would you mind sharing them
with the other etnaviv authors?

Note that the merge window is probably opening next Sunday, and that's
really tight to get development into maintainers trees, especially as
the final -next prior to the merge window will involve pulling trees
around midnight (GMT) on Thursday.

I also have a pile of patches, but they're development stuff, which I'm
holding off until we get etnaviv merged into mainline - I'd suggest
treating everything that same way at this point, and only ask David to
merge changes which are fixes - exactly like this one.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
