Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F220C4338F
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Aug 2021 20:04:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27E4E60EB5
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 Aug 2021 20:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhHKUFH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 Aug 2021 16:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHKUFH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 Aug 2021 16:05:07 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF69C061765
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Aug 2021 13:04:43 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id lw7-20020a17090b1807b029017881cc80b7so11417312pjb.3
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Aug 2021 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VyEloO5NuZnfEA7RZ2POxf5Rh/PQr26isx/nqb15obc=;
        b=NlQ0UiUrv8XFsYk2bpM3cdLANYU1Vb4cMHq4+nPU2C0cAk2iM87/g9iVO4FVXAlwkv
         IbkH2pvf99gLvkZcAWsE4xIWZo07/wnr9xp/kVikgPXY4ZP5NnEhexMo9AXcMxNSao50
         nkQGoNKTi//x30c3Cca1L8RUMmrKHne4kENOpFLWUtAcfyulg5pHG8vATnKs9uU7IrU3
         CX0EFcqcTdFzQfGTl3mT9TNN2746LHHZbPUc/0AuFVrXBV92OzOpwZblYMY3wKMRZody
         N/2Monw2uOIelUSYj3eKE/LfYLRS6DgxBz3aES9Oc9p5jQJ1ZeP6XwJQOAV2XnNLmISi
         HS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VyEloO5NuZnfEA7RZ2POxf5Rh/PQr26isx/nqb15obc=;
        b=MBeCYAgaKt1bdtMCC4PieoLT3BBwBVg3EjJGSYy/0EUzf7XxU1kTdn8CDDhh3OQ7t9
         kc3PwYFztN3WwRPNdoqTwWn2ijwk6m0lg0xODzG7nLy3biceQfelsJT742V1ydBGJhlm
         fv6X+bA6MPEJULDpFFsCUdZN9mFEdHCerfEXMiP/6CfWLN6smXUpOCFt5eww8D4Tc8Wh
         UiLaina1btumKsckblx5JDSEbEDYwRAO/5WrBaTEdGE8o5xEd7ISupiS/bH60ZHijPEp
         gSmtVmZP5WZpCOBFLlA/YQgN09wlvO8muvIXfJQdk0zvm+bjtCEzTiv8uEY9MACKsUVJ
         WSwA==
X-Gm-Message-State: AOAM532FKTeR9qSqueqvifJwDAJt05CppRi+ufTblicKNUMfYEp6CfVv
        v0Tavtb/kReGKLY92RLw+W+hUInuHn89oA==
X-Google-Smtp-Source: ABdhPJxz7DnFARZWJTw0vW6MpOqvMynoyl4oCi0uOj3wfSXZGjiXI1vqa9SdSjOOkTEpQ6hURl2iXg==
X-Received: by 2002:a17:90b:1d81:: with SMTP id pf1mr304875pjb.88.1628712282695;
        Wed, 11 Aug 2021 13:04:42 -0700 (PDT)
Received: from localhost.localdomain ([103.18.170.218])
        by smtp.gmail.com with ESMTPSA id fv2sm274284pjb.53.2021.08.11.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 13:04:42 -0700 (PDT)
From:   amartyach98 <chamartya98@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] This is my first patch! this patch added KERN_DEBUG macro to a printk function
Date:   Thu, 12 Aug 2021 01:34:34 +0530
Message-Id: <20210811200434.4909-1-chamartya98@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

---
 Makefile                 | 2 +-
 drivers/scsi/ncr53c8xx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9ca176ff1e40..eae1314a5b86 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 5
 PATCHLEVEL = 14
 SUBLEVEL = 0
-EXTRAVERSION = -rc4
+EXTRAVERSION = -rc5
 NAME = Opossums on Parade
 
 # *DOCUMENTATION*
diff --git a/drivers/scsi/ncr53c8xx.c b/drivers/scsi/ncr53c8xx.c
index c76e9f05d042..38fee537e689 100644
--- a/drivers/scsi/ncr53c8xx.c
+++ b/drivers/scsi/ncr53c8xx.c
@@ -8526,7 +8526,7 @@ void ncr53c8xx_release(struct Scsi_Host *host)
 {
 	struct host_data *host_data = shost_priv(host);
 #ifdef DEBUG_NCR53C8XX
-	printk("ncr53c8xx: release\n");
+	printk(KERN_DEBUG "ncr53c8xx: release\n");
 #endif
 	if (host_data->ncb)
 		ncr_detach(host_data->ncb);
-- 
2.25.1

