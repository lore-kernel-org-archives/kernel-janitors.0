From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Apr 2019 21:05:03 +0000
Subject: Re: [PATCH 5/7] drm/pl111: fix possible object reference leak
Message-Id: <439634be-1704-703f-f975-98909b950224@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554307455-40361-6-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554307455-40361-6-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Yi Wang <wang.yi59@zte.com.cn>

> @@ -337,17 +338,20 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  		pdev = of_find_device_by_node(np);
>  		if (!pdev) {
>  			dev_err(dev, "can't find the sysreg device, deferring\n");
> +			of_node_put(np);
>  			return -EPROBE_DEFER;
>  		}
>  		map = dev_get_drvdata(&pdev->dev);
>  		if (!map) {
>  			dev_err(dev, "sysreg has not yet probed\n");
>  			platform_device_put(pdev);
> +			of_node_put(np);
>  			return -EPROBE_DEFER;
>  		}

How do you think about to move duplicate statements to an additional
jump target for the desired exception handling?

Regards,
Markus
