Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EABDC2B9F4
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Jun 2021 20:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 448586100B
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Jun 2021 20:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhFSUQs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Jun 2021 16:16:48 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:43545 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhFSUQr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Jun 2021 16:16:47 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d18 with ME
        id K8Eb2500521Fzsu038EbrF; Sat, 19 Jun 2021 22:14:35 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 19 Jun 2021 22:14:35 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Larry.Finger@lwfinger.net, gregkh@linuxfoundation.org,
        insafonov@gmail.com, linux@roeck-us.net, straube.linux@gmail.com,
        gustavoars@kernel.org, liushixin2@huawei.com,
        yepeilin.cs@gmail.com, phil@philpotter.co.uk
Cc:     linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] staging: rtl8188eu: remove "rtw_ieee80211_back_parties"
Date:   Sat, 19 Jun 2021 22:14:34 +0200
Message-Id: <f389e0d54a5a8a46c9a696207541aa1cb433676b.1624132543.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <6b6d8d81e7b2115e9206d2960ce09e1b2e8b6381.1624132543.git.christophe.jaillet@wanadoo.fr>
References: <6b6d8d81e7b2115e9206d2960ce09e1b2e8b6381.1624132543.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This enum is unused. It is also close to "ieee80211_back_parties" in
"include/linux/ieee80211.h", which should be used if needed.

So remove it

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/rtl8188eu/include/ieee80211.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/ieee80211.h b/drivers/staging/rtl8188eu/include/ieee80211.h
index 4becf4edaa25..da6245a77d5d 100644
--- a/drivers/staging/rtl8188eu/include/ieee80211.h
+++ b/drivers/staging/rtl8188eu/include/ieee80211.h
@@ -559,13 +559,6 @@ enum rtw_ieee80211_ht_actioncode {
 	RTW_WLAN_ACTION_HI_INFO_EXCHG = 8,
 };
 
-/* BACK (block-ack) parties */
-enum rtw_ieee80211_back_parties {
-	RTW_WLAN_BACK_RECIPIENT = 0,
-	RTW_WLAN_BACK_INITIATOR = 1,
-	RTW_WLAN_BACK_TIMER = 2,
-};
-
 #define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs)
 				* 00:50:F2
 				*/
-- 
2.30.2

