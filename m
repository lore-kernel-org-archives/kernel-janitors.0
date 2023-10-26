Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6657C25B6F
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Oct 2023 09:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjJZJab (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Oct 2023 05:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZJaa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Oct 2023 05:30:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15386184
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 02:30:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso5353915e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Oct 2023 02:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698312626; x=1698917426; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JzN3kghX0r8zpxRcc0ENszPUJaJiNNkjOsgmWnftG5k=;
        b=uUIIzoj6LhQ3YkhL2X6FbtyyDNz/xxhHdXFh3ZNTbxiDVxO74olbEZX9mPoSGafYoT
         bm3Qvsoo4UwMeTEMINeb1aucCRt8H+tOL07nnlPzyAUr9JPxsnHhUAmIddTN/W16Tdgo
         FJu5EEDISp6iV4vSgicXnLoP63yPvy4+E64mfvgtub4tFC8L2JKoKkqx7pxbsqqVzXh0
         prf9xjb6Qoxrm74ho3EP+2rsiNw1wDGbWy4gXLoMJcBXt89MFxhtoi2oY5b5uAJFP1c7
         vPEyR4RAf1CG/txpb/j6WmQ03+LxiEPN3o0bMtnKtmbiwdvkEZazaru9djKFU5NFTujw
         oa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312626; x=1698917426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzN3kghX0r8zpxRcc0ENszPUJaJiNNkjOsgmWnftG5k=;
        b=XRM5X2xDT6re+3FWT5w5QpJ1XucQymImeBPV+nB1lB1Feo1ImbE6EIMglrly1cco6l
         vxIjDMCg+Yl/jUg7NEmnbDl/QUwGzrhOqdy4+Y9r3BssObpcs25+9h9aqRV0KEmflZnm
         JH/RXX5kuJn21FcWBpFdm4WA8wKVRI8Xj6mm+E74fPdtWz34+bFe8xa5l6PlyHBo79wO
         xe7QkpyvVXXI2+6M7J6AdK4cIlUImD7uc+LDr2ncJ1DxGVrzs0HxAopILpkiTvTSjAKm
         JTI1GFwCJbzulPopES/NFAQYutYB93XydHWDtISctzc/rgbOLsGBHbfM3nluig/lvwdW
         nBqg==
X-Gm-Message-State: AOJu0YwVsax39a/R4k+0oSpGC0HR0PAz7FVrji7v45SIlccHc3WL974L
        qoRau7YeP0CHK3IuYuENqB8TXQ==
X-Google-Smtp-Source: AGHT+IFbCJ2aNN5hfs6KLklgeQ8R+R7dBY0KqY6VDKCiFgk6oQIaJA1xQzDXWqNVc6p9WIW1ERMmVw==
X-Received: by 2002:a5d:4b4b:0:b0:32d:8401:4057 with SMTP id w11-20020a5d4b4b000000b0032d84014057mr11785427wrs.15.1698312626501;
        Thu, 26 Oct 2023 02:30:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p17-20020a5d68d1000000b0032d687fd9d0sm13842098wrw.19.2023.10.26.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 02:30:26 -0700 (PDT)
Date:   Thu, 26 Oct 2023 12:30:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     lukas@wunner.de, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        daniel@ffwll.ch, tiwai@suse.de, Jim.Qu@amd.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] vga_switcheroo: Fix impossible judgment condition
Message-ID: <6a5f2bff-cef4-4287-b72d-0db91c850de4@kadam.mountain>
References: <20231026091804.967960-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026091804.967960-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 26, 2023 at 05:18:04PM +0800, Su Hui wrote:
> 'id' is enum type like unsigned int, so it will never be less than zero.
> It's better to check VGA_SWITCHEROO_UNKNOWN_ID too.
> 
> Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - add check of VGA_SWITCHEROO_UNKNOWN_ID(Dan's suggestion). 
> 
> By the way, all functions of 'get_client_id' will never return error code
> or VGA_SWITCHEROO_UNKNOWN_ID，should we remove this check or keep it for
> future.
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

