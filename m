Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F6EC433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 03:19:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B13761A1B
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 03:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCYDS3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 23:18:29 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14529 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhCYDRz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 23:17:55 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5VbW4j4WzNqW9;
        Thu, 25 Mar 2021 11:15:19 +0800 (CST)
Received: from localhost.localdomain (10.175.113.32) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 11:17:43 +0800
From:   'Qinglang Miao <miaoqinglang@huawei.com>
To:     <miaoqinglang@huawei.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: typec: tipd: Remove duplicated include from core.c
Date:   Thu, 25 Mar 2021 11:48:08 +0800
Message-ID: <20210325034808.463042-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/usb/typec/tipd/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index d8212b15f6f9..938219bc1b4b 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -6,8 +6,6 @@
  * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
  */
 
-#include "tps6598x.h"
-
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/module.h>

