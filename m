Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4889C77B75
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbjDSOaR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbjDSOaI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 10:30:08 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BFFE51
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:30:06 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f178da21b2so16192925e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914604; x=1684506604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ni3+BhGYpUbFRLKSCJqNygsIimCAcxR5gLGgrVw7e5Y=;
        b=CXPBEw0jSq4hLVUup1BH+bXbOdblxen/0Nmgo9d+wVtMjzfm5mrO4Tx82gJgDsQoix
         q2OwenCNBTNgQDaJvOh+Jy+As5fnRv2BFsFUOeOk28xMqHOf4DGvQ3jRHPtzQp22RRoz
         Lv6DYWcGaG9Zy9xuSy9B9ucAHaexitfm39gB+e4WA07+XD2aP0ab/ZWNVwYmNlU0X0d/
         pTuVrqqs88Q2j53Ck4q5AxAs4MuyVnXJinzV9RMUi7C+GUyFLRNzkvv1YA0glDWVgktM
         bx/ckxPGDJtwzk3zMurSWJPRKZsl91BDJLlvxm22AVVcnxSWBDmoNMx/yDKC7BoNvPnm
         HfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914604; x=1684506604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ni3+BhGYpUbFRLKSCJqNygsIimCAcxR5gLGgrVw7e5Y=;
        b=fKBXEA4CqspjMq9eGcu0n5dEBpHi6YLb5ZIDKJ4IxRi5CBFt3Rus6jCRssXZ7rpiha
         kaHuqa0jBN+YTGSvj/aLeoNkL7YxtglwwMyNM5FJHgpCT4iwTEZEYvJmYcPOxTK1MxrU
         7Ww9hmNTSIei6X+vWHo8swDPS342Tx6vP4nai7coe8HR++Hn+ldSMx+Ahw8th7oPO4D9
         FrZDrLwHzfyQYygvOuuQ9urVON7Voa9ddjbdgvEWLjSisIYTo3UhrLkMcNsOissTa7Ac
         keT3Mr4Wp/Kws2tPkmta1fkoDM62g3JxMF3kAEM0ZS9Zm41lBQ5Bk4t/pDGFBwxuCv6J
         q3aQ==
X-Gm-Message-State: AAQBX9c6kygEKNMtq79vmVEDX3KnQ1EZO6VT6yNgoBG475TO99kndcbk
        dvRAm+tT70908vkvyjE3CmTkog==
X-Google-Smtp-Source: AKy350a0yvlTT83g+7iqiTCqHfdCC1SzQdzwZOvoQsgpaLJ3j6dmKiiBhArK+tmSfLfIAjo8yrowvQ==
X-Received: by 2002:adf:f184:0:b0:2f8:96f5:cb0f with SMTP id h4-20020adff184000000b002f896f5cb0fmr5038874wro.23.1681914604353;
        Wed, 19 Apr 2023 07:30:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d4fcc000000b002f22c44e974sm15925157wrw.102.2023.04.19.07.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:30:03 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:30:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hte: tegra-194: Fix off by one in tegra_hte_map_to_line_id()
Message-ID: <92a6a5cb-3a89-4c06-a91e-438cfda76fae@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "map_sz" is the number of elements in the "m" array so the >
comparison needs to be changed to >= to prevent an out of bounds
read.

Fixes: 09574cca6ad6 ("hte: Add Tegra194 HTE kernel provider")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I think map is tegra194_aon_gpio_map and map_sz is
ARRAY_SIZE(tegra194_aon_gpio_map) but I wasn't able to follow the code
all the way through.  Untested.

 drivers/hte/hte-tegra194.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 49a27af22742..d1b579c82279 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -251,7 +251,7 @@ static int tegra_hte_map_to_line_id(u32 eid,
 {
 
 	if (m) {
-		if (eid > map_sz)
+		if (eid >= map_sz)
 			return -EINVAL;
 		if (m[eid].slice == NV_AON_SLICE_INVALID)
 			return -EINVAL;
-- 
2.39.2

