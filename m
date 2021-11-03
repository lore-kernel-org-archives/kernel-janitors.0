Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C349C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Nov 2021 18:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C27D60E9B
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 Nov 2021 18:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhKCSmA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Nov 2021 14:42:00 -0400
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:59399 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhKCSl7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Nov 2021 14:41:59 -0400
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id iLANmt2fXUGqliLAOmrupw; Wed, 03 Nov 2021 19:39:21 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Wed, 03 Nov 2021 19:39:21 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        mike.leach@linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] coresight: Use devm_bitmap_zalloc when applicable
Date:   Wed,  3 Nov 2021 19:39:18 +0100
Message-Id: <a4b8454f560b70cedf0e4d06275787f08d576ee5.1635964610.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'drvdata->chs.guaranteed' is a bitmap. So use 'devm_bitmap_kzalloc()' to
simplify code, improve the semantic and avoid some open-coded arithmetic
in allocator arguments.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1 --> v2: remove the 'guaranteed' variable to be even less verbose
---
 drivers/hwtracing/coresight/coresight-stm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 58062a5a8238..bb14a3a8a921 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -856,13 +856,11 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	int ret;
 	void __iomem *base;
-	unsigned long *guaranteed;
 	struct device *dev = &adev->dev;
 	struct coresight_platform_data *pdata = NULL;
 	struct stm_drvdata *drvdata;
 	struct resource *res = &adev->res;
 	struct resource ch_res;
-	size_t bitmap_size;
 	struct coresight_desc desc = { 0 };
 
 	desc.name = coresight_alloc_device_name(&stm_devs, dev);
@@ -904,12 +902,10 @@ static int stm_probe(struct amba_device *adev, const struct amba_id *id)
 	else
 		drvdata->numsp = stm_num_stimulus_port(drvdata);
 
-	bitmap_size = BITS_TO_LONGS(drvdata->numsp) * sizeof(long);
-
-	guaranteed = devm_kzalloc(dev, bitmap_size, GFP_KERNEL);
-	if (!guaranteed)
+	drvdata->chs.guaranteed = devm_bitmap_zalloc(dev, drvdata->numsp,
+						     GFP_KERNEL);
+	if (!drvdata->chs.guaranteed)
 		return -ENOMEM;
-	drvdata->chs.guaranteed = guaranteed;
 
 	spin_lock_init(&drvdata->spinlock);
 
-- 
2.30.2

