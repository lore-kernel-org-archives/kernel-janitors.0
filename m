Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759DEC77B73
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 07:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbjEVHsv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 03:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbjEVHsb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 03:48:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E301BE9
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 00:47:07 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3078cc99232so5413485f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741576; x=1687333576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIVk01vUE32Fs5xmh6uGF+YSpQzTcY9OgG1aTov+WQM=;
        b=aJRU56KCSo3rpIlXDTIxgutOm21kKy4pCK66q+4n23HGRVPpaHZ5t/IbiMDcg7xCuv
         4GCem5qCSVC6EYh9WGOI8/10GlUS5tuxOR2nUWxbeeJF167/MDDiSn4dWSw0S+LLy31t
         CF/ABoFrh40zfGyBbPC+qXy3UqY4m4fe6+D/rlof4kyKWHt2VEZRsXwcoONP6Dheffpk
         BbXo0EkS57WXREeM5uUaCQh+FhxLv2bVH34MMgZRF7x01Sj2FVKrqsB9bLYAK8y8+o74
         LSFCN5M2zDH3pSfwQpdZPksdF7Cs7/6XzjjGKsqE2zouxyHOWZNyA4v9LbT7x5WN9ET+
         NcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741576; x=1687333576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIVk01vUE32Fs5xmh6uGF+YSpQzTcY9OgG1aTov+WQM=;
        b=fJWWB30tYJMN7HOd1ZimSrzBZaKk4FZ+3y2u7P/Oywfs2UbUI8Y/PfZYvfsQDvotGm
         Uw+P5mA8AK/+iqHB6/aYF+LynrOGWSxSyKOxXyqlHAnGvac4jWR0MX8CzGyyZc24QGM+
         LMuqOpkl6Pzu46J7cUooXfYZi52xA70tHz/4maOIxXyKm9ieFLk8IM3JpFS7JPsmeOfw
         cvOdtiXplfV0qSjViauV2nsdcOdk96hHXixhTooCVFUz4pAwnRfYTKG2ZDz9qyQi4Tl/
         oeRxUXAElLlxSofKlqIE7HC8mMN3SOt5hzW3ODPIiQ1v5SGPwKACQ+nYv0uLUf0N70sL
         XKvg==
X-Gm-Message-State: AC+VfDzgDEGXw5ro2qDlfYHK9tkCF5oMPRJVDG4QzlB6DQoqnQtJ9w7x
        gHK5oQmcCuKjQJUP13KjRVOsFw==
X-Google-Smtp-Source: ACHHUZ5WPY0s+puoCLwPIv3+dZIthZntG1qO8mejkYgqwA0xER2gHbAwLfhkvLu0SZTyKxPKdCZmfw==
X-Received: by 2002:adf:de10:0:b0:306:2dd6:95d3 with SMTP id b16-20020adfde10000000b003062dd695d3mr8301383wrm.22.1684741576394;
        Mon, 22 May 2023 00:46:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d53c2000000b002ffbf2213d4sm6816964wrw.75.2023.05.22.00.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:46:15 -0700 (PDT)
Date:   Mon, 22 May 2023 10:46:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: stm32: Fix error code in stm32_rproc_parse_dt()
Message-ID: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a cut and paste bug so this code was returning the wrong
variable.  It should have been "ddata->hold_boot_rst" instead of
"ddata->rst".

Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0e322697d210..a7457777aae4 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
 	if (IS_ERR(ddata->hold_boot_rst))
-		return dev_err_probe(dev, PTR_ERR(ddata->rst),
+		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
 				     "failed to get hold_boot reset\n");
 
 	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
-- 
2.39.2

