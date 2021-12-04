Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CF6C433F5
	for <kernel-janitors@archiver.kernel.org>; Sat,  4 Dec 2021 09:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384397AbhLDJNE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 4 Dec 2021 04:13:04 -0500
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:56387 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384394AbhLDJNE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 4 Dec 2021 04:13:04 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id tR32mObqLUGqltR32mdi2U; Sat, 04 Dec 2021 10:09:37 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 04 Dec 2021 10:09:37 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linux@armlinux.org.uk
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ARM: l2c: tauros2: Fix a typo
Date:   Sat,  4 Dec 2021 10:09:33 +0100
Message-Id: <4d0a9df63e072f3da7f9e7cfa7b7733cef991504.1638608933.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

s/tauros/tauros2/ so that the message matches the property that is looked
at.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/arm/mm/cache-tauros2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/cache-tauros2.c b/arch/arm/mm/cache-tauros2.c
index 88255bea65e4..ae4858928fa7 100644
--- a/arch/arm/mm/cache-tauros2.c
+++ b/arch/arm/mm/cache-tauros2.c
@@ -295,7 +295,7 @@ void __init tauros2_init(unsigned int features)
 	} else {
 		ret = of_property_read_u32(node, "marvell,tauros2-cache-features", &f);
 		if (ret) {
-			pr_info("Not found marvell,tauros-cache-features property, "
+			pr_info("Not found marvell,tauros2-cache-features property, "
 				"disable extra features\n");
 			features = 0;
 		} else
-- 
2.30.2

