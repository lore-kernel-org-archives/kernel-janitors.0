Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774ADC7EE25
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 23:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbjFGXdg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 19:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjFGXdf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 19:33:35 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB5B2689
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 16:33:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f505aace48so74458e87.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686180812; x=1688772812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN4pp9fb5TWIMsqp3d9VNESt/WcsddcSpSKGD0lW3Qo=;
        b=FH75676ycuQq9EAzdrKVKWs5LzowZmXbypYaZY/A2T7G0/+KjbSday6hzkfIFkL68/
         aUvUkK2+YXuRJj6cNIFU4MdDhJ74dFftIvl9rKHkfE/GovkJL6oDki9AGPht4DO2fBde
         Ic6eD9XT3hfxahv5lC8Za5t6/2eZsIl/9/4cOvC2nkyf527sncfx7cu3sTpoiIbjN0N2
         hzsG3QRkHYFzuxSht/R3P/d7BrpSwSLq0iPUBTP1totpVxLADbW4335z5FpwPp1Af5GR
         BGPjXl8MwOPU0ogoM8cDDuXDDr3vWyIksyzwOk6KwWvYO8xxNQr8YsoH3TeivdzcvItN
         hBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180812; x=1688772812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN4pp9fb5TWIMsqp3d9VNESt/WcsddcSpSKGD0lW3Qo=;
        b=CVwDbMMLhw4x1ZfoI3mXXZFydd9UQ7Y16VaBuFjqkBJISNG2gtDi7szU4/dI/mySSA
         MbKw6SDrR1q99d/RTVIaK6gBbY+jdqBIEhe+qvQHHXR6FKlDe5+SRWMwT0P3JcSfOpaT
         KmQj6DqRW+2xn9w1defh1riBJfrK8XDy6JGS7gqognJ1FR4Nx3nFqERYNYxUrIkF8f6H
         0Ws7+tv9aX3Bc3zI7lxjEbJM6AJXyVvqhoM9gK2NpFORBtp2VqQGZL4Sp/zkHUA+L1bi
         iY0+KnAixj0v04xe0ArkxEvy/DEysgp1ssKxxOXTXy7++5V2mpZqy2lFW+uynFWZNa7q
         nurA==
X-Gm-Message-State: AC+VfDwuzB+Dn10b1ntxuDcrdYIlwi7ksrKc8sDFOcvgjKFjWXcEypUW
        Lj0NWT3oF25wSAjlNBDUS9DVWg==
X-Google-Smtp-Source: ACHHUZ7DDz75h1c5ySi2EzigAvLkdaMJCBg/qI57xGd90LVlStQKU5y/JYOalBn5h+xtR9kXeECIug==
X-Received: by 2002:ac2:59dc:0:b0:4f5:bc59:6f21 with SMTP id x28-20020ac259dc000000b004f5bc596f21mr2455945lfn.12.1686180812387;
        Wed, 07 Jun 2023 16:33:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25631000000b004f001b0eda2sm1951199lff.56.2023.06.07.16.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 16:33:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Date:   Thu,  8 Jun 2023 02:33:30 +0300
Message-Id: <168618077607.1883603.4945564571594085795.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZH7vP2Swu8CYpgUL@moroto>
References: <ZH7vP2Swu8CYpgUL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


On Tue, 06 Jun 2023 11:33:03 +0300, Dan Carpenter wrote:
> The "vsync_hz" variable is unsigned int so it can't be less
> than zero.  The dpu_kms_get_clk_rate() function used to return a u64
> but I previously changed it to return an unsigned long and zero on
> error so it matches clk_get_rate().
> 
> Change the "vsync_hz" type to unsigned long as well and change the
> error checking to check for zero instead of negatives.  This change
> does not affect runtime at all.  It's just a clean up.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: tidy up some error checking
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e7a2cf8e058e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
