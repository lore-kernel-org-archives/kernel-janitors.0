Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD3DC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 09:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345467AbiCHJuY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Mar 2022 04:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345461AbiCHJuW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 04:50:22 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368C7340EF
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 01:49:26 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id k24so18074948wrd.7
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 01:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tkgcK8ecZDBc70jdMa4zDKJRDRWY03o3rPLloJ/xBNM=;
        b=CTK9yN2t0kI7VgXrEVmOTtL8IKfSeXEg0FvDL3uDI899+ylaBe1y6FpDQTAOPHzAfT
         pPDqtWN7m83nZTRVEBCQSjdyImTfzOQ3z7g+I2Fi8MuYjfy1znIIm3/xjsFFB+GaAwuj
         05ZQGbKsq9nCBPP3nJxHxI/fyrr2LlqT9/sPOeGOHwsmJPYpZuVuuk4kkJU6dmwz4dse
         waRkLfrWvdMsjc0w3pLAI9Jto5VlK4oupDg+Xg/JZcb39dI7dxjvFVj/ErP29dNjltR/
         5l8537CKwqIVrea7SRGOT8VqSRLRz4ocRWwy6yOcFvi1H5xwbGIV6SZvrjApHIzYJlp7
         xSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tkgcK8ecZDBc70jdMa4zDKJRDRWY03o3rPLloJ/xBNM=;
        b=PRaU3nGrm2QCHgcWBpcIuErv2yHPvxNrfOL/D6sQX2AIlP0UzArtc+PfhpT/ZDBctG
         aQzSsqeeaBAZ6cPtCzXty4jEvnEeEeOcsUN1vIs+a5r+OGS29EVJGryXh7JBYL1VlwkY
         6lWHyLmbzByJoLbeZ+J5zwnWQ5P5yylsAHn2hyLfczd9PA/KgSeSmB3B1ODP+3zHjiWK
         qDRrFKGmSdl5duMYbaStLs9MB6V+TAtoXH0LXBueWitWf4Bk+kmEW9BM4BWk3iLLDcjW
         5lltaNwkAv7VRtKBHKfDyGMc0jYFcpn9k2BNEhXtzF9/SUN154UKStoY7541r4EFvDuB
         LtFw==
X-Gm-Message-State: AOAM531+hAEiEWdq7DYjLyd3kXkmb3kt17Nry0/58dXsnIbGICurn+fc
        2KAj4CqQqOxcdDHrKbLSO/X0QA==
X-Google-Smtp-Source: ABdhPJzu5ztwwSo4Mv9Dznx8FsQWqzTSnjzdm45GfvoBksxlgazbg25aWALOpjMpC3bJt+SB3BqiuA==
X-Received: by 2002:adf:b74b:0:b0:1ed:e1d3:e053 with SMTP id n11-20020adfb74b000000b001ede1d3e053mr11636346wre.131.1646732964772;
        Tue, 08 Mar 2022 01:49:24 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdd52000000b001f04e9f215fsm13036739wrm.53.2022.03.08.01.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:49:24 -0800 (PST)
Date:   Tue, 8 Mar 2022 09:49:22 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: rectify entry for ROHM MULTIFUNCTION
 BD9571MWV-M PMIC DEVICE DRIVERS
Message-ID: <YicmotR7h3HH6v3q@google.com>
References: <20220308085136.30753-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220308085136.30753-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 08 Mar 2022, Lukas Bulwahn wrote:

> Commit 983b62975e90 ("dt-bindings: mfd: bd9571mwv: Convert to json-schema")
> converts bd9571mwv.txt to rohm,bd9571mwv.yaml, but missed to adjust its
> reference in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Repair this file reference in ROHM MULTIFUNCTION BD9571MWV-M PMIC DEVICE
> DRIVERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Lee, please pick this minor non-urgent clean-up patch. Thanks.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
