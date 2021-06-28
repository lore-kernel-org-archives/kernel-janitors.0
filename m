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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6FDC11F64
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 21:19:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 190C961CF3
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 21:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235303AbhF1VVd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Jun 2021 17:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237482AbhF1VV2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Jun 2021 17:21:28 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A272CC061760
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Jun 2021 14:19:02 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w17so12582585edd.10
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Jun 2021 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxbyiG/Ewkoum3ybxF9UeGNZ/idOYZzs/HB5bLIJcUk=;
        b=lwDpALZpeBF7WR/9f3uve2uifir4HMOupn9s6xoFwr+XPbhDA4HAb7ynmYhKZkvmXM
         428yrILgFk3GyLB05OsoVxl3V/sBOLz1gGXgHSxHCDfc3nxMOx0r0Laa/q04EZ6oJJYt
         +11z/ZKNc1HODMKlR0jPl82vHlG939wluc4cAJWwFiN9IrUKi0vqM4l2OBNQvHNq7HRY
         Cr7W8vBdQgP9BqiZmyzBVgQ9SUuUBwDlaRIwgJGuET1z6hoydHQC2nvpxg7yoEsNuCu2
         ll4n2o39/CXifX4rE4mIUoDRThPOUqNQHULasNVO3stevXsZU7nJ+0dmXOlNrpbvGJ3i
         chxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vxbyiG/Ewkoum3ybxF9UeGNZ/idOYZzs/HB5bLIJcUk=;
        b=gCU2XmlIRQrnvLXixJju1di3kqF02isCR54sCU7GxObb/Aa+a71+AiHHPdbtxfixSe
         S2zyt6EmajeJoYI8j/FDW4JzlKrUp/BxJjW5BuUhOKprkKpAM/9OoM079a6Y+Qmze84d
         am8kM2PeU4Mv+xViKEIFjpOJOd9gS/xVEdCfMdNUvXJ5QICg/Nu/8ddqEecAWrTphRsc
         O4saKxqUcWTKanet7c5oIIWH+OxD2LZqfWUEhbME6a7HhcPDkFzZNVf3bevR7D+jvjj9
         e6fo6y2fr9iCRlGQMXpXgXsLm6trv2H1iwswG9xUUpqnbVOEA6/N1NH4qxI4oIdEx9dr
         xjYg==
X-Gm-Message-State: AOAM5323j61r1APcpqtTB17V9knhDfXJ85eo6OdcCY01InDzjuiOQNwj
        pCfssIXUNFibCjxWG+/pLhJ2+n4B+MB6Fg==
X-Google-Smtp-Source: ABdhPJwa3CSl6/KUjAuScEl3xz8HTJtOnn7g+1rJfyqjdqHjRwPc3jR7pZb/Pdlq8IwnKi8Oy23DYA==
X-Received: by 2002:aa7:c0da:: with SMTP id j26mr35758471edp.38.1624915141088;
        Mon, 28 Jun 2021 14:19:01 -0700 (PDT)
Received: from masalkhi.fritz.box (dslb-178-005-073-162.178.005.pools.vodafone-ip.de. [178.5.73.162])
        by smtp.gmail.com with ESMTPSA id z27sm7449113ejl.113.2021.06.28.14.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 14:19:00 -0700 (PDT)
From:   Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Subject: [PATCH] arch: parisc: kernel: Remove DPRINTK definition and replace it with pr_debug
Date:   Mon, 28 Jun 2021 23:18:55 +0200
Message-Id: <20210628211855.89064-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.29.0.rc1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Removed the definition of DPRINTK macro and replaced it with pr_debug.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 arch/parisc/kernel/pdc_chassis.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/kernel/pdc_chassis.c b/arch/parisc/kernel/pdc_chassis.c
index 75ae88d13909..59433c50c58b 100644
--- a/arch/parisc/kernel/pdc_chassis.c
+++ b/arch/parisc/kernel/pdc_chassis.c
@@ -10,13 +10,6 @@
  *    	    Find out how to get Chassis warnings out of PAT boxes?
  */
 
-#undef PDC_CHASSIS_DEBUG
-#ifdef PDC_CHASSIS_DEBUG
-#define DPRINTK(fmt, args...)	printk(fmt, ## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
-
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -73,7 +66,7 @@ static void __init pdc_chassis_checkold(void)
 		default:
 			break;
 	}
-	DPRINTK(KERN_DEBUG "%s: pdc_chassis_checkold(); pdc_chassis_old = %d\n", __FILE__, pdc_chassis_old);
+	pr_debug("%s: pdc_chassis_checkold(); pdc_chassis_old = %d\n", __FILE__, pdc_chassis_old);
 }
 #endif
 
@@ -126,7 +119,7 @@ void __init parisc_pdc_chassis_init(void)
 {
 #ifdef CONFIG_PDC_CHASSIS
 	if (likely(pdc_chassis_enabled)) {
-		DPRINTK(KERN_DEBUG "%s: parisc_pdc_chassis_init()\n", __FILE__);
+		pr_debug("%s: parisc_pdc_chassis_init()\n", __FILE__);
 
 		/* Let see if we have something to handle... */
 		printk(KERN_INFO "Enabling %s chassis codes support v%s\n",
@@ -165,7 +158,7 @@ int pdc_chassis_send_status(int message)
 #ifdef CONFIG_PDC_CHASSIS
 	if (likely(pdc_chassis_enabled)) {
 
-		DPRINTK(KERN_DEBUG "%s: pdc_chassis_send_status(%d)\n", __FILE__, message);
+		pr_debug("%s: pdc_chassis_send_status(%d)\n", __FILE__, message);
 
 #ifdef CONFIG_64BIT
 		if (is_pdc_pat()) {
-- 
2.29.0.rc1.dirty

