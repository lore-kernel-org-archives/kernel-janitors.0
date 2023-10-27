Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90089C25B47
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 04:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjJ0Eid (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Oct 2023 00:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjJ0Eic (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 00:38:32 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9E11BD
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 21:38:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-991c786369cso259641066b.1
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 21:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698381508; x=1698986308; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=frH4yJkEgXqgTfgCib1fGkByILTuSnogO/76sANZ2P8=;
        b=k13Y7N4OvbzEuf5AQB1U4YvwaEky/UTiPMGzqGF5LUSWVZz7ANdWoSYDLeAHv73T7G
         nLwTAqO7DbK4MBS4BF7wAJG29teNRwhGHip+2O6zuO0S90YgrgSNZ0E1KHHRPNTHk1mY
         IGqHeXzBYmT4DsO7twVCaJtx0bjgdpPMkSxLQ19QSuHXggjhoBGEHzlIEE4BCAL8KX2t
         pMtPfhOEjk1JzKdLwSWWv0k0gjuybdknM+tdP4o3ZcwSmVK/iZPIwp25CsUADMIkE1UQ
         Eg9jPRaL+L9DPGa8ppgEXe1iQjYYzQdN+4txf21931FkFERzYbT7JFK5sMbGKz1ypwWE
         LLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698381508; x=1698986308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frH4yJkEgXqgTfgCib1fGkByILTuSnogO/76sANZ2P8=;
        b=ecFGmGFpJSy8sx4zXAd2dJDFFwTwHz0F0q4eiFrU20fJtgV5xcMP8zmd2kod6mVNCO
         8/xXIkeAknSlUEotIfc81P9LxTUtbykZUozO1TPhJLEQhM3gVf4pPkJLRflanIQ/94jz
         SYlNIzzsn0rUtUPXyxaVEY1jNPrFsoUSG5RebghBcc6tUcRRWsTvxqbho1Z+9ewh+5X0
         N2VtFZYDVfXonS/4M/kWco8Zy3acbgkZZCpNLG7U5JhT3BscdzWCUbaQygEJsH2dsGQl
         mrxGJIJ1dOJ5f8NXNLsL5I6dm8FVenchcIAgIdTvEL71IT5XmJkZpHGzceQWClffqYud
         CWcw==
X-Gm-Message-State: AOJu0YwEJj3GpS75k2w3xBxPv45Pfmgd089DTsx/DyxWWbMiDYH8xej2
        VWhUuEFrGHVbRJJHhVEBS40vtA==
X-Google-Smtp-Source: AGHT+IGjJa1LbVHYTYwKBrD6xiKfLTzfmk9anQXCBhZgPDmOxIx1s+7SIDPmGxGpMNXP+CVvj5zJbA==
X-Received: by 2002:a17:907:7baa:b0:9be:705:d7d0 with SMTP id ne42-20020a1709077baa00b009be0705d7d0mr1427154ejc.0.1698381507653;
        Thu, 26 Oct 2023 21:38:27 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id lf19-20020a170906ae5300b009ad89697c86sm556618ejb.144.2023.10.26.21.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 21:38:27 -0700 (PDT)
Date:   Fri, 27 Oct 2023 07:38:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org, roblip@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soc: aspeed: lpc: Fix impossible judgment condition
Message-ID: <b0fb2821-42e2-40e1-88f4-0a697cdb2a97@kadam.mountain>
References: <20231027020703.1231875-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231027020703.1231875-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 27, 2023 at 10:07:04AM +0800, Su Hui wrote:
> smatch error：
> drivers/soc/aspeed/aspeed-lpc-snoop.c:169
> aspeed_lpc_snoop_config_irq() warn: platform_get_irq() does not return zero
> 
> platform_get_irq() return non-zero IRQ number or negative error code,
> change '!lpc_snoop->irq' to 'lpc_snoop->irq < 0' to fix this.
> 
> Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

