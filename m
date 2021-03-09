Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864FEC4332B
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 13:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B6C76527B
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Mar 2021 13:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbhCINGt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Mar 2021 08:06:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:13589 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhCINGW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Mar 2021 08:06:22 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DvwQm2Rllz17Htr;
        Tue,  9 Mar 2021 21:04:32 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 21:06:08 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Peter Chen <peter.chen@kernel.org>,
        "Pawel Laszczak" <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Frank Li <frank.li@nxp.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: cdns3: imx: mark cdns_imx_resume as __maybe_unused
Date:   Tue, 9 Mar 2021 13:14:57 +0000
Message-ID: <20210309131457.1884112-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The function cdns_imx_resume() may have no callers depending
on configuration, so it must be marked __maybe_unused to avoid
harmless warning:

drivers/usb/cdns3/cdns3-imx.c:378:12: warning:
 'cdns_imx_system_resume' defined but not used [-Wunused-function]
  378 | static int cdns_imx_system_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~

Fixes: 67982dfa59de ("usb: cdns3: imx: add power lost support for system resume")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 708b51cc5844..96fff823a594 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -346,7 +346,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
 
 }
 
-static int cdns_imx_resume(struct device *dev)
+static int __maybe_unused cdns_imx_resume(struct device *dev)
 {
 	struct cdns_imx *data = dev_get_drvdata(dev);
 

