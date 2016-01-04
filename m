From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Mon, 04 Jan 2016 13:54:45 +0000
Subject: Re: [patch] drm/etnaviv: unlock on error in etnaviv_gem_get_iova()
Message-Id: <20160104135445.GD19062@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104131024.GA13563@mwanda>
In-Reply-To: <20160104131024.GA13563@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

On Mon, Jan 04, 2016 at 04:10:24PM +0300, Dan Carpenter wrote:
> We have to drop a lock before returning -ENOMEM here.
> 
> Fixes: a8c21a5451d8 ('drm/etnaviv: add initial etnaviv DRM driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diffstat missing?

In any case, the patch is correct, thanks.

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

Lucas,

I guess you'll be picking this patch up, or shall we ask David to take
it directly?

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
