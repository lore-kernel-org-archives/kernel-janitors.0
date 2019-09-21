From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 21 Sep 2019 18:55:41 +0000
Subject: Re: [PATCH v3] drm: panel-lvds: Potential Oops in probe error handling
Message-Id: <20190921185541.GA32133@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911104928.GA15930@mwanda>
In-Reply-To: <20190911104928.GA15930@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

Hi Dan.

On Wed, Sep 11, 2019 at 01:49:28PM +0300, Dan Carpenter wrote:
> The "lvds->backlight" pointer could be NULL in situations where
> of_parse_phandle() returns NULL.  This code is cleaner if we use the
> managed devm_of_find_backlight() so the clean up is automatic.
> 
> Fixes: 7c9dff5bd643 ("drm: panels: Add LVDS panel driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v3: Use devm_of_find_backlight().  This version is quite a bit more
>     ambitious, and I haven't tested it so please review carefully.
Looks good.
Applied and pushed to drm-misc-next.

It will hit upstream not at this but next merge window.

	Sam
