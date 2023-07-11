Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4CAC0015E
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 08:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbjGKIVP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 04:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjGKIVO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 04:21:14 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A87EE6B
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:21:13 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so8307143e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063671; x=1691655671;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxKFYbOeCPJfNoXrqBvsNS7aUlyz8/ToZjQNETQXPms=;
        b=dryEFzZ8771JS+Yz/dl8licnIGIt8/TaieUZTo0dhTADBi5ZZqEDWzTFcVSZW69cg/
         mte2HvFAYmplwn1fBsdMb+RWFF48RZQvnQUBSK6yI0MffjBx6rI3seun21yOv6kvRD8E
         vmiZwUPuOprz76Ocv/+VsASegG9eiN6uEbI2Z//moFEHtC8cvy7ZUhGNtso7/Umcx/kS
         LQ+jB49gBpqdD6Ad3FL3RFij4OL+kGLjV28h2RJhrFqpSP8qB0yVIehwgyCEd5/qMqx+
         t7JANG/W5CdKOH1Z5N+A9Kqraq/860FoFfc5hx7jh+lyr4VV1DJbxou5WR5DXDeBuj1b
         /8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063671; x=1691655671;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxKFYbOeCPJfNoXrqBvsNS7aUlyz8/ToZjQNETQXPms=;
        b=M4ihh/sFpCxyvtpmgjqrp5emldN1xFO8e9hI+89jCXZTcuU05OuZRFgsYn7+/kJcRK
         JjIwDcsBCNafzxIIRAcywGdG7Gao2eJtSTC0TH13CtTdqiC7KbyvGHtMlxO0nIo1L9do
         wGeq3oDOUZc3O36XdH/j+Q/Z7bnb++hOcQEVLo9X6CPtzo0FCnb1PxqKVsL5vb656St4
         k4338HUJ/SCC4Zw5VMYJbmTL5TtifIxkTFY2hCaRfqBFLc1oiLs1Xf5Q11JKO1WnCdr/
         U4FL3tWRBelost6fC1rMsAqdnZiKcH9HHp6THDxD/+W4mDLwaT8ZMOR6N0yxR/KFw0eP
         kAkA==
X-Gm-Message-State: ABy/qLY8Tsndgpi1pgzHuIB7a2OfiUfBXbdhyrRriJftoZIjcCoK10fa
        qVX5/RqjwKKjc1AEY0N1tkB94Q==
X-Google-Smtp-Source: APBJJlHWUMrcVV3AYfFcvmBu9p2eYaCi43r7UtCO6sh8OlRoN1RLLiuy84UaeWKCcjPqImedBSZb8w==
X-Received: by 2002:a05:6512:3f3:b0:4fb:772a:af19 with SMTP id n19-20020a05651203f300b004fb772aaf19mr10748069lfq.34.1689063670997;
        Tue, 11 Jul 2023 01:21:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d4a86000000b0030e5bd253aasm1567187wrq.39.2023.07.11.01.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:21:10 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:21:06 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 4/5 v4] accel/qaic: move and expand integer overflow checks
 for map_user_pages()
Message-ID: <ZK0Q8hNiX5JlUPm3@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The integer overflow checking for find_and_map_user_pages() was done in
encode_dma().  Presumably this was to do it before the allocation.  But
it's not super important that the failure path is a fast path and it
hurts readability to put the check so far from the where the variable is
used.

Move the check to find_and_map_user_pages() instead and add some more
additional potential integer overflow checks.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
no change

 drivers/accel/qaic/qaic_control.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 23680f5f1902..d5ce36cb351f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -402,6 +402,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
 
+	if (in_trans->size == 0 ||
+	    in_trans->addr + in_trans->size < in_trans->addr ||
+	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
+	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)
+		return -EINVAL;
+
 	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
 				  resources->xferred_dma_size, PAGE_SIZE);
 
@@ -564,9 +570,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 		     QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
-	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
-		return -EINVAL;
-
 	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
 	if (!xfer)
 		return -ENOMEM;
-- 
2.39.2

