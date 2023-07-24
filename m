Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49313C001DE
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Jul 2023 04:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjGXEx0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Jul 2023 00:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGXExZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Jul 2023 00:53:25 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F241BF
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Jul 2023 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690174400; x=1721710400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IMd4ymp81ERgjM37zJCHhqkuja1bu0TPTxGEMriEzWM=;
  b=PTuEb+B6RwvUfp6+eHJ3LB0Q8SB5CO6T24JNtWoMLrdyWKsvtVA1xWsR
   r17xlpQhG7C6ZmhxHa+lG9HL+mwVyyndi/nT+x6joh9pk+6CzQwx5dYvv
   P3IvYFVqx0ZbGExsO78lGcKZvhOvifvVjLUSSe9WhN0U01bdXxNOK/9rk
   3dTo57qKtw8ws9U3XshrH4A9IecBfYjFtaAb/cm0KAx2W+93Ix3B5kHvy
   VKczf5xepxIcg9sJiY4SAv1AO1L4oKi+VBb/FlQl8FznzZlkbjJznKC++
   Ar15CsglLt82iGyRzO9h4563lD/PrNYeaqZwJiq1hipEVOMDtHBwgFx45
   g==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32068515"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 06:53:18 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 884FD280078;
        Mon, 24 Jul 2023 06:53:18 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Clean up a call to request_irq()
Date:   Mon, 24 Jul 2023 06:53:18 +0200
Message-ID: <5697757.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1c921fe0-2758-44dd-85f3-2ef8eb6583bb@moroto.mountain>
References: <1c921fe0-2758-44dd-85f3-2ef8eb6583bb@moroto.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

Am Freitag, 21. Juli 2023, 16:56:17 CEST schrieb Dan Carpenter:
> This is calling request_threaded_irq() but the thread parameter is NULL
> so it's actually not a threaded irq.  Which is a bit misleading.  Call
> request_irq() instead.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> b/drivers/gpu/drm/bridge/samsung-dsim.c index 9b7a00bafeaa..9d81dbbc6680
> 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1637,8 +1637,8 @@ static int samsung_dsim_register_te_irq(struct
> samsung_dsim *dsi, struct device
>=20
>  	te_gpio_irq =3D gpiod_to_irq(dsi->te_gpio);
>=20
> -	ret =3D request_threaded_irq(te_gpio_irq, samsung_dsim_te_irq_handler,=
=20
NULL,
> -				   IRQF_TRIGGER_RISING |=20
IRQF_NO_AUTOEN, "TE", dsi);
> +	ret =3D request_irq(te_gpio_irq, samsung_dsim_te_irq_handler,
> +			  IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE",=20
dsi);
>  	if (ret) {
>  		dev_err(dsi->dev, "request interrupt failed with %d\n",=20
ret);
>  		gpiod_put(dsi->te_gpio);

This change looks good, but it seems worth using devm_ call instead (as a=20
separate patch probably). dsi->te_gpio is also requested per devm_ call, so=
=20
eventually samsung_dsim_unregister_te_irq could be removed if the IRQ is=20
device managed as well.

Despite that for this patch:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


