Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA59C4332F
	for <kernel-janitors@archiver.kernel.org>; Mon,  9 May 2022 09:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiEIKD1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 9 May 2022 06:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236749AbiEIJ50 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 9 May 2022 05:57:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22FB1BDD80
        for <kernel-janitors@vger.kernel.org>; Mon,  9 May 2022 02:53:06 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1no03W-0001WQ-Nt; Mon, 09 May 2022 11:51:54 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1no03T-0007qR-OY; Mon, 09 May 2022 11:51:51 +0200
Date:   Mon, 9 May 2022 11:51:51 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sandy Huang <hjc@rock-chips.com>,
        Heiko =?iso-8859-15?Q?St=FCbner?= <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: unlock on error path in
 vop2_crtc_atomic_enable()
Message-ID: <20220509095151.GB4012@pengutronix.de>
References: <YnjZQRV9lpub2ET8@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnjZQRV9lpub2ET8@kili>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:51:12 up 39 days, 22:20, 93 users,  load average: 0.10, 0.11,
 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 09, 2022 at 12:05:05PM +0300, Dan Carpenter wrote:
> This error path needs an unlock before returning.

Indeed.

> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 0b49fed16535..b68922943825 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1524,6 +1524,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  	if (ret < 0) {
>  		drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
>  			vp->id, ret);
> +		vop2_unlock(vop2);
>  		return;
>  	}
>  
> -- 
> 2.35.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
