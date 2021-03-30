Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2547C433C1
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Mar 2021 01:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 793A561601
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 Mar 2021 01:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhC3Bhe convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 Mar 2021 21:37:34 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15377 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbhC3BhM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Mar 2021 21:37:12 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F8X7Y3CT6z9t74;
        Tue, 30 Mar 2021 09:35:05 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.177.129) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 09:36:59 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mihai Carabas <mihai.carabas@oracle.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        zhenwei pi <pizhenwei@bytedance.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Joe Perches <joe@perches.com>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] misc/pvpanic: fix return value check in pvpanic_pci_probe()
Date:   Tue, 30 Mar 2021 09:36:59 +0800
Message-ID: <20210330013659.916-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.174.177.129]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In case of error, the function pci_iomap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/misc/pvpanic/pvpanic-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/pvpanic/pvpanic-pci.c b/drivers/misc/pvpanic/pvpanic-pci.c
index f38a80a5bbc8..9ecc4e8559d5 100644
--- a/drivers/misc/pvpanic/pvpanic-pci.c
+++ b/drivers/misc/pvpanic/pvpanic-pci.c
@@ -83,8 +83,8 @@ static int pvpanic_pci_probe(struct pci_dev *pdev,
 		return ret;
 
 	base = pci_iomap(pdev, 0, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	if (!base)
+		return -ENOMEM;
 
 	pi = kmalloc(sizeof(*pi), GFP_ATOMIC);
 	if (!pi)

