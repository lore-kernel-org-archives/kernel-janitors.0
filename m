Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11EECDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 14:15:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377561AbjJTOPW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 10:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377557AbjJTOPU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 10:15:20 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFB6D71
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:15:18 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40651a726acso7157345e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697811317; x=1698416117; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=agU97H/2vTnmAhiVOl/EpZooICm5GX/GXF6bC4iMPNY=;
        b=zo9bAeVV5NS+Azov6qeBtGuLwUvpYB68/LnGXbIxdhNpj8ctnOn5Rjquunktq7bcC8
         Dgcl8KQpJlVIBgzcz+ACdLQxDYnxIYIuDCIJWbNiaqf3+rcbGUwryokwhEML7EJUVyBO
         NvwqHOcVOFKtxUwjLhepCcBrv/jucVl4sitRyUUEZPMl4mbaoOoj0n96kGYooLR2FWTp
         kmHBVlvwiuNdnMiB5no295ztZLAILTq7dDmCOqTCnBruO/pRoa2wOQv2sFfHhsQKvNJZ
         /5l4sMqMBtBjb8hmQ4h2QE+pPCTg7bffBq43/ZFdCUuNB+SpzbSWC7SBC+uhq+P3RsTq
         U9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697811317; x=1698416117;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agU97H/2vTnmAhiVOl/EpZooICm5GX/GXF6bC4iMPNY=;
        b=WNTg/pA+dRfWC6PP/p4VIDkCk81dCwA8K/fh7RQcQQWqiGVVcVesT0YZwullO9+SU2
         1WCRIp9afg4ExDc0srS/2ptZ9xn3mmtWmo/l2oCm78CqZouQ0pzzDvPRHsJGoSDazZRI
         o+6p+CybLtJ1D7Z6Wzl7as2RQvtMupNIVXVE6gJdSqxzL2f/lPAs5Ria1nHWgQrD/RoM
         4cdms1R7Fvd+LxcsUKKSF50SfJpi42AxBMG8M+chBItgsraHKkjAWTxU+QVWAAmdjefl
         cHkm9yHsrlSfxoEe02f85SwtP+A5A3nJ3C4pREQoUReC3FFgsXhMtRmrlQPntCG8lFNt
         FjRA==
X-Gm-Message-State: AOJu0Yyybq0xXRysBOuXE4Aw1w7WcfgxOsrqg46OR4EPnwbtlf0j1HM5
        OT1ejx1ibbST8Vw+7FaztOTSmQ==
X-Google-Smtp-Source: AGHT+IF28wzPvxuengyT7N7568Sy61LMK4AjoY5PbpVgf6pshQatTGH56/wzg30izlGJ7jl7CiRJpw==
X-Received: by 2002:a05:600c:198c:b0:406:4a32:1919 with SMTP id t12-20020a05600c198c00b004064a321919mr1674681wmq.29.1697811317063;
        Fri, 20 Oct 2023 07:15:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay10-20020a05600c1e0a00b00405442edc69sm4464528wmb.14.2023.10.20.07.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:15:16 -0700 (PDT)
Date:   Fri, 20 Oct 2023 17:15:12 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Wenchao Hao <haowenchao2@huawei.com>
Cc:     Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Vinod Koul <vkoul@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Douglas Gilbert <dgilbert@interlog.com>,
        dmaengine@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] scsi: scsi_debug: fix some bugs in sdebug_error_write()
Message-ID: <96d50cf7-afec-46af-9d98-08099f8dc76e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are two bug in this code:
1) If count is zero, then it will lead to a NULL dereference.  The
kmalloc() will successfully allocate zero bytes and the test for
"if (buf[0] == '-')" will read beyond the end of the zero size buffer
and Oops.
2) The code does not ensure that the user's string is properly NUL
terminated which could lead to a read overflow.

Fortunately, this is debugfs code and only root can write to it so
the security impact of these bugs is negligable.

Fixes: a9996d722b11 ("scsi: scsi_debug: Add interface to manage error injection for a single device")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/scsi/scsi_debug.c                      | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 67922e2c4c19..0a4e41d84df8 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -1019,14 +1019,9 @@ static ssize_t sdebug_error_write(struct file *file, const char __user *ubuf,
 	struct sdebug_err_inject *inject;
 	struct scsi_device *sdev = (struct scsi_device *)file->f_inode->i_private;
 
-	buf = kmalloc(count, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	if (copy_from_user(buf, ubuf, count)) {
-		kfree(buf);
-		return -EFAULT;
-	}
+	buf = strndup_user(ubuf, count + 1);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
 
 	if (buf[0] == '-')
 		return sdebug_err_remove(sdev, buf, count);
-- 
2.42.0

