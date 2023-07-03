Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC10C001B0
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 14:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjGCORy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 10:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjGCORx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 10:17:53 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33207E5F
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 07:17:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-313fb7f0f80so4989374f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688393870; x=1690985870;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTlCyTZXo+b+onVAuuCqLFFIg0VR0QnZHvj+HALD0/4=;
        b=reQ/K4887bs6S4mnAfRPRNQkwgE+H+XF5H7ZAQ4m/dHTk/PBuGZmGaCV/O9LdUDA3C
         5MzWr4MJReXvaX/YFEH0k3fIgPFWMZJElrp7V0PHgWmH9bBg0juG6G7sD1JX4ef0UqCI
         wfH1jTCaz+HikHasy3P4pxiaLwW+V6PR5MHaaQfZGCODlDDH/ttRR+F7gCyiUfR03mCv
         byznfdUuMvYNXZ+bbKAV/tKahux7a/tyktjuvCTr56K9/jDD0dlSkLiljVXbY6siQlso
         t/50lycpzANpGuhLlUyWw0LovAFTidAwflC+pE1/BfOruSBZR8uhbnvN6Mzjgiga+RpI
         2rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393870; x=1690985870;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTlCyTZXo+b+onVAuuCqLFFIg0VR0QnZHvj+HALD0/4=;
        b=DPLqwghpA6pEWt18p6SAJ3uJ3m4CRZ005AwevXHSFktb5uGCHal/2AwcWuACRlZ9Ne
         Ne3Oy24hvAOM5d54lrLN89GsTkFKm8JnM5PharsA68jCerivFOOmL38t42zoiPtkf2bq
         bT32pSjE5cmR8MPCX8GaJ3BBkCVnxpLxc/F3CS64f2Hq1crRLBoHJVcmHktZmnWSPm1j
         pa+/+KD6jUyBz8GtAhuZ8Oh5ixZzu5C9SMlxLBimmfyVdcLubWLrhYm45vXfeMu9Nty+
         bLAUlpYTfJEt7mqdm8ZwgB1u9pmgUzI2/sNgiAUY3yIjd5qjwPGaXVtC4dNevfYIP55z
         opQA==
X-Gm-Message-State: ABy/qLZjKpJy0pJHo/Qm0dZz8uwvYVLsRhj2jDrq4JlMJcop4l8OfgUK
        Tk7qCWF22oxs5MHjJ6fzgWL+yQ==
X-Google-Smtp-Source: APBJJlFNDvE++efnK4/wCVBh9an2cyzkP7M2lnGk1BHoOdVrnxAO1pGnB2XpvdAfI4ivEdqKfioILQ==
X-Received: by 2002:adf:f504:0:b0:30f:be04:5b5e with SMTP id q4-20020adff504000000b0030fbe045b5emr7875625wro.37.1688393870728;
        Mon, 03 Jul 2023 07:17:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u2-20020adfdd42000000b00314326c91e2sm4465022wrm.28.2023.07.03.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 07:17:49 -0700 (PDT)
Date:   Mon, 3 Jul 2023 17:17:45 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Vishal Verma <vishal.l.verma@intel.com>
Cc:     Alison Schofield <alison.schofield@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Ben Widawsky <bwidawsk@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dave Jiang <dave.jiang@intel.com>, linux-cxl@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cxl/mem: Fix a double shift bug
Message-ID: <a11b0c78-4717-4f4e-90be-f47f300d607c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The CXL_FW_CANCEL macro is used with set/test_bit() so it should be a
bit number and not the shifted value.  The original code is the
equivalent of using BIT(BIT(0)) so it's 0x2 instead of 0x1.  This has
no effect on runtime because it's done consistently and nothing else
was using the 0x2 bit.

Fixes: 9521875bbe00 ("cxl: add a firmware update mechanism using the sysfs firmware loader")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/cxlmem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
index 79e99c873ca2..499113328586 100644
--- a/drivers/cxl/cxlmem.h
+++ b/drivers/cxl/cxlmem.h
@@ -323,7 +323,7 @@ struct cxl_mbox_activate_fw {
 
 /* FW state bits */
 #define CXL_FW_STATE_BITS		32
-#define CXL_FW_CANCEL		BIT(0)
+#define CXL_FW_CANCEL			0
 
 /**
  * struct cxl_fw_state - Firmware upload / activation state
-- 
2.39.2

