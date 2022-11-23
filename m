Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8FDC433FE
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Nov 2022 06:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbiKWGnV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Nov 2022 01:43:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235726AbiKWGnU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Nov 2022 01:43:20 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53423FD14
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Nov 2022 22:43:19 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s5so10758870wru.1
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Nov 2022 22:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfEWeuAxvQfzW1nfRpEBj0UT4OdDwqRv3XSwMwCWnK8=;
        b=kckRcbhlBzaM8bzbKIrqbhPBxHzXaM4nCX19z6Fin21rHq1Mf/9tfqHEvFWYqxZnFx
         5istBw8HsJeU+q7Z2pfz0JmI8nRMz1yeqhHjJyzWcLKHW2m1aNZwDOUlvYlakkiraW4q
         Qnh3L8Im8uGpEd3prM46yBIjM5z2tn7APY1S/fFjIJsGQP0vlTVRBDJJh1ySmi2gYTiQ
         jYG8C7aTpYsvA4rkcDe3dIxfTJypb9siZMi6WHLhZRzSCCabl2n2JDffyIst85l7FggA
         mer0eG3x/UFBhlSYGBUdwuOfgznrPQ8X7eA99nRYdV7wr3HbNYsnJpiruihnnFARFpUu
         Qx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfEWeuAxvQfzW1nfRpEBj0UT4OdDwqRv3XSwMwCWnK8=;
        b=k9a/oZyw9FAHwH6Ye6aJIsAD6tqDLWyvSAp+GOwL5nu5I210ItXIQO9NZGixp5SMxv
         wCph8eweHIU5/45prxMKZDGO3snYqPeKESj7ORyJCe/q8Of8BSdwAybVMRuGjROxg5AR
         DDoXbggZvBYj/m1VyelRXJRYJ2tweOZNv1HhYDGFyB4euEVpADgLmj6GC5EY0kYl8eGr
         ivSApU6ALDS6GG6nT2MwV+zj7WbSdDrpYBAApd0ixixvufTmgW3zTpo8JeIusgJXmNMH
         rzQ9dd8BMzZumY8CJDeJcxIxxhy2FdPqYbVVfzY19GR4j0ISWKy/dRKX9Ku0DdB6rJFN
         +Ojw==
X-Gm-Message-State: ANoB5pnpdmAfqcbZN2BNwMzKbpEiR5hTtEU+uHQ/BSmBiPrt45lae16W
        VsVOoY07HENq8CDopt5yYR0=
X-Google-Smtp-Source: AA0mqf7GBi1HAWtpNMQ9Qfe/x7OKT1cwB+9GB2UOQFOqO4khgdyxE+eLXbItE8l2kpDzKKkU8M1ZHg==
X-Received: by 2002:adf:facd:0:b0:231:482f:ed6b with SMTP id a13-20020adffacd000000b00231482fed6bmr16247168wrs.253.1669185797849;
        Tue, 22 Nov 2022 22:43:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c354100b003b50428cf66sm1107254wmq.33.2022.11.22.22.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 22:43:17 -0800 (PST)
Date:   Wed, 23 Nov 2022 09:43:14 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dan Carpenter <error27@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: Fix use after free in ieee80211_rx()
Message-ID: <Y33BArx3k/aw6yv/@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We cannot dereference the "skb" pointer after calling
ieee80211_monitor_rx(), because it is a use after free.

Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index f142d0986990..5c73e3f8541a 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -951,9 +951,11 @@ int ieee80211_rx(struct ieee80211_device *ieee, struct sk_buff *skb,
 #endif
 
 	if (ieee->iw_mode == IW_MODE_MONITOR) {
+		unsigned int len = skb->len;
+
 		ieee80211_monitor_rx(ieee, skb, rx_stats);
 		stats->rx_packets++;
-		stats->rx_bytes += skb->len;
+		stats->rx_bytes += len;
 		return 1;
 	}
 
-- 
2.35.1

