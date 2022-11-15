Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3A1C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiKONRy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiKONRx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:17:53 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B592D4
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:17:52 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v1so24172905wrt.11
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cn4oLeM4/WSor+vqTKerVOxO2dOWJ/t8ipQ7qyGi7iM=;
        b=kWYN6PxkAflBd15vSFdttht7EfigImbUQzfKGyxcUPUbBiEw/u4FFGR6KVOTQlWSmo
         bOBev3q23PDFztJRb+kHIhU4tnuYqD7/UVXh7G42lgyHTqT9RFmyWoh9ETTblMGQGgej
         V/VMBJ8XgRaTlr6Jgdtu7JWegfbMRnBAkul3ObUyL/0KbXuIoMFWfoRqE2n36yxWjybF
         Wmo8FUqRPhY7HXZ6ttZtBUpg3hhUne0tYssztbL4O/XMLC5OCZxj/sXsmG2rTU6njRYs
         K2AlIiqfiS1k6qwogD6dk7fBd+oK1yAKsZhHvpBpTO18+hfshcvt5qQG87U7aAlHEzM5
         GsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cn4oLeM4/WSor+vqTKerVOxO2dOWJ/t8ipQ7qyGi7iM=;
        b=C0a81KDF+3k+RotVVAcF018s7WpyFOf0Ivggq6TiCCH8bYqYfIliEU2Og1APmPb3ey
         Yz6HkSiqVFaRkjHSjUOY77yeu6pv4OaKDDA3auUtPTwOilr77QYEP4nuWuwJWboRSq29
         SryvbBjYsPcp6ljY4eVRUhH39bQclfi5v9goFibf5bZB6/LElToYyE4/zvtWoNXuD0S2
         UKT4Aq/DwZN6i+CFcwoKU7Em4byzS9UeyVajoR2Zt8o3ktcGmyCsaRSdsC5rUWzS2QYm
         6udWdJAh08jRSZI668x0X8mqmJ4qrcVf9eShZV++ZiqxYMCqLsxbOdq7vXiuRRAkNMyO
         1aZA==
X-Gm-Message-State: ANoB5pkm3O2XopWBSifRXBvpxlO4fOdhh2NgZ9XpOdWSms3klqHCXBOy
        acSj3s1tmxw6I31M+7SSGwA=
X-Google-Smtp-Source: AA0mqf64msYfNMwbczePvjjicKTeoUkmhKEBKtvKTt1Ic4ny8v1TZUm4BIO1uXn9GSIqfcPNe+EHWw==
X-Received: by 2002:adf:ebc9:0:b0:236:57f5:5d8a with SMTP id v9-20020adfebc9000000b0023657f55d8amr10247357wrn.460.1668518270620;
        Tue, 15 Nov 2022 05:17:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c199100b003b4fdbb6319sm21993263wmq.21.2022.11.15.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:17:50 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:17:43 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Corey Minyard <minyard@acm.org>
Cc:     openipmi-developer@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ipmi: fix use after free in _ipmi_destroy_user()
Message-ID: <Y3M8xa1drZv4CToE@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The intf_free() function frees the "intf" pointer so we cannot
dereference it again on the next line.

Fixes: cbb79863fc31 ("ipmi: Don't allow device module unload when in use")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index f6b8ca6df9b5..186f1fee7534 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -1330,6 +1330,7 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 	unsigned long    flags;
 	struct cmd_rcvr  *rcvr;
 	struct cmd_rcvr  *rcvrs = NULL;
+	struct module    *owner;
 
 	if (!acquire_ipmi_user(user, &i)) {
 		/*
@@ -1392,8 +1393,9 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
 		kfree(rcvr);
 	}
 
+	owner = intf->owner;
 	kref_put(&intf->refcount, intf_free);
-	module_put(intf->owner);
+	module_put(owner);
 }
 
 int ipmi_destroy_user(struct ipmi_user *user)
-- 
2.35.1

