Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,SUBJ_BRKN_WORDNUMS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B357C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 20:13:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64F6661363
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 20:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242050AbhDSUNg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Apr 2021 16:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhDSUNf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 16:13:35 -0400
Received: from viti.kaiser.cx (viti.kaiser.cx [IPv6:2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238E4C06174A;
        Mon, 19 Apr 2021 13:13:04 -0700 (PDT)
Received: from dslb-188-097-210-083.188.097.pools.vodafone-ip.de ([188.97.210.83] helo=martin-debian-2.paytec.ch)
        by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <martin@kaiser.cx>)
        id 1lYaGS-0006ik-Lu; Mon, 19 Apr 2021 22:13:00 +0200
From:   Martin Kaiser <martin@kaiser.cx>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 3/4] staging: rtl8188eu: cmdThread is a task_struct
Date:   Mon, 19 Apr 2021 22:11:25 +0200
Message-Id: <20210419201126.25633-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419201126.25633-1-martin@kaiser.cx>
References: <20210417180037.17806-1-martin@kaiser.cx>
 <20210419201126.25633-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

cmdThread is the return value of kthread_run, i.e. a struct task_struct.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - no change, re-sending the entire series

 drivers/staging/rtl8188eu/include/drv_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/include/drv_types.h b/drivers/staging/rtl8188eu/include/drv_types.h
index 0a3acb378d6d..4116051a9a65 100644
--- a/drivers/staging/rtl8188eu/include/drv_types.h
+++ b/drivers/staging/rtl8188eu/include/drv_types.h
@@ -150,7 +150,7 @@ struct adapter {
 
 	u8	hw_init_completed;
 
-	void *cmdThread;
+	struct task_struct *cmdThread;
 	struct  net_device *pnetdev;
 	struct  net_device *pmondev;
 
-- 
2.20.1

