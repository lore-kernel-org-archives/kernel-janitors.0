Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1059CC7EE22
	for <kernel-janitors@archiver.kernel.org>; Wed,  3 May 2023 10:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjECKlg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 May 2023 06:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjECKlf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 May 2023 06:41:35 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F72744A1
        for <kernel-janitors@vger.kernel.org>; Wed,  3 May 2023 03:41:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-306342d7668so1706214f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 03 May 2023 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683110492; x=1685702492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHsnWChYQT1z+NaKAydFHIQbH8RXi8T5lYad1K4Txs0=;
        b=lGacC+qgxPocSkx1r674MI1CUDVr3KX2qyaKs/LsCsd9gQ/L9HAOC+KCgMpeAGwHgx
         XZ7GUfebWa4+59RX0Ga72c/xyzbT/7EpW4EaKXD8u97PwnF+mqnxGct/Yuh5MYQhKB2N
         U85TB8Ry2jIg/2qRWK+vm+tFOYJ82rfE84Uitj9E022wxbJqqugwo1jKuRfhU5WkEVpB
         JipQvWyKi3FFssIeYhpixXB1I9av0BbZ25sXKym5f9NV5gLDdlnvLrp2VALBlza0CP8q
         ZCOkrxihaH8Buw+PR4dgL19xmNf69WlnX4KUV4GpQ1IWgcilZzznXZIkWu5qQha0zI3A
         8//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110492; x=1685702492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHsnWChYQT1z+NaKAydFHIQbH8RXi8T5lYad1K4Txs0=;
        b=cEeiV009wvJVftnhnQHzIUqQD9L2LcQS6sBeGAB0tk/Mgf7ywfETm9ltm4ZfhpTmQk
         fiSlsS5LQrtOtHioa72XU9+o9E/oL6DdORe3D+fBzq4JhAutZaD/2mBgzU5b9UW49dMj
         r9RjfhqujGR/5gcHqZdVDfVSjeozicEJJzsckedy+xLJvG66CJr/flYeWqrwflOD/oqn
         KXPfjmXYYELLAE70l927jk9kIToMU6wAYYFhj6WHLpzj6dcxq8hA2110dw9xQc+qk8TG
         N7ZWNs1LVot0/mkpm2d6FEsF1vHsF3pkRmoTv2rgZRGsuhMtYm80/tWLwV73aAAbMf+B
         tdgg==
X-Gm-Message-State: AC+VfDx6hnTbkwTrXKvGU5X32QNe662UhQzFvepE2/egJizQ/6ru/pmq
        bjae9vuOlPCW+o7OOkWS+I10+w==
X-Google-Smtp-Source: ACHHUZ4ALCcCvovKE4Kn+I+8rCSPqIU/QyVEb0IdNAZcF87Q/sIr8B4EDuni8XCKFY2XzWxIzm9ksw==
X-Received: by 2002:adf:ec04:0:b0:2f9:a798:602c with SMTP id x4-20020adfec04000000b002f9a798602cmr14969737wrn.12.1683110491914;
        Wed, 03 May 2023 03:41:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d574b000000b003049d7b9f4csm19417469wrw.32.2023.05.03.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:41:30 -0700 (PDT)
Date:   Wed, 3 May 2023 13:41:27 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Oded Gabbay <ogabbay@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/qaic: silence some uninitialized variable warnings
Message-ID: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that these are not initialized if get_cntl_version()
fails but we still print them in the debug message.  Not the end of
the world, but true enough.  Let's just initialize them to a dummy value
to make the checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index ff80eb571729..e10e8b603e37 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -263,7 +263,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev;
-	u16 major, minor;
+	u16 major = -1, minor = -1;
 	int ret;
 
 	/*
-- 
2.39.2

