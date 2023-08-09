Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A1EC001E0
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Aug 2023 07:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjHIHkh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Aug 2023 03:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHIHkg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Aug 2023 03:40:36 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C7C1982
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Aug 2023 00:40:36 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe1d9a8ec6so3134875e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Aug 2023 00:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691566834; x=1692171634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYypbR2BOr8zET8GaPdSoOCjpxsQd82de6in9KdA03c=;
        b=UXJHIiWTBam0bGvsriQfntFFLIdoxWBcq4eh8xBIkyzRfhil6eZW+iIpaqq8jaggbC
         FxEnJRmj9H7pwLfwaUTp0QLVbvP0nUu36hid5c7v3xhDZzddCC3qkyYxenFSv1FLKLSY
         xj1uGW4TBrABTTPaxdA98pUBdOuz58/IN/95oMc5bndPIfy9fTkAeQhe4bloxGjOHvR8
         pzVKIitpBaILvRi9Mgo36GwJvqu096bAJ947klQ3uKnxwWzlO2+pyLYwFmLxPVAMvq9k
         rjChBWJnaiqSc+BtEbJ3Q02z/CYpZynYkwnFn4ta/lOIgOGFsQ4geJbEameWORSITokA
         ztjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691566834; x=1692171634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYypbR2BOr8zET8GaPdSoOCjpxsQd82de6in9KdA03c=;
        b=LrPZu37ViX9LE1cxYZrXRHdRJDPDYbkyNMrgUGh3Aliad6w/fQ4xK3ZsY2RyVmOkTV
         VZ+phyZAenrJILnBU6MNLsvDP/KLLTOU4d04cqaQ40Bk276m6xqtm11rlZlb8pZTiO4T
         jY+eRtM57MVfGENk7oaf7mQ6NkUyUV1x05whSkTnyCSiEY4NEJmDCNg4NHrX0JMoNaeR
         JzoYygY1NMipXrsYfBXv5ExyCiymKUH/vHAtV9t7e0fyVHgoIdutwrYUVGS3BvAQMSw8
         d5IyGwDmFlJI73qhXffBf5fDEmAMt6TW3xSLb1EPKe2Uj7s7/QgcXp1vylIwymz8bT2J
         igMg==
X-Gm-Message-State: AOJu0YwRmgiZIoo6fSofy7qXRnLQGg4e/Y/x1MM899vILkNFMutAKZmv
        Fylc+AJPCzOvNCOUqa36rbYTqA==
X-Google-Smtp-Source: AGHT+IGYAehkRoFOJds1BXJD9VgTewrLVWujc0R3IWoUImvJckfERYsfBHnUNMLnme6MWTwTT9pcAw==
X-Received: by 2002:a05:600c:1da2:b0:3fe:4c29:e626 with SMTP id p34-20020a05600c1da200b003fe4c29e626mr9532320wms.13.1691566834728;
        Wed, 09 Aug 2023 00:40:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x26-20020a1c7c1a000000b003fe24da493dsm1087148wmc.41.2023.08.09.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:40:34 -0700 (PDT)
Date:   Wed, 9 Aug 2023 10:40:30 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     tonyhuang.sunplus@gmail.com, lhjeff911@gmail.com,
        ulf.hansson@linaro.org, arnd@arndb.de, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, error27@gmail.com,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next v2 1/2] mmc: sunplus: Fix error handling in
 spmmc_drv_probe()
Message-ID: <d4eb3558-c270-4aea-94a8-b24b8d3a1987@kadam.mountain>
References: <20230809071812.547229-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809071812.547229-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 09, 2023 at 12:18:11AM -0700, Harshit Mogalapalli wrote:
> When mmc allocation succeeds, the error paths are not freeing mmc.
> 
> Fix the above issue by changing mmc_alloc_host() to devm_mmc_alloc_host()
> to simplify the error handling. Remove label 'probe_free_host' as devm_*
> api takes care of freeing, also remove mmc_free_host() from remove
> function as devm_* takes care of freeing.
> 
> Fixes: 4e268fed8b18 ("mmc: Add mmc driver for Sunplus SP7021")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/a3829ed3-d827-4b9d-827e-9cc24a3ec3bc@moroto.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with smatch, only compile tested.
> 
> v1->v2: Simplify code by using devm_mmc_alloc_host() instead of
> mmc_alloc_host() (Ulf Hansson's suggestion)

Nice.

Both patches look good to me.
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

