From: Lucas Stach <dev@lynxeye.de>
Date: Mon, 04 Jan 2016 14:13:22 +0000
Subject: Re: [patch] drm/etnaviv: unlock on error in etnaviv_gem_get_iova()
Message-Id: <1451916802.6048.6.camel@lynxeye.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104131024.GA13563@mwanda>
	 <20160104135445.GD19062@n2100.arm.linux.org.uk>
In-Reply-To: <20160104135445.GD19062@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Am Montag, den 04.01.2016, 13:54 +0000 schrieb Russell King - ARM
Linux:
> On Mon, Jan 04, 2016 at 04:10:24PM +0300, Dan Carpenter wrote:
> > We have to drop a lock before returning -ENOMEM here.
> > 
> > Fixes: a8c21a5451d8 ('drm/etnaviv: add initial etnaviv DRM driver')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diffstat missing?
> 
> In any case, the patch is correct, thanks.
> 
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> 
> Lucas,
> 
> I guess you'll be picking this patch up, or shall we ask David to
> take
> it directly?
> 
I'm still on vacation until Wednesday, but after this I'll start to
sort through the outstanding etnaviv requests that need attention. I'll
pick up this patch along with some other things that I need to send out
for review and will issue a pull to Dave then.

Regards,
Lucas
