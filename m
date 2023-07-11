Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57A9C0015E
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjGKGNS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjGKGNR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:13:17 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0ECE67
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:13:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3144bf65ce9so5452255f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055993; x=1691647993;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=ua13UnqckABF68hPbE6UQ667TIjzCruxMjbB+tXJdXEa5EnCIObMJPMAD1R6ih5FN+
         JSDlVQCQB2uLnwfDQ7ZFI5078E/gjT4swVWLVME+lexeTTp9f5Nwu5uD7ed0ZC9kHlun
         gOdU13Q336J1sSiOeGR+RIDHdUGw6fQ8WVZn1eFK++9PZA8LTuITH/cSh4tyuQURLHY5
         4uDMwuPJIyBzzcKmJurnxSzpG5uLLkRHUJoOjKBxHPVNihrOHgvrHyq11YOWUG9TuFUZ
         caxybXwFxRLKvH8iExuZLD6a9ctf4YWj3ODfdf2BSKfn4lu9qpFDOuTZOpcxRWapfihS
         iZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055993; x=1691647993;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=XrHTxX6HSt5YrfNOGM7fBvmUk65p0KduXHabDnF5mIuQsCCoFKwyfozrQO91EFwKUb
         zLKvyUIsB1YQRMgJ3wE/2ywBwnz/nBh7fR794jFg7p/JjSLt96IiwzJnWjn7BrC4Giov
         Iril3DHJe85YLpqEwSs5G3h5csRlZiVWQucqu+3PrZRGiz5ps6fn8WQLNxTPtYrPvyML
         xxW2TQOkL4XaJ2W0bveUX+d/dRWNhOQGF1hBOmkc/SPTzhJnVmFQ35KL+D2mhcyY6bWv
         V81jocnIrDHZZFHJuvWWyUlTM5XBEt8BODFya7wBm2DH9m9EGwlWKHdPlQykHbZO9aIR
         C8WQ==
X-Gm-Message-State: ABy/qLaY5D5FrzdtXIml4DdpsklN64vmUYeMh+AALOhEBBh+4jVjbi3r
        E21+Jno/f7ldXVKL/BkpajObUw==
X-Google-Smtp-Source: APBJJlGcVeS8URI28QoRPtrIWEWXAZd+Ufs2ZNLU4RJde8pqFYDhqzEmnE1m+xncQYFNft/X/DotqA==
X-Received: by 2002:adf:e682:0:b0:315:a17d:dbc6 with SMTP id r2-20020adfe682000000b00315a17ddbc6mr3020069wrm.14.1689055993304;
        Mon, 10 Jul 2023 23:13:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb46000000b0030ae3a6be4asm1263546wrs.72.2023.07.10.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:13:12 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:13:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 5/5 v3] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If get_user_pages_fast() allocates some pages but not as many as we
wanted, then the current code leaks those pages.  Call put_page() on
the pages before returning.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
no change

 drivers/accel/qaic/qaic_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d5ce36cb351f..9a6f80f31c65 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -425,9 +425,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 	}
 
 	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
-	if (ret < 0 || ret != nr_pages) {
-		ret = -EFAULT;
+	if (ret < 0)
 		goto free_page_list;
+	if (ret != nr_pages) {
+		nr_pages = ret;
+		ret = -EFAULT;
+		goto put_pages;
 	}
 
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
-- 
2.39.2

