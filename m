Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F19C433E1
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78760619F3
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhC0ASY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbhC0ASP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:18:15 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C861C0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:15 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id s2so5480872qtx.10
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pcT/zDnZmKWZEkcWU1Fdw2ETNdguhtXtEAWsERVGPz8=;
        b=Oh/YN8VSH0mjmWJlRzWWHSrachEnaiJZBXtXfGYhG0B9u/RWYkZ+/gN+HlTfX6Dze7
         /4sFNF9PFIq1mGJ2Y3k6wz4YqSLDQdh7mfZgnfsrd4iB95lWdGm/7Vpl/ysChn2RV0LL
         nYBA+apwXYbyjjvhED/P7bbq4CjQEyhHpCf6/m/SWuJlJNBTvMTE7pztE99lSVDxTDpA
         /GQpUBg2nWkhszHa5c9TC9vozQc8pNfLAu9SpUBbwq7ybLkbMH1bCvQ7qwRa7jebt1a4
         YLPyrkzxMchwlxQ/h+WbrCzy/KWbqesGYz4fXZkdGKf3cxz4P87GyayqVIpf+gg5cfyy
         bPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcT/zDnZmKWZEkcWU1Fdw2ETNdguhtXtEAWsERVGPz8=;
        b=IFQq4+KVt5RGzSKVRh85sbBy5+YA10MUMlEviJMA0dON4MtOQb+doeP0s9dwFa1pLk
         rbjKF3X0iU7B1eM4jsbY2rIpu65TgaC2IkheWY1YeMVck6bSIa7m9KZ6kumte9PUfFcs
         rNjoRCGieeS7MTxjpDzzW3lUkbdDWzhy9rlRvew3l2kH36IyTs9yitMhLnwBYQJ5eMsL
         rku67Rsh25Ydp71ybF9eEPypTiiHlScQRqmcMK2o79dEHvQkLy4jlZrwAAvaPIEZAhpl
         Ts4ZgJm/6dz5g3o4fLG77bEtCyYGMPBjF5Rclkdi7asL/Wv5EMIgD6iDcnCArrs/uHKF
         pYTQ==
X-Gm-Message-State: AOAM533UJcMrpmAVn7ln29FCJvxLcwfl1bJPdqiUXpEKoXk0Tchs9Wsg
        Jiwg2vdH93YmIU3i1F3/hNk=
X-Google-Smtp-Source: ABdhPJx3pGvGTjzF7gSrHxGU58iUHo1oumXLECb05hM0HOimIYQIYMEshFim1BePtHwxKbL6IQfmNQ==
X-Received: by 2002:a05:622a:110c:: with SMTP id e12mr14714926qty.350.1616804293602;
        Fri, 26 Mar 2021 17:18:13 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:13 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        dan.carpenter@oracle.com, ross.schm.dev@gmail.com,
        fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 3/6] staging: rtl8723bs: hal: remove unused variable in HalBtc8723b1Ant.c
Date:   Fri, 26 Mar 2021 18:17:33 -0600
Message-Id: <20210327001736.180881-3-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Variable btRssiState in halbtc8723b1ant_ActionWifiConnectedBtAclBusy()
is set but never read. Removing it.

Removing this warning:

drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2093:5: warning: variable ‘btRssiState’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 621f8181f46d..3e794093092b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2090,10 +2090,8 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 	struct btc_coexist *pBtCoexist, u8 wifiStatus
 )
 {
-	u8 btRssiState;
-
 	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
-	btRssiState = halbtc8723b1ant_BtRssiState(2, 28, 0);
+	halbtc8723b1ant_BtRssiState(2, 28, 0);
 
 	if ((pCoexSta->lowPriorityRx >= 1000) && (pCoexSta->lowPriorityRx != 65535))
 		pBtLinkInfo->bSlaveRole = true;
-- 
2.30.2

