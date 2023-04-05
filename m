Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68ADCC6FD1D
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 Apr 2023 01:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbjDEBAo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Apr 2023 21:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236737AbjDEBAe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Apr 2023 21:00:34 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CD04ED6
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Apr 2023 18:00:06 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h25so44591129lfv.6
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Apr 2023 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680656403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcoiMrViDnZHlrKyL7yBvDwh3HgZ08tXcqNo5+Sq0gY=;
        b=IhVO4NXV9rPbDyCa4YIAqIVWEciYhWbG6JqaO5Qk9pT113glq332E9MZCWmHicRTms
         Roe+goawdwXsFvBDJq9fpq/q1C28ctHI5vmQJ3AbLTdVZgpbFH3itOZKc0TqBhJx1Jvh
         L0PRYGLb+/rs0C+j/UyzfTocqeBj0mPNaDQps7EtJegZ0OPv6KT/9ds5c90BtpHmyEKc
         Qr5uNO5eFNODRPWuY8Zp3dl+KDKaSyc0JHNa2ihMDoMAideoxkQtlLBSKdmnOqYVPcjj
         74tOPAsNd/pSB4kqFZvF7H1Ih8J3miAU/rnktCfh8idyPgNFzj88PXG31YHpOzwPU4eP
         dncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680656403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcoiMrViDnZHlrKyL7yBvDwh3HgZ08tXcqNo5+Sq0gY=;
        b=rMSVJjW3lxgTqBF6r5tOFWKePHmHlcKjtv2Yk/NXgCuewUpc4tTgJEHV3p6bJsq0Nf
         Zk8a+EXDDvJGCu9rLq7B7RHNkME2qTyPJJHuwwMKeOxTeHurU4oSrDsh9s/duuEgmEXY
         XSqTqB8V81+HMD+YzAh/nbKKsrEEZm16kkHTY7qPqoo6OY7U4Ss1j/hT7DdrwhKZMJdv
         SF8OoJtUfodHGgpQTzXCO2yC00esPrv7bT6ZK5C1gY+EmK8YUuUMQOUsk+0VeuNsQG4F
         XL/BKjmKGczbA858yny3BiPUBUlKYtL4grGjtX46ZKc3DnGryBTh3EgymU3UDeOJiziC
         eqvQ==
X-Gm-Message-State: AAQBX9e/bxf5foUy2ebEnsovqqlQ6K5iZjBEw0oYRyMpB/7MtsQjhJmn
        sTiIMbM20utmuF7j7LjDb8rC/g==
X-Google-Smtp-Source: AKy350bk28Ecr3+zl0vqVdiKvr+VWBUTdlhCWa7xakZAat4a+MhCn21kqM0agi3rq3dRhXJewwoLgg==
X-Received: by 2002:a19:c50b:0:b0:4e9:a75b:cccb with SMTP id w11-20020a19c50b000000b004e9a75bcccbmr1149700lfe.28.1680656402964;
        Tue, 04 Apr 2023 18:00:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w9-20020ac24429000000b004eaf6181a32sm2570310lfl.75.2023.04.04.18.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 18:00:02 -0700 (PDT)
Message-ID: <8a87358e-e17e-eb2f-4a21-082bb272537c@linaro.org>
Date:   Wed, 5 Apr 2023 04:00:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH][next] drm/msm/mdss: Fix spelling mistake "Unuspported" ->
 "Unsupported"
Content-Language: en-GB
To:     Colin Ian King <colin.i.king@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230329093026.418847-1-colin.i.king@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329093026.418847-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 29/03/2023 12:30, Colin Ian King wrote:
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

