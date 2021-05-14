Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DF7C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 03:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AE3761176
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 May 2021 03:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhENDNi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 23:13:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2594 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhENDNi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 23:13:38 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FhD5w16VDzqV61;
        Fri, 14 May 2021 11:09:40 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Fri, 14 May 2021
 11:12:18 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <bp@alien8.de>
CC:     <kristo@kernel.org>, <mchehab@kernel.org>, <tony.luck@intel.com>,
        <linux-edac@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next v2] =?UTF-8?q?staging:=20comedi:=20Remove=20unused=20variable?= =?UTF-8?q?=20=E2=80=98min=5Ffull=5Fscale=E2=80=99=20and=20function=20'get?= =?UTF-8?q?=5Fmin=5Ffull=5Fscales'?=
Date:   Fri, 14 May 2021 12:35:39 +0800
Message-ID: <20210514043539.55212-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The variable ‘min_full_scale’ and function 'get_min_full_scales' are
not used, So delete them.

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
Changes from v2:
* Delete function 'get_min_full_scales'

 drivers/comedi/drivers/jr3_pci.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/comedi/drivers/jr3_pci.c b/drivers/comedi/drivers/jr3_pci.c
index 7a02c4fa3cda..f963080dd61f 100644
--- a/drivers/comedi/drivers/jr3_pci.c
+++ b/drivers/comedi/drivers/jr3_pci.c
@@ -186,19 +186,6 @@ static void set_full_scales(struct jr3_sensor __iomem *sensor,
 	set_s16(&sensor->command_word0, 0x0a00);
 }
 
-static struct six_axis_t get_min_full_scales(struct jr3_sensor __iomem *sensor)
-{
-	struct six_axis_t result;
-
-	result.fx = get_s16(&sensor->min_full_scale.fx);
-	result.fy = get_s16(&sensor->min_full_scale.fy);
-	result.fz = get_s16(&sensor->min_full_scale.fz);
-	result.mx = get_s16(&sensor->min_full_scale.mx);
-	result.my = get_s16(&sensor->min_full_scale.my);
-	result.mz = get_s16(&sensor->min_full_scale.mz);
-	return result;
-}
-
 static struct six_axis_t get_max_full_scales(struct jr3_sensor __iomem *sensor)
 {
 	struct six_axis_t result;
@@ -504,10 +491,8 @@ jr3_pci_poll_subdevice(struct comedi_subdevice *s)
 			result = poll_delay_min_max(20, 100);
 		} else {
 			/* Set full scale */
-			struct six_axis_t min_full_scale;
 			struct six_axis_t max_full_scale;
 
-			min_full_scale = get_min_full_scales(sensor);
 			max_full_scale = get_max_full_scales(sensor);
 			set_full_scales(sensor, max_full_scale);
 
-- 
2.17.1

