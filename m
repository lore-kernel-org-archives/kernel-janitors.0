From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jan 2021 07:34:18 +0000
Subject: Re: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in vmw_setup_pci_resources()
Message-Id: <20210126073418.GV2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6FMboLhnE3uSvb@mwanda>
 <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
In-Reply-To: <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Roland Scheidegger <sroland@vmware.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Martin Krastev <krastevm@vmware.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>

On Mon, Jan 25, 2021 at 07:13:43PM +0000, Zack Rusin wrote:
> 
> 
> > On Jan 25, 2021, at 03:45, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > The devm_memremap() function never returns NULL, it returns error
> > pointers so the test needs to be fixed.  Also we need to call
> > pci_release_regions() to avoid a memory leak.
> > 
> > Fixes: be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, Dan.
> 
> I have a patch based on your report that fixes that too but it comes with a refactoring. I’d be happy to rebase it on top of yours just to get yours in before. If you’d like I can push your patch through drm-misc-next, if not:


No no.  Sorry, just apply your patch and drop mine.  The problem is that
the report I sent was from kbuild and I do my devel work on a different
system so it's harder to track those emails and I forgot.

Looking at it now, the bug report I sent earlier was only for the
pci_release_regions() and not the NULL vs error pointer.  The kbuild
bot is not using full cross function analysis so it can't find those
bugs.  My dev system does much slower builds so it's a tradeoff.

regards,
dan carpenter
