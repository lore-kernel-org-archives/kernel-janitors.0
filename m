Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54A4C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 09:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93ABC6115C
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 09:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233381AbhDIJoA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 05:44:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16860 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233163AbhDIJnr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 05:43:47 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGtS05nccz7v35;
        Fri,  9 Apr 2021 17:41:20 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:24 +0800
From:   Ye Bin <yebin10@huawei.com>
To:     <yebin10@huawei.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] dca: use DEFINE_SPINLOCK() for spinlock and DEFINE_IDR() for idr
Date:   Fri, 9 Apr 2021 17:51:49 +0800
Message-ID: <20210409095149.2294378-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().
idr can be initialized automatically with DEFINE_IDR()
rather than explicitly calling idr_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/dca/dca-sysfs.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dca/dca-sysfs.c b/drivers/dca/dca-sysfs.c
index 21ebd0af268b..c56e917f0f19 100644
--- a/drivers/dca/dca-sysfs.c
+++ b/drivers/dca/dca-sysfs.c
@@ -14,8 +14,8 @@
 #include <linux/export.h>
 
 static struct class *dca_class;
-static struct idr dca_idr;
-static spinlock_t dca_idr_lock;
+static DEFINE_IDR(dca_idr);
+static DEFINE_SPINLOCK(dca_idr_lock);
 
 int dca_sysfs_add_req(struct dca_provider *dca, struct device *dev, int slot)
 {
@@ -71,9 +71,6 @@ void dca_sysfs_remove_provider(struct dca_provider *dca)
 
 int __init dca_sysfs_init(void)
 {
-	idr_init(&dca_idr);
-	spin_lock_init(&dca_idr_lock);
-
 	dca_class = class_create(THIS_MODULE, "dca");
 	if (IS_ERR(dca_class)) {
 		idr_destroy(&dca_idr);

