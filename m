Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B085CC43462
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FF8C613A0
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353189AbhDGO51 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:57:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15952 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353138AbhDGO5Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 10:57:25 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFnVw0j3QzrdJR;
        Wed,  7 Apr 2021 22:55:04 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 22:57:06 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
        "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH net-next] net: fealnx: use module_pci_driver to simplify the code
Date:   Wed, 7 Apr 2021 15:07:12 +0000
Message-ID: <20210407150712.368934-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use the module_pci_driver() macro to make the code simpler
by eliminating module_init and module_exit calls.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/fealnx.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/fealnx.c b/drivers/net/ethernet/fealnx.c
index c696651dd735..0908771aa9ac 100644
--- a/drivers/net/ethernet/fealnx.c
+++ b/drivers/net/ethernet/fealnx.c
@@ -1948,15 +1948,4 @@ static struct pci_driver fealnx_driver = {
 	.remove		= fealnx_remove_one,
 };
 
-static int __init fealnx_init(void)
-{
-	return pci_register_driver(&fealnx_driver);
-}
-
-static void __exit fealnx_exit(void)
-{
-	pci_unregister_driver(&fealnx_driver);
-}
-
-module_init(fealnx_init);
-module_exit(fealnx_exit);
+module_pci_driver(fealnx_driver);

