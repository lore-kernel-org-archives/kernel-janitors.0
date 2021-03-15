Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6FEC43333
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 16:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 987D464EEC
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 16:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhCOQFY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Mar 2021 12:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbhCOQFK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Mar 2021 12:05:10 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53431C06174A;
        Mon, 15 Mar 2021 09:05:10 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id si25so11450959ejb.1;
        Mon, 15 Mar 2021 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=r9LP/tsFzZ8MYPssrX+y5sd2TJ37PShfUnojAwfrghI=;
        b=GPJrEuAm2uDk7iHHwMFByl+5PU+3/HyfH4kV2ltXJLEzvEXshZpe6hAAn0MTYtAAqe
         974+BSvrAVe0uVIYK7R9NkAfxKu10sujUI+TQTP6K0jkttKWM/6JnJoWZ0v+0bnagcCu
         ToYmtOAXF/SsEa0z5RoVkE6LmcVx9auoIHCuw4jmjUW+JcmwA+URWyRAsXEVyAK5170P
         OKh75QDrpJ+1BKcq1S8aar8uJh5plHXSQ3OOc2fbKEyg63lUrZe8la5EhchI4ISCMeEf
         6mH9OAmnzGF/+FpW3yew1azCv5FdUfRmaK8GDkjw5F2BHdcDk2VwDiMdViiya90obHhL
         BQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=r9LP/tsFzZ8MYPssrX+y5sd2TJ37PShfUnojAwfrghI=;
        b=lNp5d/gfPjl4HCTyg1z4xxTc9rd5FtP9ZkBotkYJRXpNmZwDipiYLfv+lKinAvfGkz
         BD/7aoJgiwpCTbJ/Q/VrsJ795PtG2bUkaF7x5HAFXAvwRQ/Nih6k4Yh1BPzc58dr0N2V
         jJbGNONvRfGIql/+qHXTQjsEdXeanFqE044gy/R9Y7FfZ0TjyM2NC6Xcv7u5oBFX/lyh
         vRCy8kna6v/cqNd/+7xXar3SiSrdURXXm8CH8SQ38wTjZqG2zCStqAEEH2Y8bGObSTLJ
         EOFFPVwpG3Ka/s/HyMP8z4YZDZ74Vx1mo2ZF+kHzLHvY1Nt2ZVcyR3XwlxncjO+6XX/l
         /GxQ==
X-Gm-Message-State: AOAM531X4/OtsC8PF68W2Q9a8JSURUszhBjwZAkVbEcbg+aqmzcQXTOg
        f7HOeJFuSLNt3UI4iKgbAwM=
X-Google-Smtp-Source: ABdhPJy3nQSjthrLKV0qMhG/0pCwR/cepqyD7Qe0LZWovC/qzWcMRJEne0rJfD8wDV01/uillTJPMQ==
X-Received: by 2002:a17:907:94c3:: with SMTP id dn3mr24625236ejc.280.1615824309036;
        Mon, 15 Mar 2021 09:05:09 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d28:c000:5c39:c910:15c8:a935])
        by smtp.gmail.com with ESMTPSA id z17sm7748510eju.27.2021.03.15.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:05:08 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yu Chen <chenyu56@huawei.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 3/5] MAINTAINERS: rectify entry for HIKEY960 ONBOARD USB GPIO HUB DRIVER
Date:   Mon, 15 Mar 2021 17:04:49 +0100
Message-Id: <20210315160451.7469-4-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315160451.7469-1-lukas.bulwahn@gmail.com>
References: <20210315160451.7469-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Commit 7a6ff4c4cbc3 ("misc: hisi_hikey_usb: Driver to support onboard USB
gpio hub on Hikey960") refers to the non-existing file
./Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml, but this
commit's patch series does not add any related devicetree binding in misc.

So, just drop this file reference in HIKEY960 ONBOARD USB GPIO HUB DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 89404ca760b9..66c756c68bfd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8085,7 +8085,6 @@ M:	John Stultz <john.stultz@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/hisi_hikey_usb.c
-F:	Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
 
 HISILICON PMU DRIVER
 M:	Shaokun Zhang <zhangshaokun@hisilicon.com>
-- 
2.17.1

