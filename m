From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Apr 2019 15:01:23 +0000
Subject: Re: [PATCH 02/12] drm/tegra: rgb: add missing of_node_put after of_device_is_available
Message-Id: <564652ed-d398-33ae-0f05-088d1235bf9f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mukesh Ojha <mojha@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>

> @@ -221,8 +221,10 @@  int tegra_dc_rgb_probe(struct tegra_dc *
>  	int err;
>
>  	np = of_get_child_by_name(dc->dev->of_node, "rgb");
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>  		return -ENODEV;
> +	}
>
>  	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
>  	if (!rgb)

How do you think about to move this function call to an additional jump target
for the desired exception handling?

Regards,
Markus
