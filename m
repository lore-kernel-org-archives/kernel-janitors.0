Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01E9CD80D0
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Oct 2023 13:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjJJNfl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Oct 2023 09:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbjJJNfj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Oct 2023 09:35:39 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B8AB7
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 06:35:32 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40537481094so52686985e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 06:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696944931; x=1697549731; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aw6UgjAaJ8qgdoYorSKFrZHMQyZGneinKTuRi4ShVJM=;
        b=YVLLAT5osZiogBgOw0c+ojKV+UqOqDiOv1IhJBWW++yYXUnbrH2a2UWSTW2fzZRGcc
         va/uTmRxNLd8HpNiRniwz2QE0GUsvMpFVFJdbnPTpgSOmyt85bgeEUDAQdm6AVcFqG13
         NKTdrkCjMT6ReKxlaNd0faulxSryLq3n2PMBWwS+GTIgrNF9A0+5+vJdmNR/3xPINfTp
         /ktLdu1WNUquIVVxxb4lq58oDhD5ljcjBqRobNpMkWWOJAlT31oswncDjMZTkyG/1uDn
         u88/YjUUp1ZCZWAP3REiqV75hFP5ocp8DBqotDFusMgh5Cu1CmLP9lxLwuK8WEN1Kdvj
         XqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944931; x=1697549731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw6UgjAaJ8qgdoYorSKFrZHMQyZGneinKTuRi4ShVJM=;
        b=JuEXSj2eqUU7whct+M40oZHVCVd6X5GJRGFcyO0qazM0SKQqLPGIjTXHiHoDdp32b5
         isGAbf4lnlR0aubugowgkAKiBmY7zyP6B6eodp1eZfD2L9A+ZNjn9G5hoEP7ZlxFpL5u
         /j+b9pJzVn5BudGTmcyPNfdtXNBTQ4LmeUlQZLD59xN0A1hi05yPeBLTtSKfcs+QABgh
         k0GpK83dvZ7K2OjfwQsSfa1GSWyszkqexVNvn9zwZLXI1jBuChQ6YYd1RJdXm5jz4avs
         9l5mTonxRWi9Nil61KWH/Pd9mtKJd4PR4hZpEbdPBtDcKIGRVvNvLq6qBnJG97xXe1mI
         6xlg==
X-Gm-Message-State: AOJu0Yw1Lf4aqE/iUYvptFrMCbTcinO1w0Z6VLUXHByUqa7fKlcJeb32
        Gu40bbkwbcF253oNxn7IAWM5Bg==
X-Google-Smtp-Source: AGHT+IFw0S6b8g/kvtjWSB5E2ensCP7thl7P6ePtjXo8nKPhrToH5H95gZBpPNqgpHUyhd5SXj2FaQ==
X-Received: by 2002:a05:6000:1f87:b0:32d:24c7:a268 with SMTP id bw7-20020a0560001f8700b0032d24c7a268mr1899178wrb.4.1696944931382;
        Tue, 10 Oct 2023 06:35:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020adfcd89000000b00317f70240afsm12596738wrj.27.2023.10.10.06.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:35:31 -0700 (PDT)
Date:   Tue, 10 Oct 2023 16:35:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: stm32: Fix a signedness issue in
 clk_stm32_composite_determine_rate()
Message-ID: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The divider_ro_round_rate() function could potentially return -EINVAL on
error but the error handling doesn't work because "rate" is unsigned.
It should be a type long.

Fixes: 06ed0fc0fbac ("clk: stm32: composite: Switch to determine_rate")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/clk/stm32/clk-stm32-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index d5aa09e9fce4..067b918a8894 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -431,7 +431,7 @@ static int clk_stm32_composite_determine_rate(struct clk_hw *hw,
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
 	const struct stm32_div_cfg *divider;
-	unsigned long rate;
+	long rate;
 
 	if (composite->div_id == NO_STM32_DIV)
 		return 0;
-- 
2.39.2

