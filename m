Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FA9E784A4
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Oct 2023 07:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235657AbjJBHFK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Oct 2023 03:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235656AbjJBHFJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 03:05:09 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1903A6
        for <kernel-janitors@vger.kernel.org>; Mon,  2 Oct 2023 00:05:04 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso24822981e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Oct 2023 00:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230303; x=1696835103; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3WSZwdkcjvjhe/gpQ76zvJY2T86inbO4LfRqWd0a6w=;
        b=ksWP/7+mKfoT3XgCC8dSHq1yVW+YAzhXLiSqv+lFg+MMbnn8OoaZaFeasaC/YQY0GX
         hCJA0/c8c+uEXLGcyGd/sTf0lBfqdhQ9h6HgkOjefqvO0D8fHnE6hf95oSKZ3vtY+cTy
         vAYFa9mGRieVXYt6VsYeiWmrh1jXhmxahpeCnsdtbbMauvip132/ePrXm6VaxDHC0OBF
         rhM3tuNRyPv4BCczZMWYekwiA0JXo8omg0KamZyhydAGH8u5dNvzM6WSXJPygcHB4Yj2
         DzhO5DThzqRomVA5Jp2baM+AsgEkfRBv1AqoZdHmf7uaQWfgL87aq1BNfA5rDuKLJ7RP
         O7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230303; x=1696835103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3WSZwdkcjvjhe/gpQ76zvJY2T86inbO4LfRqWd0a6w=;
        b=bFp5Mxt9IRenySTTBuq+imoNPqn88cEYGW1sD7IkuugUirQ0k/J32WL9yq/MjnCsZz
         Td/Mw2xAp4Q/g2kfpAhs4BlTNXrme5/W9Dqy89QCTLbo5b1uZhw12/bfFtPjKw0PWnQO
         QCRtuO1GM1rMO80/GUmXzGXdxgkULYaVofbkaQmU17QWsK2J4hcm/9odOylS1bFJkZVP
         kYAkB0QEpbPnL5rlVXPOiiuIStZM0J870eoo+Q/4qvyegj+Ia+EbDmM8AzGQiSMKvlwK
         fnFSqwCWCU65BmFc7gcwx41oCl8KxtwzdMV7xHk4/P78LeUhNc2u1ONmobuS9YMekKIO
         8zOg==
X-Gm-Message-State: AOJu0YySo0lzRqZsnPa8tCIJsBgeTyKxyx4ftn4REXQbyQ53et3igoRz
        dN3C++HAXf0ZN9y6vCsuX0zccA==
X-Google-Smtp-Source: AGHT+IGwerErhtnDVzz1WhrfkBcTpmotFSKxSZgpYhF5J+JqODTofqGXeokFOz10GvBV3SwrupD0uQ==
X-Received: by 2002:a05:6512:691:b0:504:7ff8:3430 with SMTP id t17-20020a056512069100b005047ff83430mr9907489lfe.10.1696230303039;
        Mon, 02 Oct 2023 00:05:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b00405d9a950a2sm6256010wmq.28.2023.10.02.00.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:05:02 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:04:59 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ARM: omap2: fix a debug printk
Message-ID: <c126dc33-233a-4776-806f-9dff0e73a181@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The %pR format string takes a pointer to struct resource, but this is
passing a pointer to a pointer which it will print wrong information.

Fixes: c63f5b454885 ("ARM: omap2: Use of_range_to_resource() for "ranges" parsing")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm/mach-omap2/omap_hwmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 1e17b5f77588..ba71928c0fcb 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2209,7 +2209,7 @@ int omap_hwmod_parse_module_range(struct omap_hwmod *oh,
 		return err;
 
 	pr_debug("omap_hwmod: %s %pOFn at %pR\n",
-		 oh->name, np, &res);
+		 oh->name, np, res);
 
 	if (oh && oh->mpu_rt_idx) {
 		omap_hwmod_fix_mpu_rt_idx(oh, np, res);
-- 
2.39.2

