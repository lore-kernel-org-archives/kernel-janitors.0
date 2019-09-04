From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 12:57:04 +0000
Subject: Re: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-Id: <20190904125704.GC3093@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904100329.GE7007@mwanda>
 <20190904115057.GC4811@pendragon.ideasonboard.com>
In-Reply-To: <20190904115057.GC4811@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

On Wed, Sep 04, 2019 at 02:50:57PM +0300, Laurent Pinchart wrote:
> >  error:
> > -	put_device(&lvds->backlight->dev);
> > +	if (lvds->backlight)
> > +		put_device(&lvds->backlight->dev);
> 
> How about simply
> 
> -	put_device(&lvds->backlight->dev);
> +	backlight_put(lvds->backlight);

Yeah.  That's cleaner.  I will resend.

regards,
dan carpenter
