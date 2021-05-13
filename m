Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2E6C433B4
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 12:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F9326127A
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 12:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbhEMMBM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 08:01:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33258 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhEMMBJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 08:01:09 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lhA0O-00018f-8F; Thu, 13 May 2021 11:59:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        linux-nvme@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] nvme: remove redundant initialization of variable ret
Date:   Thu, 13 May 2021 12:59:52 +0100
Message-Id: <20210513115952.58482-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read,
it is being updated later on. The assignment is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nvme/host/rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 37943dc4c2c1..74bf2c7f2b80 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -1088,7 +1088,7 @@ static void nvme_rdma_reconnect_or_remove(struct nvme_rdma_ctrl *ctrl)
 
 static int nvme_rdma_setup_ctrl(struct nvme_rdma_ctrl *ctrl, bool new)
 {
-	int ret = -EINVAL;
+	int ret;
 	bool changed;
 
 	ret = nvme_rdma_configure_admin_queue(ctrl, new);
-- 
2.30.2

