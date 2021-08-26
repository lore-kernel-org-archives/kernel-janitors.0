Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45813C4320E
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 14:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24C9C60FD8
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 14:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242882AbhHZOjp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:39:45 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60572
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234036AbhHZOjp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Aug 2021 10:39:45 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 442FD3F36A;
        Thu, 26 Aug 2021 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629988731;
        bh=y1UyOyXY41QPPkZfXljOekMD9/F/CpbtWZ+iFga0D/Y=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=BoS9cyycMHrq50pDVX2Ri0j5P0RP7pcUI+sWin15sfPGShbSa4UbeKPwlmUjVzx59
         S506291kEsFVI/glzxKu2HVib/lriW4ttZ3lbonw4BcJPW6q1WF0xIuciD4V6FyMlr
         0LRsPe77MxoB7hPspyCSCGvRYE9kz1E2W39ca0ubuRwKWzuTsBAD+9uFz+PSZUE++I
         DBzGyNxos9NQnmfpUUwIkwu6ARMijcDLBEjCIAKyhAl4qKlyxLzDculOgL2k8NtX64
         LKUZLsMgmgFsH9W7ji+01lRQtvo5D7bCfSZ301bJhfKV5HHNzgxgs9fE3ETQH32OB8
         xUHGA5Kw7X8gQ==
From:   Colin King <colin.king@canonical.com>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V2] usb: dwc2: Fix spelling mistake "was't" -> "wasn't"
Date:   Thu, 26 Aug 2021 15:38:49 +0100
Message-Id: <20210826143849.55115-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: fix typo in commit message.
---
 drivers/usb/dwc2/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 272ae5722c86..cf0bcd0dc320 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -295,7 +295,7 @@ void dwc2_hib_restore_common(struct dwc2_hsotg *hsotg, int rem_wakeup,
 	if (dwc2_hsotg_wait_bit_set(hsotg, GINTSTS, GINTSTS_RESTOREDONE,
 				    20000)) {
 		dev_dbg(hsotg->dev,
-			"%s: Restore Done wan't generated here\n",
+			"%s: Restore Done wasn't generated here\n",
 			__func__);
 	} else {
 		dev_dbg(hsotg->dev, "restore done  generated here\n");
-- 
2.32.0

