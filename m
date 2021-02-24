Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3FEC433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Feb 2021 16:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4312564F06
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Feb 2021 16:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbhBXQyO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Feb 2021 11:54:14 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34355 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbhBXQxA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Feb 2021 11:53:00 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lExOJ-0002jT-Go; Wed, 24 Feb 2021 16:51:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Lijun Ou <oulijun@huawei.com>, Wei Hu <huwei87@hisilicon.com>,
        Weihang Li <liweihang@huawei.com>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Xi Wang <wangxi11@huawei.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] RDMA/hns: Fix uninitialized return value in ret
Date:   Wed, 24 Feb 2021 16:51:59 +0000
Message-Id: <20210224165159.205259-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if !r->hopnum is true in the for-loop and later on
mapped_cnt < page_cnt is false we end up with an uninitialized value
in ret being returned at the end of the function hns_roce_mtr_map.
Fix this by keeping the original intent and ensure ret is zero by
initializing ret at the start of the function.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 9ea9a53ea93b ("RDMA/hns: Add mapped page count checking for MTR")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_mr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_mr.c b/drivers/infiniband/hw/hns/hns_roce_mr.c
index 79b3c3023fe7..b8454dcb0318 100644
--- a/drivers/infiniband/hw/hns/hns_roce_mr.c
+++ b/drivers/infiniband/hw/hns/hns_roce_mr.c
@@ -776,7 +776,7 @@ int hns_roce_mtr_map(struct hns_roce_dev *hr_dev, struct hns_roce_mtr *mtr,
 	struct ib_device *ibdev = &hr_dev->ib_dev;
 	struct hns_roce_buf_region *r;
 	unsigned int i, mapped_cnt;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Only use the first page address as root ba when hopnum is 0, this
-- 
2.30.0

