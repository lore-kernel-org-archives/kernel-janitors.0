From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 22 Sep 2016 06:54:23 +0000
Subject: Re: [PATCH 00/14] GPU-DRM-OMAP: Fine-tuning for several function implementations
Message-Id: <3793871.zJbXxf8jdx@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <0ea38611-3d93-0ade-a1fb-f8cc2e0b8d61@users.sourceforge.net> <20160922064501.GF22164@dvetter-linux.ger.corp.intel.com>
In-Reply-To: <20160922064501.GF22164@dvetter-linux.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel@ffwll.ch>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thursday 22 Sep 2016 08:45:01 Daniel Vetter wrote:
> On Wed, Sep 21, 2016 at 06:35:59PM +0200, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 21 Sep 2016 18:28:38 +0200
> > 
> > Several update suggestions were taken into account
> > from static source code analysis.
> 
> For the next pile of driver patches _please_ talk with driver maintainers
> before starting to create&submit patches. Like I said I won't take them,
> and many of your changes are not clear-cut at all, so I expect many driver
> maintaines also won't take them. Again, your contributions are welcome,
> but blindly following suggestions from code checkers in drivers you cant
> test isn't really all that useful. At the scale you're doing it, I think
> it's mostly wasting everyone's time :( I'd like to avoid that.

I second that. After a very quick review, I see that the series splits related 
changes in multiple patches. I've already commented in reply to another series 
submitted by Markus that patches should then be combined. I will thus ignore 
this series completely for the time being.

> > Markus Elfring (14):
> >   Use kmalloc_array() in tiler_map_show()
> >   Replace another kmalloc() call by kmalloc_array() in tiler_map_show()
> >   Less function calls in tiler_map_show() after error detection
> >   Delete an unnecessary variable initialisation in tiler_map_show()
> >   Improve a size determination in dmm_txn_append()
> >   Improve a size determination in omap_dmm_probe()
> >   Rename a jump label in omap_dmm_probe()
> >   Rename a jump label in dmm_txn_commit()
> >   Delete an unnecessary variable initialisation in dmm_txn_commit()
> >   Use kmalloc_array() in omap_gem_attach_pages()
> >   Replace a kzalloc() call by kcalloc() in omap_gem_attach_pages()
> >   Move a variable assignment in omap_gem_attach_pages()
> >   Rename a jump label in omap_gem_new_dmabuf()
> >   Rename a jump label in four functions
> >  
> >  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 58 +++++++++++++--------------
> >  drivers/gpu/drm/omapdrm/omap_gem.c       | 44 +++++++++++-------------
> >  2 files changed, 49 insertions(+), 53 deletions(-)

-- 
Regards,

Laurent Pinchart

