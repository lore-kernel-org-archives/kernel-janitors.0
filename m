Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A204C64ED6
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Mar 2023 09:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjCAJxV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjCAJxS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Mar 2023 04:53:18 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EC9B77A
        for <kernel-janitors@vger.kernel.org>; Wed,  1 Mar 2023 01:53:16 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7948777wmb.0
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Mar 2023 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1677664395;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=;
        b=4Fu+yqsl6ks1J0Fa92PUm/F/nDyDK9SWtP1VAUdZUy16GTC0Ap4+Lo4bksw5qTFdp/
         XsNyAQmjAl8OLy/XCzbzMGljtzJA5RtohMxMQbVwEHdOo6+DFLEe9dlfHUNM71Ex/476
         /CSZJ4bwXA6nhA+7i+fKCSxQFIJ9286JI0RWsHzb1KceA2OtY7h8MFa2v5g2xZhem/H1
         9QgNF/SXXxd3XgGRvGy+31KiyGPPaRyQ+yZZeNEDl/nqPYodHrmu1C34T0/Qnkg5yN0N
         DJ1KI1d6YUGaeQNTKcaGnfu59z9aqHlg0CKtgvHK8CjciShYLbXxTcuZeT7AjGXwzwLh
         +3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677664395;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVm2ijZ3wY3vwKPabNU+PBrwbUTBJBfFnL9ZZ4aBrfk=;
        b=rWV0XWCX6lTQj0KJWdznMbBvIBG+GqkiVQW/5a3LcdN4j7/bfBMGGXxF/U2ptQNR/W
         kpUAxNPpUEzZsf3z5o6XO9Psk4XJ4I84TLcSutXPwpesLmJmkAqhcUNuk8Ddpnv9vQ7w
         jEy3RTtNFbkvCrCTXQ/2Ew1tTTLNL5EV0CqbkjnY+loaTtG65dBReqOvPJ5mMSdWTlvI
         E9Vuor5v7220v7FgbGNOx967JCOOAN+MOudd/zj6QYHO+kJLjqsmVgI4qGoBkwPxRang
         qpyuRlRx0Q9YVmlKv4MInKZqroqRh1+smpdaJl7ChVPCU9hbSqZRx4ynE2k01v6WftVm
         9JQQ==
X-Gm-Message-State: AO0yUKWTMxGGT6hgGXiWZhd5qM/R08XliIEhqULhcSFNWPfxUSJYVSpf
        lmQajGaNvvJKanU7pLnO0YzKag==
X-Google-Smtp-Source: AK7set8CPzlU6u3WbrG+eMk2du/oZA+z3qcruE13b+PzUec0tOqk2HfBYdpjeyzDGptxwgKfIZvhuA==
X-Received: by 2002:a05:600c:3495:b0:3de:a525:1d05 with SMTP id a21-20020a05600c349500b003dea5251d05mr4728331wmq.8.1677664395119;
        Wed, 01 Mar 2023 01:53:15 -0800 (PST)
Received: from localhost ([2a01:cb19:85e6:1900:2bf7:7388:731d:c4e1])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm18765830wmi.10.2023.03.01.01.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:53:14 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dan Carpenter <error27@gmail.com>,
        Julien STEPHAN <jstephan@baylibre.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
In-Reply-To: <Y/yBC4yxTs+Po0TG@kili>
References: <Y/yBC4yxTs+Po0TG@kili>
Date:   Wed, 01 Mar 2023 10:53:13 +0100
Message-ID: <87r0u83iie.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dear Dan,

Thank you for your patch.

On lun., f=C3=A9vr. 27, 2023 at 13:08, Dan Carpenter <error27@gmail.com> wr=
ote:

> There is a type bug because the return statement:
>
> 	return ret < 0 ? ret : recv_cnt;
>
> will not return negatives on 64bit systems.  The problem is that the
> function returns ssize_t types, while "ret" is int and "recv_cnt" is a
> u32.  The negative values are type promoted to u32 and returned as
> positive values instead of negative error codes.
>
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during vide=
o mode")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..8e99981ca0e1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1016,12 +1016,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_=
dsi_host *host,
>  				     const struct mipi_dsi_msg *msg)
>  {
>  	struct mtk_dsi *dsi =3D host_to_dsi(host);
> -	u32 recv_cnt, i;
> +	ssize_t recv_cnt;
>  	u8 read_data[16];
>  	void *src_addr;
>  	u8 irq_flag =3D CMD_DONE_INT_FLAG;
>  	u32 dsi_mode;
> -	int ret;
> +	int ret, i;
>=20=20
>  	dsi_mode =3D readl(dsi->regs + DSI_MODE_CTRL);
>  	if (dsi_mode & MODE) {
> @@ -1070,7 +1070,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>  	if (recv_cnt)
>  		memcpy(msg->rx_buf, src_addr, recv_cnt);
>=20=20
> -	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
> +	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
>  		 recv_cnt, *((u8 *)(msg->tx_buf)));
>=20=20
>  restore_dsi_mode:
> --=20
> 2.39.1
