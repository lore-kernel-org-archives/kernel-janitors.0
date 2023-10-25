Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A0BC0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 09:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjJYJrm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 05:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234939AbjJYJr3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 05:47:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C5FD56
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 02:47:11 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c5056059e0so82867391fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698227229; x=1698832029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BpOpmDLtAqArpJSPKcIM3DaKWUTQYNNNS011ZdujvEw=;
        b=Iq/KdhrEHmJcP7/6L/768BdMyhM2Ljs/CVNOepkN+pmWpdZ0DIgqK4sLeRP4yYgd3i
         MCydtCv7tTd4+Hw75Ozu6rn1tKarhz9c+EwLP/6+Vkg6M/pw34cTr2KCH4/pS6D5feE5
         QFcMA3AFNGnj6MmSYNB1tUnlvDyM6LgV+XIs/wCblXdXiVti6lDpG0DcdYvyd3oDiVEy
         +1qTZc58ECZgRv1RoOlFqxUhLTLPdK7RobMXb0QXmGgUQ37H5wGqRaShSKOCFqgQTohR
         5TazsDpt1toQbFt2+Kyi8BETlHQ9Aew2blmVBxcjkzoupl0SAx7HZhS0JvBNHztV1m+k
         irFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698227229; x=1698832029;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpOpmDLtAqArpJSPKcIM3DaKWUTQYNNNS011ZdujvEw=;
        b=fc2oLJBj0Ko1WUavpvoETk1SsJF7kOz0XFsKk8s46BpzBbYSb6tBZ57cft16jPqtZu
         hXTGy4sImi3yPqVElMSQOeDThfjCBqsj6YjAJPfZPrZZbzlR8+3urAFM2BikcNBNrHCJ
         bBYbT5Z9kYrrIKpFUypDokb1MHdD1+FPVnCyWXuAOWTJGyvHPiqoFiy323H/cjA6jeDP
         bqOOnxUVU+czHXC5agN0sNddlLR6wTdKaOgAq51bKF4w6BJNGavuDhNh3Ks6CKEe0Rrd
         O+7UnLYA4Hioxc+5gCyKagU6ncjlAmIBq4XLUSe6994b4HUeJcj5uObpw5T/nLZyz0vq
         k6yQ==
X-Gm-Message-State: AOJu0YwgY13GPhNsuETsI5s4hPHFYlSnXNjv7/d44j4Q1jTFt+8MwwKj
        J7wBIu+3gXPCjGgqT+5+SEj3YA==
X-Google-Smtp-Source: AGHT+IFfoE5O1nQZ7hXWildQtNSnhIVdJ5jytEwleTyUMk9tayjcCN7BpnQ4sQx8gdWyCztiGvDZsA==
X-Received: by 2002:a05:651c:155:b0:2c5:2423:e225 with SMTP id c21-20020a05651c015500b002c52423e225mr10223859ljd.6.1698227229257;
        Wed, 25 Oct 2023 02:47:09 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e3612000000b002c503c2dc97sm2287970lja.64.2023.10.25.02.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:47:08 -0700 (PDT)
Message-ID: <2142be46-53e7-4e8d-956d-c82d1abb21a2@linaro.org>
Date:   Wed, 25 Oct 2023 12:47:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: remove unnecessary NULL check
Content-Language: en-GB
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <ZSj+6/J6YsoSpLak@kadam>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ZSj+6/J6YsoSpLak@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 13/10/2023 11:25, Dan Carpenter wrote:
> This NULL check was required when it was added, but we shuffled the code
> around and now it's not.  The inconsistent NULL checking triggers a
> Smatch warning:
> 
>      drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
>      variable dereferenced before check 'mdp5_kms' (see line 782)
> 
> Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Added a Fixes tag.  It's not really a bug fix and so adding the
> fixes tag is slightly unfair but it should prevent this patch from
> accidentally getting backported before the refactoring and causing an
> issue.
> 
> Btw, fixes tags are often unfair like this.  People look at fixes tags
> and think, "the fix introduced a bug" but actually it's really common
> that the fix was just not complete.  But from a backporting perspective
> it makes sense to tie them together.
> 
> Plus everyone introduces bugs.  If you're not introducing bugs, then
> you're probably not writing a lot of code.
> 
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

