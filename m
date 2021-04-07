Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739E6C433B4
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B4DC61394
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353162AbhDGO5Z (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:57:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16066 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345668AbhDGO5Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 10:57:25 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFnVr4Zbqz19LBM;
        Wed,  7 Apr 2021 22:55:00 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 22:57:00 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
        "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC:     <netdev@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH net-next] tulip: windbond-840: use module_pci_driver to simplify the code
Date:   Wed, 7 Apr 2021 15:07:07 +0000
Message-ID: <20210407150707.362553-1-weiyongjun1@huawei.com>
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
 .../ethernet/dec/tulip/winbond-840.c    | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 89cbdc1f4857..514df170ec5d 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1629,15 +1629,4 @@ static struct pci_driver w840_driver = {
 	.driver.pm	= &w840_pm_ops,
 };
 
-static int __init w840_init(void)
-{
-	return pci_register_driver(&w840_driver);
-}
-
-static void __exit w840_exit(void)
-{
-	pci_unregister_driver(&w840_driver);
-}
-
-module_init(w840_init);
-module_exit(w840_exit);
+module_pci_driver(w840_driver);

