Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D37C4167B
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Dec 2022 16:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbiLMQGa (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Dec 2022 11:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235081AbiLMQG1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Dec 2022 11:06:27 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2482124E
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Dec 2022 08:06:26 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id o5so16147230wrm.1
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Dec 2022 08:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+17KSocHAfVAywYOOTRQOtxymLub6BHceHrqciHTQo=;
        b=ZVG3yyD3fCCacHs2UId5CxWQspM4c1frz58kkce6R6/YWfz6YLPhFPlcXg+PKopdoo
         9BnX2QRf8I0oyUSJCEg6S3FRTguy0XSDF1ZzsdfBhIuLwr5W+imLJ6wd9cED7J1wqPrS
         S4v/d3qRIBm4nXl0RKyvoUJcfQ6STzQd+fVcimx6XDdqSJT5eZUshnbG+lxZH723GyKk
         vuA9qC4xo+0hxbSdn+wRCJKrNcrnoVRx+qCfLLgVn27NZcjBV3bMcwlazmPBWUiev2zN
         +L0hYS6IGdL8/2yxhK9lxqsuL0zbZdbITqWqVCayQLpPNTNPpzX4Mys4OBzuDQRpCPja
         G2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+17KSocHAfVAywYOOTRQOtxymLub6BHceHrqciHTQo=;
        b=UCGONRy3fw7tX6HlLNSlMM6QeUGeCnI65/K2xssVzglc9sQa77K6y9LMMA8E8xYJhV
         bfpG6Jsz0lE08d0m2awp4jg1jUr0jxwTQeKnV1qw7gTTn6UetXOv7BPQ6xMSwToQQbdd
         g50iV0pZC/hE6Zyt9n0tFVCLi5dyLXLewaBosJY70go56v6Zf7WDsOt2XBuv0HjpeLF1
         SF7fgqrRt3tggZj3QOA/HLsMKp9DqK4czyD2TPNv/iYald7mJkB0imrb1zrNjRNpwqq3
         7CgQQFYD6B63KmP/RM7rPEa3MxHXGxQMh2pkApq69MBpPY7VZJtVU2n4P8Gjtkk2qgIP
         gNvw==
X-Gm-Message-State: ANoB5pnT4L69xzd2kvc7h3CB5H5a/P5ccVkhyoAgivApyS+1uuciCciI
        YBxxCRfP5pM8HJnUhqJK6YwxmO/+dqgkPuqf
X-Google-Smtp-Source: AA0mqf5DMBGP0hsa4EQxhd3R6nEMQF0HnIsWKEYfgDX5pG0vnRxyQUUa01s0xBxGBFOaseubqmBdkg==
X-Received: by 2002:adf:9d8c:0:b0:241:fc02:f904 with SMTP id p12-20020adf9d8c000000b00241fc02f904mr14213135wre.71.1670947585464;
        Tue, 13 Dec 2022 08:06:25 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d4bd2000000b00236488f62d6sm143372wrt.79.2022.12.13.08.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:06:24 -0800 (PST)
From:   Colin Ian King <colin.i.king@gmail.com>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH 1/1] tracefile_tracecmd: add null return from fgets when EOF occurs
Date:   Tue, 13 Dec 2022 16:06:22 +0000
Message-Id: <20221213160622.338859-2-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213160622.338859-1-colin.i.king@gmail.com>
References: <20221213160622.338859-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Add a EOF check on fgets calls.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tracefile_tracecmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tracefile_tracecmd.c b/tracefile_tracecmd.c
index eda7b6b..9d38bc4 100644
--- a/tracefile_tracecmd.c
+++ b/tracefile_tracecmd.c
@@ -97,11 +97,12 @@ static struct cpuidle_datas * tracecmd_report_load(const char *filename)
 	/* Number of CPUs */
 	nrcpus = 0;
 	line = fgets(buffer, BUFSIZE, f);
+	if (!line)
+		goto error_close;
 	ret = sscanf(buffer, "cpus=%u", &nrcpus);
 	if (ret != 1)
 		nrcpus = 0;
 	line = fgets(buffer, BUFSIZE, f);
-
 	if (!line)
 		goto error_close;
 
-- 
2.38.1

