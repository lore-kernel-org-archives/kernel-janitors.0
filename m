Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A893C433ED
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0268D61394
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345788AbhDGO5V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:57:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:16388 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345668AbhDGO5U (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 10:57:20 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FFnWF2sLpzlW8t;
        Wed,  7 Apr 2021 22:55:21 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 22:56:58 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
        Jason Yan <yanaijie@huawei.com>,
        dingsenjie <dingsenjie@yulong.com>,
        Chuhong Yuan <hslester96@gmail.com>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH net-next] net: encx24j600: use module_spi_driver to simplify the code
Date:   Wed, 7 Apr 2021 15:07:04 +0000
Message-ID: <20210407150704.359424-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

module_spi_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 .../net/ethernet/microchip/encx24j600.c  | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/microchip/encx24j600.c b/drivers/net/ethernet/microchip/encx24j600.c
index a66a179236fd..3658c4ae3c37 100644
--- a/drivers/net/ethernet/microchip/encx24j600.c
+++ b/drivers/net/ethernet/microchip/encx24j600.c
@@ -1117,17 +1117,7 @@ static struct spi_driver encx24j600_spi_net_driver = {
 	.id_table	= encx24j600_spi_id_table,
 };
 
-static int __init encx24j600_init(void)
-{
-	return spi_register_driver(&encx24j600_spi_net_driver);
-}
-module_init(encx24j600_init);
-
-static void encx24j600_exit(void)
-{
-	spi_unregister_driver(&encx24j600_spi_net_driver);
-}
-module_exit(encx24j600_exit);
+module_spi_driver(encx24j600_spi_net_driver);
 
 MODULE_DESCRIPTION(DRV_NAME " ethernet driver");
 MODULE_AUTHOR("Jon Ringle <jringle@gridpoint.com>");

