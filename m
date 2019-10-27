From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 27 Oct 2019 19:55:48 +0000
Subject: Re: [PATCH] drm/tinydrm: Fix memroy leak in hx8357d_probe
Message-Id: <85cb5ed9-66ba-3461-dd56-017b89ba70ce@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191027173234.6449-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191027173234.6449-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

…
> +++ b/drivers/gpu/drm/tiny/hx8357d.c
> @@ -232,44 +232,49 @@ static int hx8357d_probe(struct spi_device *spi)
…
> +		goto free_dbidev;
>
>  	spi_set_drvdata(spi, drm);

I got another development concern here.
Can it make sense to pass the variable “dbidev” instead of “drm”?


…
> +free_dbidev:
> +	kfree(dbidev);
…

I became curious if there is a need for such a memory release at another place.
How do you think about to add this function call also to the implementation
of the function “hx8357d_remove”?

Regards,
Markus
