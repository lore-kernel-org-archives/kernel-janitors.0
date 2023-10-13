Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A8CCDB47E
	for <kernel-janitors@archiver.kernel.org>; Fri, 13 Oct 2023 08:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjJMI0R (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 13 Oct 2023 04:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbjJMI0Q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 13 Oct 2023 04:26:16 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9550EB8
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 01:26:14 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32d9b507b00so408989f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Oct 2023 01:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697185573; x=1697790373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5lZIjZUIrHJnpE4t/QLHPx/DZrADcMrWtR2aEpPyl1M=;
        b=m/H5A8bZDZWC9XS0kjvzIxh7AD8n01mY0hyH495b5/jTTJ/VBmxDDYr6QX1I+t0we8
         AWYkZG1xC9wM8bG7KY261BGZTrFCwdeBT19iDlnYqp27Rt4I79FSlWV/hLT9D11s7/Wd
         BQ+OmKX23HJo5HaUhhBcANcz9klLTk3Tb8MzUHh8OqIEiFzhR320qgg7/JOv0upqJNgL
         7iTWndLFYY3oVbpIFRTw0jIZXvK+bLa12kqjkIkrbljfvNSWO1oo0or866sQMlIx8Ify
         ipr4GbG2CDsEOjfvti+MRHAbk7Xx4RcfFRU3XhM9vtDcXIAHgIshGLKlToweIPZ9aJid
         fcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697185573; x=1697790373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lZIjZUIrHJnpE4t/QLHPx/DZrADcMrWtR2aEpPyl1M=;
        b=L0ylE/fjF2d7O4IvsnSBvuubtepCI4kYb2lZU0njCgqmWHfv9z8p3WpkTTjp6Bi2RI
         vLvRHEjMaBjov/iyeqbp5ifUn0EivYmDNGMdKw8kf/YO6ntf0eVoqNqKU4oHI3YocmcF
         +3ZMisIBI104mSVVv3un13NUKRORajxF1cpTxmboXTggNM/layKL5sR3xDdhiQbOGF4x
         1TKxjFrBYrteoVzxB68rCHWIArxFPtGYw+ckkh45DBXGjOIoMNQuAVEbkn2WkOzLY/w0
         XciEp/YoBJTJwBCWVVUCYLiAPw+QmDgcwzEud4rCER37+lKJHcYB+1RCsc6Iv2JfiJ82
         RY9A==
X-Gm-Message-State: AOJu0YxuqmGiRc41eb1JOl2aE9arjSn7EeqPAHJsiVviL3ma72FIUy/D
        GB9pCwqHm+qAovBeBc7ndm5ODg==
X-Google-Smtp-Source: AGHT+IHFwmu2jkp0Wem5odeef0kN4MbW9MLkLDGoEmUDINiSFC1xy+l7yDeEAV6+kZu/zr8QTLnrOw==
X-Received: by 2002:adf:eac6:0:b0:32d:9a7c:56ed with SMTP id o6-20020adfeac6000000b0032d9a7c56edmr1164992wrn.10.1697185573035;
        Fri, 13 Oct 2023 01:26:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d4dc4000000b003253523d767sm3778669wru.109.2023.10.13.01.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:26:12 -0700 (PDT)
Date:   Fri, 13 Oct 2023 11:26:10 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove unnecessary NULL check
Message-ID: <2ac432ce-b253-41c9-9814-19e2afafad5c@kadam.mountain>
References: <5de18b71-c3db-4820-b35e-262b4cac35fc@moroto.mountain>
 <20231013080149.hbcuxww6w362g6xh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013080149.hbcuxww6w362g6xh@pengutronix.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 13, 2023 at 10:01:49AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 13, 2023 at 10:17:08AM +0300, Dan Carpenter wrote:
> > This NULL check was required when it was added, but we shuffled the code
> > around in commit 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation
> > to the _probe function") and now it's not.  The inconsistent NULL
> > checking triggers a Smatch warning:
> > 
> >     drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
> >     variable dereferenced before check 'mdp5_kms' (see line 782)
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> LGTM
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> This patch opportunity is valid since commit 1f50db2f3e1e
> ("drm/msm/mdp5: move resource allocation to the _probe function") but
> applies to older trees (where it introduces a bug).
> On one hand it's not really a fix, but maybe still add a Fixes: line to
> ensure it's not backported to older stables? Hmm, I don't know.

Sure.  Being extra safe is good.

regards,
dan carpenter

