From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 04 Apr 2019 20:05:41 +0000
Subject: Re: [PATCH 2/7] drm/meson: fix possible object reference leak
Message-Id: <07090eca-640f-830c-7e55-22a486cd0002@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1554307455-40361-3-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1554307455-40361-3-git-send-email-wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org

> @@ -720,13 +720,10 @@ static bool meson_hdmi_connector_is_available(struct device *dev)
>
>  	/* If the endpoint node exists, consider it enabled */
>  	remote = of_graph_get_remote_port(ep);
> -	if (remote) {
> -		of_node_put(ep);
> -		return true;
> -	}
> -
>  	of_node_put(ep);
>  	of_node_put(remote);

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/meson/meson_dw_hdmi.c?id=61de49cb596710b918f7a80839f0b6de2017bc32#n712

Can the order of these put calls matter (because of processor caches)?


> +	if (remote)
> +		return true;
>
>  	return false;

Would the use of a ternary operator be more succinct here?

+	return remote ? true : false;

Regards,
Markus
