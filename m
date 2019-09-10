From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Sep 2019 13:32:26 +0000
Subject: Re: [PATCH v2] drm: panel-lvds: Potential Oops in probe error handling
Message-Id: <20190910133226.GD20699@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904115057.GC4811@pendragon.ideasonboard.com>
 <20190904185507.GA3634@mwanda>
 <20190908160428.GA20115@ravnborg.org>
In-Reply-To: <20190908160428.GA20115@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On Sun, Sep 08, 2019 at 06:04:28PM +0200, Sam Ravnborg wrote:
> Hi Dan.
> 
> On Wed, Sep 04, 2019 at 09:55:07PM +0300, Dan Carpenter wrote:
> > The "lvds->backlight" pointer could be NULL in situations were
> > of_parse_phandle() returns NULL.  Also it's slightly cleaner to use
> > backlight_put() which already has a check for NULL built in.
> > 
> > Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> A much better fix would be to introduce use of devm_of_find_backlight().
> Then you do not have to worry about put().
> 
> Care to respin a v3 that does this?

Sure.  That does look nice.  I will resend tomorrow.

regards,
dan carpenter
