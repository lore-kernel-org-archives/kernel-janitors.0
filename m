From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Apr 2019 20:42:32 +0000
Subject: Re: [PATCH 4/7] drm/omap: fix possible object reference leak
Message-Id: <b34cb17c-aa74-3b15-5469-f7a1ba417d36@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554307455-40361-5-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554307455-40361-5-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Yi Wang <wang.yi59@zte.com.cn>

> @@ -208,8 +208,10 @@  static int __init omapdss_boot_init(void)
>
>  	dss = of_find_matching_node(NULL, omapdss_of_match);
>
> -	if (dss == NULL || !of_device_is_available(dss))
> +	if (dss == NULL || !of_device_is_available(dss)) {
> +		of_node_put(dss);
>  		return 0;
> +	}

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c?id=61de49cb596710b918f7a80839f0b6de2017bc32#n203

Can it be nicer to add a jump target here?

+	if (!dss || !of_device_is_available(dss))
-		return 0;
+		goto put_node;


>
>  	omapdss_walk_device(dss, true);
>
> @@ -234,6 +236,7 @@  static int __init omapdss_boot_init(void)
>  		kfree(n);
>  	}
>

+put_node:

> +	of_node_put(dss);
>  	return 0;
>  }


Regards,
Markus
