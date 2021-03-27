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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC29C433E6
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7A1E619FC
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhC0ASZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbhC0ASS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:18:18 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E120C0613AA
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:18 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id x9so5477949qto.8
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oOfclmJ04utnxnAEDLzlsT6/2w4ISJ9SBiqT5WMFbMQ=;
        b=K9U4X8jZIqT3ISqwQL2mAdpTIRVJwoRhUzicqqHpXvV7q38xsNqMtuXQf+q9pJbFzf
         kCpHQBKezg+8ihMUJYiEU/fF/3vEM87VQtxDb758qL/rIh9zQBN5RAG19u0xtYL/GuBA
         rSggdvjW5qmlyCft3+ro9AcvmKp2PlphGP0o5guRkDtEo4qOvE8UdQAXoXKT+4Qtqm1Q
         EvqUrPxI4/VxcSCW5h2vBPHCh5FpJZ1mLO17cpQkw3HnT9k4pSJAHv65P7xhCUfgfg/C
         QQAHrEOClAx4fGEG2XDGSyqeFGKubKOFruPxEAbOdvPsPkOA25wmCj80UVoMEbLBTXWx
         QeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oOfclmJ04utnxnAEDLzlsT6/2w4ISJ9SBiqT5WMFbMQ=;
        b=al5Y3+8FF0/J1nfk0tQnYyWN1oTZl6do+S4ytwKORWLcwDKXsGGGk2zuL6GADIIRhK
         LawG8ZjIL1bifnPe1IaAqomTnArUqp1a+B/j6zkTdi9glAwwz47iODalSbCCGgck6LkA
         ZjAJ5Nker9mpWl35WqheMkyvb9irTqzyrYWx7ulgXzirDoIS1Bi3lxqnHMucRMHzkfiL
         w4tz68j5r6XWmpHnVEctavFwmEg0sDgOgvFa54wNzYrO+cnNq0MLpIqEKOn+/lB7YYVU
         xMYJ9l2qecKXA7DeGntf3R/kjhUQLy7i6viNAVP79t/kUOycguBso9OKg/BWky/thL+u
         IqPQ==
X-Gm-Message-State: AOAM531KDZDzakSdVSRvWqLL7fnLZ0+a2PaXY2Vx4KI8NgDmATfKQAC6
        5TccZZjIGF2q5YakZ++snVo=
X-Google-Smtp-Source: ABdhPJz8CatQNMODgkupr+pq1Mx0fTxyel1teV/rtDdcSO5hFQzFiEz4AS6PkNiltW8E/wKt1FQfAQ==
X-Received: by 2002:ac8:7747:: with SMTP id g7mr14315512qtu.144.1616804297826;
        Fri, 26 Mar 2021 17:18:17 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:17 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        dan.carpenter@oracle.com, ross.schm.dev@gmail.com,
        fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 6/6] staging: rtl8723bs: sta_mgt: return _FAIL if there is an error
Date:   Fri, 26 Mar 2021 18:17:36 -0600
Message-Id: <20210327001736.180881-6-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If there is an error when calling rtw_init_bcmc_stainfo() inside
rtw_init_bcmc_stainfo(), variable res is set to _FAIL. However, when
returning, _SUCCESS is always returned regardless. Just in case,
all existing calls do not consider the result of the function.

Compile-tested as I don't have the hardware.

Removing this warning:

drivers/staging/rtl8723bs/core/rtw_sta_mgt.c:536:6: warning: variable ‘res’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index f96dd0b40e04..7b578192adf5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -551,7 +551,7 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 	psta->mac_id = 1;
 
 exit:
-	return _SUCCESS;
+	return res;
 }
 
 struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter)
-- 
2.30.2

