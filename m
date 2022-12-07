Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D72C352A1
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Dec 2022 15:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiLGP4T (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Dec 2022 10:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiLGP4R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Dec 2022 10:56:17 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A755F8C
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Dec 2022 07:56:15 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so15059115ejc.4
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Dec 2022 07:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8UWo2XovqgYHs1QY4JjTgk1+oCej6jXzZZznbbgyuDY=;
        b=NIcT+iuluektAZ43nD5zND2pW7Pc6Jne9R/wMULrDfJFGi3VEUvXX1rJXafGRDitnM
         kAET1yXrKXXyXo40lWfPfDkxnEtfANlOJL5MmHgH0r6E9/38BKXryJbKsifW12TiEs7i
         98JieEasaAgLxnXWwA7NnJDAiByLxFAMPFq8U0OG4WSnCVLVf5EVzJ1OY67vdNOvYWLA
         5YKlMoY52hlo7l2oELGnElAn9yRysk2OLsDB6fDMtmZVyPOerYAqnufkgnCJsyjDEdu5
         RY2JqW33Cl10HzlsabUkgZXKxuqZZqRtz0b62+7Qi2b/BnFwZpD5Q7cIR7QIHPs2fvo2
         5oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UWo2XovqgYHs1QY4JjTgk1+oCej6jXzZZznbbgyuDY=;
        b=Dj9wA4AsxoYwjmU/PI6z84sdvllSosAmwBoALLIPmbI/1DtxB/NDApuMErdMC0z0uN
         folLoxx5nrFx3ElG0x1FFuLdjy2dyn2BYFWvBqZ3wrUwnqEqxUJFWWl0JLpCv63QckkJ
         It+YVrkqt8Pp9nub0bXc/FbcKDTh2KBeinDKTHGIsqYh6wU/ieMRa7B3LbLss7zo8rJe
         ak7Rqomq6hlUreAgQJd8IRDkOShhksPXtesPr6LA174ob3n/gzeOf5eI5Gl/FTfCLmrN
         BPRBTqcL46jC9XSvwPbK5YVPa7vxeYgqjU8uhIxPOa2T5p3vhzSFKKuxosuHuaxfWUfY
         14+Q==
X-Gm-Message-State: ANoB5plgfso6p3JxnJHIAUZCPK1aSZ2tJU8IOOc0lHh6z+BPhyK+8nf4
        O/qrdDUnvDwN4Z4DAomOFmU=
X-Google-Smtp-Source: AA0mqf5WSh1ldUWiKlJTCUx19cpUJYc2SS9QTb71YZMoHc1TB56et+PDXLAokItPHooMeJ9Aa04teA==
X-Received: by 2002:a17:906:ca0e:b0:78c:1f2f:233e with SMTP id jt14-20020a170906ca0e00b0078c1f2f233emr64572621ejb.307.1670428574062;
        Wed, 07 Dec 2022 07:56:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709066b1200b007bf988ce9f7sm8715501ejr.38.2022.12.07.07.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 07:56:13 -0800 (PST)
Date:   Wed, 7 Dec 2022 18:56:09 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Yong Wu <yong.wu@mediatek.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/mediatek: Fix forever loop in error handling
Message-ID: <Y5C3mTam2nkbaz6o@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a typo so this loop does i++ where i-- was intended.  It will
result in looping until the kernel crashes.

Fixes: 26593928564c ("iommu/mediatek: Add error path for loop of mm_dts_parse")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 3e46bc8b0714..2badd6acfb23 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1160,8 +1160,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 	return 0;
 
 err_larbdev_put:
-	/* id may be not linear mapping, loop whole the array */
-	for (i = MTK_LARB_NR_MAX - 1; i >= 0; i++) {
+	for (i = MTK_LARB_NR_MAX - 1; i >= 0; i--) {
 		if (!data->larb_imu[i].dev)
 			continue;
 		put_device(data->larb_imu[i].dev);
-- 
2.35.1

