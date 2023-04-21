Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E71C7618E
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 10:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjDUKob (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 06:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjDUKoa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 06:44:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E5849E1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:44:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso976021f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682073868; x=1684665868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRR8QtsSmxjRIku5DkJBFiN+Snm7HpPNejtlu92e2h4=;
        b=As8nZXfVquw9bOEdzULHA3Not2GSqD1l15CQ2M3BHZeFQF6QIhBuJXv4rKzXgnCf/x
         hwwmG7K23HRwX4QLME9tdAlnvkQ5pFHWXSMFkDCmffcB0ezeQb80rpw56nYijTG4a66Q
         Z2A+KWB90RYWJ6dVCC9psjN5cJ5O2DAUcyhWPFUHQ93Tz0tfx9OjOOY/jwFRD8YQMzpS
         fQ3cjYV1u4B8kwAGZXKUMWfP4+JLDtEtwufk39DOkVyS27SbYEGiL846EQJucn6CzKdn
         dMhtwuxshqN4keKtc8HQCIILdGRh/C4ZosfNLrYNh5w4F5uJ9NeQxpJlrSxHGohHVs68
         YYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682073868; x=1684665868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRR8QtsSmxjRIku5DkJBFiN+Snm7HpPNejtlu92e2h4=;
        b=X94Ohyqup08thVi2/iYp1ewqfCaV93cf6BzoR3irTvE3IBVi/Lf+Y1YLxtY9ySQA1b
         VcNLVzWXneQh56pTdBY2rULBb2Chl8JIijSjPmLtaHWsHW+y7BpaMDCokkNCB8w8T912
         LqvP6ZIsfW1QiIIlhIiTcSxf0/WFMCwFNWpIe5p3AcUNPX5Qww0jBcmKiuz5G7mwiQnr
         eBLtrQy7lAXS49qSjo801N1ZjclvoH2FcgLe1R60jDC3mzggoUqke5/cdXxRuwXmZ/8f
         NSAhoS1TufcR4fgK53FWWMGJPMUL8YjA5Zz2PoOXwdG9s9tOtQilIGr0BL0xNRSQUcX/
         OEcA==
X-Gm-Message-State: AAQBX9cpA7G2kLEdL+Hi+QGMxLtWI3P61KWED7r/zzeuF2pqdndY6dAW
        gyqfI02Zd+bfH8UgLWHv9c51Hw==
X-Google-Smtp-Source: AKy350YqVVHeM1QoSPRQ7nVBEFDSMpaL/Zr5lSpChBMc9Htj57WjFH3Pkfbx1Vrf+uv56OTMxBtPBg==
X-Received: by 2002:adf:fecb:0:b0:2cb:2775:6e6 with SMTP id q11-20020adffecb000000b002cb277506e6mr3369289wrs.45.1682073867970;
        Fri, 21 Apr 2023 03:44:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f17-20020a5d50d1000000b002e5f6f8fc4fsm4085509wrt.100.2023.04.21.03.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 03:44:27 -0700 (PDT)
Date:   Fri, 21 Apr 2023 13:44:21 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: qcom: rmtfs: Fix error code in probe()
Message-ID: <76b21a14-70ff-4ca9-927d-587543c6699c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return an error code if of_property_count_u32_elems() fails.  Don't
return success.

Fixes: e656cd0bcf3d ("soc: qcom: rmtfs: Optionally map RMTFS to more VMs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/soc/qcom/rmtfs_mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index ce48a9f3b4c8..f83811f51175 100644
--- a/drivers/soc/qcom/rmtfs_mem.c
+++ b/drivers/soc/qcom/rmtfs_mem.c
@@ -233,6 +233,7 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
 		num_vmids = 0;
 	} else if (num_vmids < 0) {
 		dev_err(&pdev->dev, "failed to count qcom,vmid elements: %d\n", num_vmids);
+		ret = num_vmids;
 		goto remove_cdev;
 	} else if (num_vmids > NUM_MAX_VMIDS) {
 		dev_warn(&pdev->dev,
-- 
2.39.2

