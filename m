Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A763C43470
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77ED6113D
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 14:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353206AbhDGO53 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:57:29 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16019 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345804AbhDGO50 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 10:57:26 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFnVF2LKgzPnyB;
        Wed,  7 Apr 2021 22:54:29 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 22:57:05 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Chris Snook <chris.snook@gmail.com>,
        "Jakub Kicinski" <kuba@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Jesse Brandeburg" <jesse.brandeburg@intel.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH net-next] net: atheros: atl2: use module_pci_driver to simplify the code
Date:   Wed, 7 Apr 2021 15:07:11 +0000
Message-ID: <20210407150711.367154-1-weiyongjun1@huawei.com>
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
 .../atheros/atlx/atl2.c        | 24 +---------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index f016f2e12ee7..0cc0db04c27d 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -1675,29 +1675,7 @@ static struct pci_driver atl2_driver = {
 	.shutdown = atl2_shutdown,
 };
 
-/**
- * atl2_init_module - Driver Registration Routine
- *
- * atl2_init_module is the first routine called when the driver is
- * loaded. All it does is register with the PCI subsystem.
- */
-static int __init atl2_init_module(void)
-{
-	return pci_register_driver(&atl2_driver);
-}
-module_init(atl2_init_module);
-
-/**
- * atl2_exit_module - Driver Exit Cleanup Routine
- *
- * atl2_exit_module is called just before the driver is removed
- * from memory.
- */
-static void __exit atl2_exit_module(void)
-{
-	pci_unregister_driver(&atl2_driver);
-}
-module_exit(atl2_exit_module);
+module_pci_driver(atl2_driver);
 
 static void atl2_read_pci_cfg(struct atl2_hw *hw, u32 reg, u16 *value)
 {

