Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C60C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Feb 2022 13:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238230AbiBONXE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Feb 2022 08:23:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238224AbiBONXA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Feb 2022 08:23:00 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79F1106626
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Feb 2022 05:22:50 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id p9so11562438wra.12
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Feb 2022 05:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OhoR4XATjA7zKN/RXHZHTsGzRsSVf9+O2oXzvEdltm4=;
        b=b37OwHeSwfGsU9K1T22xDFIAhKSKSenRPOPbaBz5dZ/gVxQWzkw8Y3f1IAXCFdvB5m
         +rSWAbEkBChDH+rt2BOUIkYYjYF1LSICd9lKhJIBHYcdADSvzXh1Gtm+OqkvSP1NqtEC
         G2mE+1Epjaafm5Q66Hno5vMzoyv3AhZXIFAoMK3NVIV+pK5/ssYk2jOK7jIou3xRnGdd
         kpGaGU3vcaN+DqVvayYZvOe6PnvMl98owWy9NR0ZvCmpYpJWiq0wys4JDCviEwdDf5Rj
         24EK3QIdRsEIulb0NtGI8z6Buh2SHfkNgIrxKGAISAyEDWGTW05NanSb53nDjsTn42Gi
         MiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OhoR4XATjA7zKN/RXHZHTsGzRsSVf9+O2oXzvEdltm4=;
        b=iEzBgzQK8kctPFqVDnUHJafj4GF2J70wAWiqJ915jYTft/Y8613hPJbRgpvomOvKU/
         xu7gfjQRbjeKqXbDLYM+90x2W0FhbaduTDj0ep4O5l6wAjF5DxKXnLDDnVVa6xtP+1i0
         Cj6n+JhaPESHHe7sjWYpFjYedbMB85EBg8u57/zwLwVmg3g21FdS/rAi5OFsYpaBM9MD
         77O+c4XNwYNzARYBUeHjfaOwuyNAZAy6/l7y1VuXTHk6ZT6EroG62PAan5woHk3K8tcu
         WXr95P3htk0rI3nXXyTX7TSoR7n1//zRV/JCij2NY38uICz0u1l/+b5Fb4VYwNC4Wo0E
         P9uw==
X-Gm-Message-State: AOAM530egqv6vIGSJMgjFt08WbcrB24x8bwtkSbMwzgtpomWelSug2xe
        34WKM08j+c9FRf1E1dWmvrBTsw==
X-Google-Smtp-Source: ABdhPJwcKJSqTBvxL+OpSByXJmDucyG0ZiWYSfuT5Cbu9ZCkArRBYTg7i2nkZMigKRRU51tW62ISkg==
X-Received: by 2002:a5d:484e:: with SMTP id n14mr3147271wrs.574.1644931369364;
        Tue, 15 Feb 2022 05:22:49 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id m31sm16135529wms.34.2022.02.15.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 05:22:48 -0800 (PST)
Date:   Tue, 15 Feb 2022 13:22:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] mfd: sta2x11: use GFP_KERNEL
Message-ID: <YgupJrUGnOh1vxr5@google.com>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
 <20220210204223.104181-10-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220210204223.104181-10-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 10 Feb 2022, Julia Lawall wrote:

> Pci_driver probe functions aren't called with locks held and
> thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> Problem found with Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/mfd/sta2x11-mfd.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
