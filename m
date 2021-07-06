Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3559C07E96
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jul 2021 14:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFBAF611AE
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jul 2021 14:57:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbhGFO7p (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:59:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34794 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbhGFO7g (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jul 2021 10:59:36 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1m0mVH-0004Qy-Hf; Tue, 06 Jul 2021 14:56:51 +0000
From:   Colin King <colin.king@canonical.com>
To:     Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-nvme@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] nvmet: remove redundant assignments of variable status
Date:   Tue,  6 Jul 2021 15:56:50 +0100
Message-Id: <20210706145650.32555-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two occurrances where variable status is being assigned a
value that is never read and it is being re-assigned a new value
almost immediately afterwards on an error exit path. The assignments
are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvme/target/zns.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 17f8b7a45f21..46bc30fe85d2 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -115,14 +115,11 @@ void nvmet_execute_identify_cns_cs_ns(struct nvmet_req *req)
 	}
 
 	status = nvmet_req_find_ns(req);
-	if (status) {
-		status = NVME_SC_INTERNAL;
+	if (status)
 		goto done;
-	}
 
 	if (!bdev_is_zoned(req->ns->bdev)) {
 		req->error_loc = offsetof(struct nvme_identify, nsid);
-		status = NVME_SC_INVALID_NS | NVME_SC_DNR;
 		goto done;
 	}
 
-- 
2.31.1

