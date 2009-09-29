From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 29 Sep 2009 12:07:48 +0000
Subject: Re: [PATCH] video/omap:  adding __init/__exit macros to various
Message-Id: <alpine.LSU.2.00.0909291401060.9280@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200909290318.07309.PeterHuewe@gmx.de> <20090929091853.GC9536@localhost>
In-Reply-To: <20090929091853.GC9536@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Imre Deak <imre.deak@nokia.com>
Cc: ext Peter Huewe <PeterHuewe@gmx.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Andrew Morton <akpm@linux-foundation.org>, Krzysztof Helt <krzysztof.h1@wp.pl>, Jonathan McDowell <noodles@earth.li>, Arnaud Patard <arnaud.patard@rtp-net.org>, Mike Wege <ext-mike.wege@nokia.com>, "Doyu Hiroshi (Nokia-D/Helsinki)" <hiroshi.doyu@nokia.com>, "linux-fbdev-devel@lists.sourceforge.net" <linux-fbdev-devel@lists.sourceforge.net>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, 29 Sep 2009, Imre Deak wrote:

> > Trivial patch which adds the __init/__exit macros to the module_init/
> > module_exit functions of the following drivers in media/omap:
> > drivers/video/omap/lcd_ams_delta.c
> > drivers/video/omap/lcd_mipid.c
> > 
> > Please have a look at the small patch and either pull it through
> > your tree, or please ack' it so Jiri can pull it through the trivial tree.
> > 
> > linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009
> > 
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> 
> Acked-by: Imre Deak <imre.deak@nokia.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
