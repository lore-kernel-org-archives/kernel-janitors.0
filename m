Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96891C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 11:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59FEA61019
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 11:09:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbhDILJf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 07:09:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15655 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhDILJe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 07:09:34 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGwLJ6Jx9zpWsC;
        Fri,  9 Apr 2021 19:06:32 +0800 (CST)
Received: from DESKTOP-EFRLNPK.china.huawei.com (10.174.176.196) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 19:09:12 +0800
From:   Qiheng Lin <linqiheng@huawei.com>
To:     <linqiheng@huawei.com>, Douglas Miller <dougmill@linux.ibm.com>,
        "Jakub Kicinski" <kuba@kernel.org>
CC:     <netdev@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH net-next] ehea: add missing MODULE_DEVICE_TABLE
Date:   Fri, 9 Apr 2021 19:09:11 +0800
Message-ID: <20210409110911.214-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.176.196]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---
 drivers/net/ethernet/ibm/ehea/ehea_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index c2e740475786..ea55314b209d 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -109,6 +109,7 @@ static const struct of_device_id ehea_device_table[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, ehea_device_table);
 
 static struct platform_driver ehea_driver = {
 	.driver = {

