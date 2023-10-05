Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC90E9270B
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 14:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237311AbjJEOi6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbjJEOgv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 10:36:51 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45BE43515
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 07:02:08 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-317c3ac7339so961704f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514521; x=1697119321; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbcoAiVjWZW5P7u3ypsUZftXt7DOl7esx6TwnJ6vnvw=;
        b=yMXc8n8Ma24feUaJ3nLJnrS0/sGbDmkbKFvd+GTKldX6HJBvxOtBXW3kOm/33ahOOD
         /vvpehycvVDywf9zDD6Dkt540SotCRKB8LZq2HmkfAaohkUoFu6vZ8iriL8fY5yDi8zP
         m69riz4SWRJkH1eGwqwPFbXV9qjwGdlfX2xSzKaCmlIdi1FvKRVFBYH+ZyyiT3WZ/0/S
         BvXyoBjJf5/dFOmVkrnFDcKPjqHVpeEMlWGeHVx0OJmPQcQPlC7liMOidJLq4FFQvNWa
         EkZ1H3P+B01GQ0Smwwc0EOF4lDapKHx5WJ6yMtd4/F5TuVek7kOPHIZWxQUAXR9uYAo6
         kVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514521; x=1697119321;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbcoAiVjWZW5P7u3ypsUZftXt7DOl7esx6TwnJ6vnvw=;
        b=rioMjtev5FYj1QWfNX/V5AWX6/GPjTDY8oAdc+V3MMHT/nI++UCKg/BXrxbfjw/Q4Q
         gZ6616cK21uAUFx9HvA1H0UCSvUTGrx6TW3IWgm7mDoBF6x9UqvRsJvJRViioQsdDJtD
         ss9VBawesnGgX7ggn4qh5gfEGyTEHMoEfHmg8dCSHCIPuMkT0nkiH1Nsdb6iOuZPhBr9
         48IRmIeolpOyVfUOjKylfwStdXrKgInOCK/ciutVYNKC01wBzjABXyn7l6PQKAHvzH4Q
         T4Zo8xplATKrKSyUHz31m9S3CsDbIWHhi3c6tctI4pQf8bB7blgEVPUZpTMUQXKqlZmD
         8BAQ==
X-Gm-Message-State: AOJu0Yyr6vEMY5P3SiZpfOFxY6wAp7XrQQeTN18PQXFYeM8I17hnXzgd
        pkanyAy/mXjanPVOP560sE60Gg==
X-Google-Smtp-Source: AGHT+IFzMG84hWtgM7/kzXwiczHNUb5vU+sHKFOUOrM4aCWSY90+ZZWXEdv9Z3kAjAM3RZftvpszLg==
X-Received: by 2002:adf:f74a:0:b0:31a:d6cb:7f9d with SMTP id z10-20020adff74a000000b0031ad6cb7f9dmr4786129wrp.24.1696514520442;
        Thu, 05 Oct 2023 07:02:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d6052000000b003248a490e3asm1867036wrt.39.2023.10.05.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:02:00 -0700 (PDT)
Date:   Thu, 5 Oct 2023 17:01:57 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc:     Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
Message-ID: <d9da4c97-0da9-499f-9a21-1f8e3f148dc1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The clk_register_divider() and clk_register_mux() functions returns
error pointers on error but this code checks for NULL.  Fix that.

Fixes: b9e0d40c0d83 ("clk: keystone: add Keystone PLL clock driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/keystone/pll.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/keystone/pll.c b/drivers/clk/keystone/pll.c
index ee5c72369334..6bbdd4705d71 100644
--- a/drivers/clk/keystone/pll.c
+++ b/drivers/clk/keystone/pll.c
@@ -281,12 +281,13 @@ static void __init of_pll_div_clk_init(struct device_node *node)
 
 	clk = clk_register_divider(NULL, clk_name, parent_name, 0, reg, shift,
 				 mask, 0, NULL);
-	if (clk) {
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-	} else {
+	if (IS_ERR(clk)) {
 		pr_err("%s: error registering divider %s\n", __func__, clk_name);
 		iounmap(reg);
+		return;
 	}
+
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 }
 CLK_OF_DECLARE(pll_divider_clock, "ti,keystone,pll-divider-clock", of_pll_div_clk_init);
 
@@ -328,10 +329,12 @@ static void __init of_pll_mux_clk_init(struct device_node *node)
 	clk = clk_register_mux(NULL, clk_name, (const char **)&parents,
 				ARRAY_SIZE(parents) , 0, reg, shift, mask,
 				0, NULL);
-	if (clk)
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
-	else
+	if (IS_ERR(clk)) {
 		pr_err("%s: error registering mux %s\n", __func__, clk_name);
+		return;
+	}
+
+	of_clk_add_provider(node, of_clk_src_simple_get, clk);
 }
 CLK_OF_DECLARE(pll_mux_clock, "ti,keystone,pll-mux-clock", of_pll_mux_clk_init);
 
-- 
2.39.2

