Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB24EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 08:21:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjGKIVK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 04:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGKIVJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 04:21:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A96E79
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:21:06 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso5453603f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 11 Jul 2023 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063665; x=1691655665;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
        b=NoUPMC6dZeoMa8/E+BW4bns/yzCS0r1fbf8fMVW/3pn/55f1coshgfIRntvLgKepPU
         UmXlRW5EmUaoEYdNzZ6Mrr6jQ9ST+5BL/E7VQ2BFvT0KDdAsuddaRd04URW1dGUtPi/m
         3IUZbKyCpU9VgMlfrTIojA5vupDmWzb/bAXOGiqesyAIUmanavE1BBAEBI8QlEm1UvrS
         Ng3XRi6SIGi/glvJojiwZT5u3EkzxpdHlbnXCPiYUHmSwKlx/M6Yrmw16nI1QXuGHXUc
         /upYTptuHBRUBpKAmfRpRsXNQ8xyaTRqam+j5RXAZoBisa4pHtu978I6q8ppvnCgTNeb
         1arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063665; x=1691655665;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
        b=WsZWTYxyJDI7Z0z9dVmleC3Ez+iGBCFPPesNXdVQSkXdqlphlMNNclDZ+wQlMxAGcn
         Es97IEDl5ZI4fctTyAiDdb0GxlWrMptTZ3zJCoWWr2SEjBO8pRocZcFYCiQ0I7KUpDPe
         ZyCfDA0TXW3z2aBHulDlb0jRqbC0Wduhr7gfw+gYduGLHlMClwOqQIgZ6BvU0o9vNFfa
         PzcBrDi25IPQ9h80INAPLJPkqFkxbUt5NPMli58XU6YO167MknSRQioTyIwewmUw7TV9
         B+oGxuT3G/P6OIPn1z728MosGZ8dgdDEXHxjdrVUk6OCLye5hfWnqBLA+x9N6Li/QV+J
         qDxA==
X-Gm-Message-State: ABy/qLaavKpIMsH5I8ONmscA/wmi9PXnAjSZYXvDFNyK14RN7GvKiWsY
        1I8y70nU7/9zyXS9fmJV9aeq85qii7CfSJSJqI8=
X-Google-Smtp-Source: APBJJlE9i4XhHmQv1pBhQZUzsFzcV9eFjlSxljOGejA2W9oGWgdxxGZyfxWGUnUD4oZvCT2ekuvWAg==
X-Received: by 2002:a05:6000:1290:b0:315:a91c:1a8c with SMTP id f16-20020a056000129000b00315a91c1a8cmr169842wrx.22.1689063664992;
        Tue, 11 Jul 2023 01:21:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adff50a000000b003144bfbd0b3sm1576580wro.37.2023.07.11.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:21:04 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:21:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 3/5 v4] accel/qaic: Add consistent integer overflow checks
Message-ID: <ZK0Q7IsPkj6WSCcL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The encode_dma() function has integer overflow checks.  The
encode_passthrough(), encode_activate() and encode_status() functions
did not.  I added integer overflow checking everywhere.  I also
updated the integer overflow checking in encode_dma() to use size_add()
so everything is consistent.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: no change

 drivers/accel/qaic/qaic_control.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 752b67aff777..23680f5f1902 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -558,12 +558,10 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len > (UINT_MAX - QAIC_MANAGE_EXT_MSG_LENGTH))
-		return -EINVAL;
-
 	/* There should be enough space to hold at least one ASP entry. */
-	if (msg_hdr_len + sizeof(*out_trans) + sizeof(struct wire_addr_size_pair) >
-	    QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len,
+		     sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
+		     QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
@@ -635,7 +633,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -719,7 +717,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
-- 
2.39.2

